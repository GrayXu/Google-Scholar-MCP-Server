#!/bin/bash
set -e
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
pyenv install 3.10.13
