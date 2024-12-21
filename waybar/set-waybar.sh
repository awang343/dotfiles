#!/bin/sh

if [[ -z $1 ]]; then
    echo "Choose a schema from below"
    ls archive/ | grep ".jsonc" | sed -e 's/\.jsonc$//'
else
    ln -sf archive/"$1.jsonc" config.jsonc
    ln -sf archive/"$1.css" style.css
fi
