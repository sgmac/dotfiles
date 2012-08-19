### Dotfiles

These are my dotfiles. I've updated the old bash script with one more dynamic in ruby. I keep files for console and desktop. Basically the _install.rb_  does links to the _default_ files. In order to install _desktop_ config files (what includes console as well) :

```bash
 $ ruby install.rb  desktop
```

You can also unlink all the files under _ENV['HOME']_:
```bash
$ ruby install.rb unlink
```

If you want to add more dotfiles, drop the files in either default or desktop directories. On the top directory level, you will see folders such as _emacs.d_ or _vim_. By default I drop here the directories that should be linked to the topof my $HOME and they are not dependent neither on console nor desktop.

