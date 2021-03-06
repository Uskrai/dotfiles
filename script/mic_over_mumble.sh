#!/bin/bash
set -euo pipefail
# To debug, uncomment the following line:
# set -x

# PAID = PulseAudio ID
# ID = PID / process ID

main () {
    prepare_env
    set_up
    echo "Press Return to shut down..."
    #read -n1 -s -r
    #shut_down
}

prepare_env () {
    if [ ! -e ~/.mic_over_Mumble ]; then
        mkdir ~/.mic_over_Mumble
    fi
    cd ~/.mic_over_Mumble

    echo "bonjour=true" > murmur.ini
    echo "bandwidth=130000" >> murmur.ini

    if [ ! -e ./initdone ]; then
        run_mumble_client_wizard
        touch ./initdone
    fi
}

run_mumble_client_wizard () {
    echo "You will need to configure Mumble client to use the lowest possible latency."
    echo "We will start Mumble now. Please complete setup wizard and go to settings to increase quality and decrease latency."
    echo "Also, mute your microphone (if you have one) in Mumble."
    echo "Then exit Mumble."
    mumble >/dev/null 2>&1
}

set_up () {
    start_mumble_server
    start_mumble_client
    change_pa_config
    echo "Done. Please use pavucontrol to ensure everything works."
}

shut_down () {
    echo "Shutting down..."
    stop_murmur_client
    stop_murmur_server
    restore_pa_config
}

start_mumble_client () {
    echo "Starting Mumble client..."
    mumble "mumble://localhost" >/dev/null 2>&1 &
    MUMBLE_CLIENT_ID=$!
    disown
    # Mumble is slow to launch, and the
    # user may need to click on OK button.
    sleep 15
}

stop_murmur_client () {
    echo "Stopping Mumble client..."
    kill -KILL "$MUMBLE_CLIENT_ID" || true
    sleep 2
}

start_mumble_server () {
    echo "Starting Mumble server (murmurd)..."
    murmurd -ini ./murmur.ini &
    # Murmur forks, so the PID acquired by `$!`
    # wouldn't help us much.
    sleep 5
}

stop_murmur_server () {
    echo "Stopping Mumble server..."
    # FIXME: find a better way to kill Murmur.
    pkill murmurd || true
}

change_pa_config () {
    echo "Changing PulseAudio configuration..."
    add_sink
    move_mumble_to_sink
    add_source
    set_default_source
}

restore_pa_config () {
    echo "Restoring PulseAudio configuration..."
    remove_source
    remove_sink
}

# PA utilities.

add_sink () {
    echo "Adding sink..."
    SINK_MODULE_PAID=$(pactl load-module \
        module-null-sink \
        sink_name=Loopback_of_Mumble \
        sink_properties=device.description=Loopback_of_Mumble)
    sleep 1
    SINK_PAID=$(get_sink_paid)
}

remove_sink () {
    pactl unload-module "$SINK_MODULE_PAID"
}

add_source () {
    echo "Adding a virtual microphone..."
    SOURCE_MODULE_PAID=$(pactl load-module \
        module-virtual-source \
        source_name=VirtualMic \
        master=Loopback_of_Mumble.monitor \
        source_properties=device.description=VirtualMic)
}

remove_source () {
    pactl unload-module "$SOURCE_MODULE_PAID"
}

move_mumble_to_sink () {
    MUMBLE_CLIENT_PAID=$(get_mumble_client_paid)
    pacmd move-sink-input "$MUMBLE_CLIENT_PAID" "$SINK_PAID"
}

set_default_source () {
    pactl set-default-source VirtualMic
}

# Data fetching & parsing.

get_mumble_client_paid () {
    pacmd list-sink-inputs |
        grep -F -e "index: " -e "media.name = " |
        cut_every_second_newline |
        grep -F -e "Mumble" |
        print_second_column
}

get_sink_paid () {
    pacmd list-sinks |
        grep -F -e "index: " -e "name: " |
        cut_every_second_newline |
        grep -F -e "Loopback" |
        cut_active_device_indicator |
        print_second_column
}

# https://serverfault.com/a/375098/449626
cut_every_second_newline () {
    awk 'ORS=NR%2?" ":"\n"'
}

print_second_column () {
    awk '{print $2}'
}

# See https://github.com/pzmarzly/mic_over_mumble/issues/5 .
# The initial whitespace may contain an asterisk if the current
# device is the default one.
cut_active_device_indicator () {
    cut -c 5-
}

main
