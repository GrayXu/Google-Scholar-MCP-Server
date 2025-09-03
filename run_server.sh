#!/bin/bash
set -e
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Find the full path to the python executable in the pyenv environment
PYTHON_EXEC=$(which python)

echo "--- Using Python executable: $PYTHON_EXEC ---"

# Now, run the original command, but instead of just 'python',
# provide the full path to the correct python executable.
uvx mcpo --port 8000 -- "$PYTHON_EXEC" google_scholar_server.py
