function fish_greeting
	command sh -c 'fortune -a | fmt -80 -s | $(shuf -n 1 -e "$(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n" "ponysay" "ponythink")'
end
