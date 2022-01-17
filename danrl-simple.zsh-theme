setopt prompt_subst
() {
	prompt_user_host() {
		if [[ $UID -ne 0 ]]; then
			echo -n '%F{green}%n@%m%f'
		else # root
			echo -n '%F{red}%n@%m%f'
		fi
	}

	prompt_cwd() {
		echo -n '%F{white}:%f%F{yellow}%~%f'
	}

	prompt_git() {
		local git_ref=$(git symbolic-ref HEAD 2> /dev/null)
		if [[ -n $git_ref ]]; then
			echo -n " %F{white}‹%F{cyan}${git_ref#refs/heads/}$(git_prompt_status)%F{white}›%f"
		fi
	}

	PROMPT='╭─%B$(prompt_user_host)$(prompt_cwd)$(prompt_git)%b
╰─➤ '
}
