alias :q=exit

# work aliases
alias NFS.export="sudo /usr/sbin/exportfs -va"

alias run-qtcreator="~/Qt/Tools/QtCreator/bin/qtcreator &"

alias chdir_to_current='screen -X eval "chdir $PWD"'

function touch-timestamped() {
    NAME='date +%Y-%m-%d_%H-%M_'
    NAME=`$NAME$@`
    touch $NAME
}

function mkdir-timestamped() {
    NAME='date +%Y-%m-%d_'
    NAME=`$NAME$@`
    mkdir $NAME
}

function mkdir-timestamped-precise() {
    NAME='date +%Y-%m-%d_%H-%M_'
    NAME=`$NAME$@`
    mkdir $NAME
}

# bitbake aliases and functions

function parse_image_packages() {
    bitbake -g $1 && cat pn-depends.dot | grep -v -e '-native' | grep -v digraph | grep -v -e '-image' | awk '{print $1}' | sort | uniq
}

function bitbake.with.clean() {
    bitbake "$@" -c clean && bitbake "$@"
}

function bitbake.with.cleanall() {
    bitbake "$@" -c cleanall && bitbake "$@"
}

# git aliases
alias gcommit="git commit "
alias gst="git status "
alias gs="git status -sb"
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
tmux.outside.session() {
    tmux new-session -d -s "$@" ; tmux att
}
tmux.inside.session() {
    tmux new-session -d -s "$@" ; tmux switch-client -t "$@"
}


alias gmock_gen="~/repositories/googletest/googlemock/scripts/generator/gmock_gen.py "

function stopwatch() {
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

function filter.packages.with.versions () {
    cat pn-depends.dot | grep -v -e '-native' | grep -v -e 'digraph' | grep -v -e '-image' | grep -v -e '->' | sed 's/.*label="\(.*\)\\n.*/\1/' | sort
}

alias cmake.eclipse="cmake -G\"Eclipse CDT4 - Unix Makefiles\" -D CMAKE_BUILD_TYPE=Debug"

alias clang-format="clang-format -style=file "

alias reboot='echo "Do not reboot here you idiot!"'

# Work aliases
#alias ssh.to.toradex='ssh -oCiphers=aes128-ctr'
#alias scp.to.toradex='scp -oCiphers=aes128-ctr'
#alias bs.mount.build.server="sshfs -o allow_other buildserver:/home/username/ /home/username/"
#alias bs.unmount.build.serwer="sudo fusermount -u /home/username"
#alias vi.logs="vi -u ~/Documents/logs/nvimrc.logs"
#alias elvi="vim -u ~/elfinrc"

alias wlog="vi /home/piotr/wlog/week`date +%U`.md"
alias run-vym='nohup vym ~/Documents/Workplan.vym &'
alias run-remarkable='nohup remarkable &'
alias run-eclipse='nohup /home/piotr/repo/eclipse/eclipse &'
