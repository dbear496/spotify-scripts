This is a collection of scripts that I use for controlling/automating Spotify.

## SCRIPTS
 - muteads.sh - Mutes Spotify sound while ads are playing.
 - pausenext.sh - Pauses playback when the next song starts. This is useful when you want to finish the current song before pausing.
 - install.sh - Installs the scripts automatically. (See INSTALLING section below.)
 - uninstall.sh - Uninstalls the scripts automatically. (See INSTALLING section below.)

#### Convenience scripts in ~/bin
The automatic installer adds some commands to ~/bin so that you can easily invoke the scripts from the command line or from the run-command prompt (Alt-F2). The commands in ~/bin run the associated scripts as a daemon, so the command will return immediately and leave the script running in the background.


## INSTALLING
#### Install Dependencies
To install dependencies, run
```sudo apt install playerctl
```

#### Installation with install.sh
To do automatic installation, first set the execute permission on install.sh by running `chmod +x install.sh`; then run `./install.sh`
The install script will do the following:
 - Sets the execute permission for the scripts.
 - Adds scripts to the user's bin directory (and create the bin directory if necessary). The scripts in the bin directory will start the scripts from the project directory as a daemon.
 - Generates and enables a systemd service to automatically start muteads.sh on login.
If you do not want any of these, then do not run the install script; instead, you can install manually, or use without installing.
To uninstall, run uninstall.sh. This will remove the scripts from the user's bin, and it will disable the systemd service. Note, it will not remove the user's bin directory (even if it was created by install.sh) because it is possible that the bin directory is used for other programs.
