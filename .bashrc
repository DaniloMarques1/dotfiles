# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export JAVA_HOME="$HOME/.jdks/jdk-11.0.1"
export PATH="$JAVA_HOME/bin/:$PATH"
export PATH="/usr/local/go/bin/:$PATH"
export PATH="/home/fitz/go/bin/:$PATH"
export PATH="/home/fitz/tools/:$PATH"
export PATH="/home/fitz/Android/Sdk/platform-tools/:$PATH"

alias l='git log'
alias s='git status'
alias gs='git show'
alias ga='git add'
alias gc='git commit'
alias d='git diff'
. "$HOME/.cargo/env"

parse_git_branch() {
    branch=$(git branch --show-current 2> /dev/null)
    if [[ -z "$branch" ]]; then
        branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    fi

    echo $branch
}
PS1='\e[93m\w \e[31m$(parse_git_branch)\e[00m\n\u@\h % '

export LOCALSTACK_API_KEY=1KEpzVyNtH
