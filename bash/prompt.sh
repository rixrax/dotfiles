#!/bin/bash
readonly OLD_PS1=$PS1
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias resetps1='PS1=$OLD_PS1'

