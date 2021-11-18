#!/usr/bin/env bash

echo "removing sym-links to user's bin..."
rm $HOME/bin/{muteads,pausenext}
echo "done removing sym-links to user's bin."

echo "disabling systemd service..."
systemctl --user disable muteads.service
echo "done disabling systemd service."
