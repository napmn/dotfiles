if [[ $# -eq 1 ]]; then
    selected=$1
else
    items=`find ~/Projects/work -maxdepth 2 -mindepth 2 -type d`
    items+="\n`find ~/Projects/personal -maxdepth 1 -mindepth 1 -type d`"
    items+="\n`find ~/Projects/fun -maxdepth 1 -mindepth 1 -type d`"
    items+="\n`find ~/Projects/opensource -maxdepth 1 -mindepth 1 -type d`"
    selected=`echo "$items" | fzf`
fi

dirname=`basename $selected`

# try to change session based on name
tmux switch-client -t $dirname
if [[ $? -eq 0 ]]; then
    exit 0
fi

# load tmuxp config if exists
if [ -f ~/.config/tmuxp/$dirname.json ]; then
    tmuxp load $dirname -y
    exit 0
fi

# spawn and attach to new session
tmux new-session -c $selected -d -s $dirname && tmux switch-client -t $dirname || tmux new -c $selected -A -s $dirname
