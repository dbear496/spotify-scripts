This is a collection of scripts that I use for controlling/automating Spotify.

### SCRIPTS
 - muteads.sh - Mutes Spotify sound while ads are playing.
 - pausenext.sh - Pauses playback when the next song starts. This is useful when you want to finish the current song before pausing.
 - install.sh - Installs the scripts automatically. (See INSTALLING section below.)
 - uninstall.sh - Uninstalls the scripts automatically. (See INSTALLING section below.)


### INSTALLING
To install the scripts, run the 'install.sh' script from the project directory. You may need to set the execute permission on this file in order to run it ('chmod +x install.sh').
This script will do the following:
 - Set the execute permission for the scripts.
 - Add scripts to the user's bin directory (and create the bin directory if necessary). The scripts in the bin directory will start the scripts from the project directory as a daemon.
 - Generate and enable a systemd service to automatically start muteads.sh on login.
If you do not want any of these, then do not run the install script; instead, you can install manually, or use without installing.
To uninstall, run uninstall.sh. This will remove the scripts from the user's bin, and it will disable the systemd service. Note, it will not remove the user's bin directory, even if it was created by install.sh, because it is possible that the bin directory is used for other programs.
