if ! command -v asdf &>/dev/null; then

	ASDF_VERSION=$(curl -s "https://api.github.com/repos/asdf-vm/asdf/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "v$ASDF_VERSION"

	source "$HOME/.asdf/asdf.sh"
	source "$HOME/.asdf/completions/asdf.bash"

	# Install latest nodejs and ruby
	asdf plugin-add nodejs
	asdf plugin-add ruby

	asdf install nodejs latest
	asdf install ruby latest
	asdf global nodejs latest
	asdf global ruby latest
fi
