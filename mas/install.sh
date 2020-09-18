#!/bin/bash

apps=(
    "Alfred:405843582"
    "Magnet:441258766"
    "The Unarchiver:425424353"
    "Mate Translate:1005088137"
  )
for app in "${apps[@]}"; do
    name=${app%%:*}
    id=${app#*:}

    echo -e "Attempting to install $name"
    mas install "$id"
done
