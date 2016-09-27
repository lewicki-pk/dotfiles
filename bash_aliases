alias :q=exit

# work aliases
alias NFS.export="sudo /usr/sbin/exportfs -va"

alias run-qtcreator="/home/repo/bin/Qt/Tools/QtCreator/bin/qtcreator &"

alias chdir_to_current='screen -X eval "chdir $PWD"'

function touch-timestamped() {
    NAME='date +%Y-%m-%d_%H-%M_'
    NAME=`$NAME$@`
    touch $NAME
}

function mkdir-timestamped() {
    NAME='date +%Y-%m-%d_%H-%M_'
    NAME=`$NAME$@`
    mkdir $NAME
}

function parse_image_packages() {
    bitbake -g $1 && cat pn-depends.dot | grep -v -e '-native' | grep -v digraph | grep -v -e '-image' | awk '{print $1}' | sort | uniq
}

# git aliases
alias gcommit="git commit "
alias gst="git status "
alias gadd="git add "
alias gpull="git pull "
alias gpush="git push "
alias gd="git diff "
alias gd.c="git diff --cached "
function g.vim.diff () {
    local VARIABLE="$(git diff --name-only)"
    if [ -n "$VARIABLE" ] ; then
        git diff --name-only | xargs nvim -p
    else
        echo "Nothing to open"
    fi
}
function g.vim.diff.cached () {
    local VARIABLE="$(git diff --cached --name-only)"
    if [ -n "$VARIABLE" ] ; then
        git diff --cached --name-only | xargs nvim -p
    else
        echo "Nothing to open"
    fi
}

alias list.all.users="cut -d: -f1 /etc/passwd"
alias log.pi='ssh root@10.0.0.15'
alias screens='screen -S'

alias clear_cache="free -h && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h"
alias vi=vim
alias vim=nvim
alias tmux.session='tmux new-session -d -s '

alias gmock_gen="~/repositories/googletest/googlemock/scripts/generator/gmock_gen.py "

function stopwatch() {
    #date +%H:%M:%S:%N
    #while true; do echo -ne "`date +%H:%M:%S:%N`\r"; done;
    #date1=`date +%s.%N`
    #while true; do
    #    curr_date=`date +%s.%N`
    #    subtr=`echo "$curr_date - $date1" | bc`
    #    echo -ne "$subtr\r";
    #    sleep 0.03
    #done;
    now=$(date +%s)sec
    while true; do
        printf "%s\r" $(TZ=UTC date --date now-$now +%H:%M:%S.%N)
        sleep 0.05
    done
}

# sshfs
alias mount.pi.home="sshfs -o idmap=user pi@raspberryPi:/home/pi /home/lewiatan/pi/home/"
alias mount.pi.openhab="sshfs -o idmap=user pi@raspberryPi:/opt/openhab /home/lewiatan/pi/openhab/"
alias unmount.raspberrypi="fusermount -u /home/lewiatan/pi/home/ ; fusermount -u /home/lewiatan/pi/openhab/"

alias remove.pi.ssh='ssh-keygen -f "/home/lewiatan/.ssh/known_hosts" -R raspberrypi'

alias list.apt.packages="dpkg --get-selections | grep -v deinstall"

function cd.up() {
    if [[ "$@" == "" ]] ; then
        cd ..
    else
        for i in $(seq 1 $@) ; do
            cd ..
        done
    fi
}
