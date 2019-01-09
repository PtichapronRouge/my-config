AGENT_FILE=~/.zsh/buffers/ssh-agent-thing

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	echo "Starting Agent"
	ssh-agent > $AGENT_FILE
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<$AGENT_FILE)"
fi
