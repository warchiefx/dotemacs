# warchiefx's super duper emacs config. #

## Installation ##

Save this repository as ~/.emacs.d:

    $ git clone git@github.com:warchiefx/dotemacs.git ~/.emacs.d


Set a symlink to the .emacs file:

    $ ln -sf ~/.emacs.d/dotemacs.el ~/.emacs

Start your emacs and voila! First boot will take a while because it'll fetch
and install a lot of stuff from ELPA/MELPA. You might want to edit
`~/.emacs.d/site-wcx/wcx-generic.el` and uncomment your preferred font. I
prefer [Iosevka](https://github.com/be5invis/Iosevka).

### Dotfiles ###

Included in this repo are dotfiles for most of the coding tools I use. Please
check `~/.emacs.d/dotfiles` and symlink if necessary.

## Required software ##

- latest emacs (preferrably emacs-snapshot), stable also works.
- GNU Global (for code search/tag based navigation)
- Python/Virtualenv/Pylint (if coding python)
- Git (Magit!)

## Optional (maybe?) stuff ##

Clone and install ycmd (my completion framework of choice):

    $ ~/.emacs.d/scripts/build_ycmd.sh

This will clone `ycmd` as a submodule and compile the interpreters I use
(normall all except for the .NET stuff).
