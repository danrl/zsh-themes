setopt prompt_subst
() {
	local promt_user_host
	if [[ $UID -ne 0 ]]; then
	promt_user_host='%F{green}%n@%M%f'
	else # root
	promt_user_host='%F{red}%n%M%f'
	fi

	local prompt_current_dir="%F{white}:%f%F{yellow}%~%f"

	local prompt_workspace=""
	local git_ref=$(git symbolic-ref HEAD 2> /dev/null)
	local git_status=$(git_prompt_status)
	if [[ -n $git_ref ]]; then
		prompt_workspace=" %F{white}‹%f%F{cyan}${git_ref#refs/heads/}"
		if [[ -n $git_status ]]; then
			prompt_workspace="${prompt_workspace} ${git_status}"
		fi
		prompt_workspace="${prompt_workspace}%f%F{white}›%f"
	fi

	PROMPT="╭─%B${promt_user_host}${prompt_current_dir}${prompt_workspace}%b
╰─➤ "
}
