This is a collection of scripts that I use for controlling/automating Spotify in Linux.


## SCRIPTS
 - `muteads.sh` - Mutes Spotify sound while ads are playing and unmutes when ads end.
 - `pausenext.sh` - Pauses playback when the next song starts. This is useful when you want to finish the current song before pausing.
 - `install.sh` - Installs the scripts automatically. (See INSTALLING section below.)
 - `uninstall.sh` - Uninstalls the scripts automatically. (See INSTALLING section below.)
 - `muteads` - Runs `muteads.sh` in the background. (available in ~/bin after installing)
 - `pausenext` - Runs `pausenext.sh` in the background. (available in ~/bin after installing)

#### Scripts in ~/bin
The commands that are labeled as "available in ~/bin" are added to ~/bin (which should be in your PATH by default) so you can easily use them from the command line or from the run-command prompt (Alt-F2). This means that you can run these by typing something like `muteads` instead of `path/to/spotify-scripts/muteads.sh`.


## INSTALLING
Clone the repository:
```
$ git clone https://github.com/dbear496/spotify-scripts.git
```

Step into the project directory:
```
$ cd spotify-scripts
```

Install dependencies:
```
$ sudo apt install playerctl
```

Set the execute permission for the installer:
```
$ chmod +x install.sh
```

Run the installer:
```
$ ./install.sh
```

#### Notes on installation with install.sh
The install script does the following:
 - Sets the execute permission for the scripts.
 - Adds scripts to the user's bin directory (and creates the bin directory if necessary).
 - Generates and enables a systemd service to automatically start muteads.sh on login.


If you don't want to use the install script, you can perform the above steps manually. If installing manually, then at the very minimum, you should set execute permissions and install playerctl (for pausenext).

#### Uninstalling
```
$ path/to/spotify-scripts/uninstall.sh
```
This will remove the scripts from ~/bin, and it will disable the systemd service. Note, it will not remove the ~/bin directory (even if it was created by install.sh) because it is possible that it is used for other programs.
