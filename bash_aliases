alias :q=exit
alias log.build.server="ssh piotr.lewicki@buildServer"
alias log.lab.stand="ssh root@192.168.2.77"


# work aliases
alias NFS.export="sudo /usr/sbin/exportfs -va"

alias run-qtcreator="/home/repo/bin/Qt/Tools/QtCreator/bin/qtcreator &"

alias chdir_to_current='screen -X eval "chdir $PWD"'

function create-timestamped() {
NAME='date +%Y-%m-%d_%H-%M_'
NAME=`$NAME$@`
touch $NAME
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

alias list.all.users="cut -d: -f1 /etc/passwd"
alias log.pi='ssh root@10.0.0.15'
alias screens='screen -S'
alias ssh.to.toradex='ssh -oCiphers=aes128-ctr'
alias scp.to.toradex='scp -oCiphers=aes128-ctr'
alias kill_PDVid="ps aux | grep PDVid | grep -v grep| cut -f 5-7 -d ' ' | xargs kill -9"

alias clear_cache="free -h && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h"
alias vi=vim
alias vim=nvim
alias tmux.session="tmux new -s "
alias tmux.attach="tmux attach -t "

alias gmock_gen="~/repositories/googletest/googlemock/scripts/generator/gmock_gen.py "

# sshfs
alias mount.pi.home="sshfs -o idmap=user pi@raspberryPi:/home/pi /home/lewiatan/pi/home/"
alias mount.pi.openhab="sshfs -o idmap=user pi@raspberryPi:/opt/openhab /home/lewiatan/pi/openhab/"
alias unmount.raspberrypi="fusermount -u /home/lewiatan/pi/home/ ; fusermount -u /home/lewiatan/pi/openhab/"

alias mount.build.server="sshfs piotr.lewicki@buildServer:/home/piotr.lewicki/ /home/piotr.lewicki/"
alias unmount.build.serwer="sudo fusermount -u /home/piotr.lewicki"
alias remove.pi.ssh='ssh-keygen -f "/home/lewiatan/.ssh/known_hosts" -R raspberrypi'

alias list.apt.packages="dpkg --get-selections | grep -v deinstall"

alias elvim="vim -u ~/elfinrc"

function cd.up() {
    if [[ "$@" == "" ]] ; then
        cd ..
    else
        for i in $(seq 1 $@) ; do
            cd ..
        done
    fi
}
