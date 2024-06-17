install:
	stow --restow -v --target=$$HOME dots
	stow --restow -v --target=$$HOME/.config config
uninstall:
	stow --delete -v --target=$$HOME dots
	stow --delete -v --target=$$HOME/.config config
