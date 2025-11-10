#/bin/sh

# add-zsh-hook -D chpwd chpwd_last_working_dir
cd $1
# add-zsh-hook chpwd chpwd_last_working_dir
exec bash
