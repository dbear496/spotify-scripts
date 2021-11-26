#!/usr/bin/env bash

echo "running some sanity checks..."
for f in muteads.sh pausenext.sh muteads.service.template uninstall.sh; do
  if ! [ -f $f ]; then
    echo "$f does not exist. Make sure to run from the project directory."
    exit 1
  fi
done
echo "done running sanity chacks."


echo "installing spotify-scripts..."

echo "setting execute permission for scripts..."
chmod +x muteads.sh pausenext.sh uninstall.sh
echo "done setting execute permission for scripts."


echo "adding scripts to user's bin..."
if ! [ -d $HOME/bin ]; then
  echo "user does not have a bin directory; creating one"
  echo "shell must be restarted for custom commands to work"
  mkdir $HOME/bin
  needsrestart="yes"
fi

# ln -s `pwd`/muteads.sh $HOME/bin/muteads
# ln -s `pwd`/pausenext.sh $HOME/bin/pausenext
for s in muteads pausenext; do
  echo -e "#!/usr/bin/env bash\n`pwd`/$s.sh & disown -a" > $HOME/bin/$s
  chmod +x $HOME/bin/$s
done

echo "done adding scripts to user's bin."


echo "creating systemd service file..."
sed "s\\spotify-scripts\\`pwd`\\" muteads.service.template > muteads.service
echo "done creating systemd service file."
echo "starting systemd service..."
systemctl --user --now enable `pwd`/muteads.service
echo "done starting systemd service."

echo "done installing spotify-scripts."
