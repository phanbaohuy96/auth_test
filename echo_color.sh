#!/bin/bash

# Shell Script COLOR
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37


# define color
RED="1;31"
GREEN="1;32"
YELLOW="1;33"
LIGHT_CYAN="1;36"

# function echo text with color
# cmd:  echoColor <COLOR> <TEXT>
# EX:   echoColor $GREEN "Hello world!"
echoColor() {
    echo "\033[$1m $2\033[0m"
}