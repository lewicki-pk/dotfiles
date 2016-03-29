alias :q=exit
alias log.build.server="ssh piotr.lewicki@192.168.2.9"
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

# sshfs
alias mount.raspberrypi="sshfs -o idmap=user pi@raspberryPi:/home/pi /home/lewiatan/raspberryFS/"
alias unmount.raspberrypi="fusermount -u /home/lewiatan/raspberryFS"

alias mount.build.server="sshfs piotr.lewicki@192.168.2.9:/home/piotr.lewicki/ /home/piotr.lewicki/"
alias unmount.build.serwer="sudo fusermount -u /home/piotr.lewicki"
alias remove.pi.ssh='ssh-keygen -f "/home/lewiatan/.ssh/known_hosts" -R raspberrypi'

alias list.apt.packages="dpkg --get-selections | grep -v deinstall"
