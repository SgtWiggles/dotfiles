set PATH ~/texlive/bin/x86_64-linux/ $PATH
set PATH ~/go/bin/ $PATH
#set PATH /usr/local/texlive/2018/bin/x86_64-linux $PATH
#set PATH /opt/texlive/2018/bin/x86_64-linux/ $PATH
set PERL5LIB /usr/share/perl5/core_perl/ $PERL5LIB
set TERM xterm-256color

setenv SSH_ENV $HOME/.ssh/environment

alias vi 'vim --servername "v"'
alias v 'vim --servername "v"'

#sh ~/.config/background-color.sh
#set -xU RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src/


setxkbmap -option caps:swapescape

function start_agent 
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end  
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end  
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else 
        start_agent
    end  
end


fish_vi_key_bindings

if [ -z $DISPLAY ]; and [ (tty) = /dev/tty1 ]; then
	#echo "Hello world"
	startx
end
