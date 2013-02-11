### Dotfiles

I keep configuration files for both, console and desktop. Basically the _install.py_  does links to the _default_ files. In order to install _desktop_ config files just provide the desktop argument.

```bash
 $ python install.py desktop
```

You can also unlink all the files under _ENV['HOME']_:
```bash
$ python install.py unlink
```

