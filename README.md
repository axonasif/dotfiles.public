This repo can serve as an example raw dotfiles filetree for use with https://github.com/axonasif/dotsh

You can put files directly from your `$HOME` directory (AKA `~/`) for use with `dotsh`.

Even if you have an existing dotfiles repo, this repo here could give you an basic idea of how `dotsh`'s own dotfiles installation may work, it's pretty simple.

# Special files

## `.dotfiles`

#### Ignore symlinking specific files

You can tell `dotsh` to ignore symlinking specific files by putting their relative path to an array called `ignore` on `.dotfiles` config file.

This can be helpful when you just want to keep some files inside your dotfiles repo but don't want to install them as symlinks.

For example, if you want to ignore `.bash_profile` and `.npmrc` file, you could put the following in [.dotfiles](./dotfiles):

```bash
ignore=(
  "/.bash_profile"
  "/.npmrc"
)
```

Wildcards are supported as well, the below will ignore all `.vscode` dirs:

```bash
ignore=(
  "*/.vscode/*"
)
```

#### Alternative filetree root

Let's say you have your raw dotfiles in a directory called `dots`, put the following in [.dotfiles](./dotfiles) to indicate that:

```bash
roots=(
  "/dots"
)
```

## No overwrite files

The following files from your dotfiles repo will not overwrite the existing host files but instead your ones will be virtually loaded after the existing ones to preserve integrity of the host system:

- .bashrc
- .bash_profile
- .zshrc
- .zprofile
- .kshrc
- .profile
- config.fish

These files can contain some crucial functions that may be lost if we do overwrite them.

