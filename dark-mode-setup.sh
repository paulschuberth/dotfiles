#!/usr/bin/env bash

swiftc ./utils/notify.swift -o (brew --prefix)/bin/dark-mode-notify
user=$(id -u)
launchctl bootout gui/$user io.arslan.dark-mode-notify.plist
launchctl bootstrap gui/$user io.arslan.dark-mode-notify.plist
launchctl kickstart -k -p gui/$user/io.arslan.dark-mode-notify
