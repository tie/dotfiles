function fish_greeting
	# Ponies in VT are not beautiful and colorful :[
	if not string match -rq '^/dev/tty[0-9]*$' (tty)
		command fortune -a | fmt -80 -s | eval (shuf -n 1 -e "ponysay -b unicode" "ponythink")
	end
end
