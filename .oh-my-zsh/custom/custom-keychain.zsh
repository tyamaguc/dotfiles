if whence keychain > /dev/null; then
    keychain ~/.ssh/id_rsa
    source $HOME/.keychain/$HOST-sh
fi
