function fish_greeting
	command fortune -a | fmt -80 -s | eval (shuf -n 1 -e "ponysay" "ponythink")
end
