rsync -azP --exclude-from="$(git -C $1 ls-files --exclude-standard -oi --directory > /tmp/excludes; echo /tmp/excludes)" $@
