FILES := \
	${HOME}/.bashrc \
	${HOME}/.zshrc \
	${HOME}/.xsession \
	${HOME}/.config/nvim/init.vim \
	${HOME}/.config/nvim/autoload/plug.vim \
	${HOME}/.gitconfig \
	${HOME}/.config/dunst/dunstrc \
	${HOME}/.config/vifm/vifmrc \
	${HOME}/.config/vifm/colors/.git \
	${HOME}/.msmtprc \
	${HOME}/.mbsyncrc \
	${HOME}/.muttrc \
	${HOME}/.muttrc.gmail \
	${HOME}/.mailcap \
	${HOME}/.dwm/patches/super.diff \
	${HOME}/.dwm/patches/keys.diff \
	${HOME}/.st/patches/scrollback.diff \
	${HOME}/.st/patches/colors.diff \
	${HOME}/.st/patches/font.diff \
	${HOME}/.doom.d/init.el \
	${HOME}/.doom.d/config.el \
	${HOME}/.doom.d/packages.el \

all: $(FILES)

clean:
	rm $(FILES)

${HOME}/.config/nvim/init.vim:
	mkdir -p $(@D)
	ln -s $(realpath nvim/init.vim) $@

${HOME}/.config/nvim/autoload/plug.vim:
	mkdir -p $(@D)
	ln -s $(realpath nvim/plug.vim) $@

${HOME}/.st/patches/%.diff: st/%.patch
	mkdir -p $(@D)
	cp $< $@
	rm -f ${HOME}/.st/modified

${HOME}/.dwm/patches/%.diff: dwm/%.patch
	mkdir -p $(@D)
	cp $< $@
	rm -f ${HOME}/.dwm/modified

${HOME}/.config/vifm/vifmrc:
	mkdir -p $(@D)
	ln -s $(realpath vifmrc) $@

${HOME}/.config/vifm/colors/.git:
	rm -rf ${HOME}/.config/vifm/colors
	git clone https://github.com/vifm/vifm-colors \
		${HOME}/.config/vifm/colors

${HOME}/.xsession:
	ln -s $(realpath xsession) $@
	chmod +x $@

${HOME}/.config/dunst/dunstrc:
	mkdir -p $(@D)
	ln -s $(realpath dunstrc) $@

${HOME}/.%: %
	ln -s $(realpath $<) $@

${HOME}/.doom.d/init.el:
	mkdir -p $(@D)
	ln -s $(realpath doom.d/init.el) $@

${HOME}/.doom.d/config.el:
	mkdir -p $(@D)
	ln -s $(realpath doom.d/config.el) $@

${HOME}/.doom.d/packages.el:
	mkdir -p $(@D)
	ln -s $(realpath doom.d/packages.el) $@
