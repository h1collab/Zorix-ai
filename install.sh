#!/bin/bash
set -e

curl -L -o /tmp/zorix-ai.deb \
https://github.com/h1collab/Zorix-ai/releases/latest/download/zorix-ai.deb

sudo dpkg -i /tmp/zorix-ai.deb || sudo apt -f install -y
