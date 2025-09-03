# Google Scholar MCP Server
[![smithery badge](https://smithery.ai/badge/@JackKuo666/google-scholar-mcp-server)](https://smithery.ai/server/@JackKuo666/google-scholar-mcp-server)

🔍 Enable AI assistants to search and access Google Scholar papers through a simple MCP interface.

The Google Scholar MCP Server provides a bridge between AI assistants and Google Scholar through the Model Context Protocol (MCP). It allows AI models to search for academic papers and access their content in a programmatic way.

## ✨ Core Features
- 🔎 Paper Search: Query Google Scholar papers with custom search strings or advanced search parameters ✅
- 🚀 Efficient Retrieval: Fast access to paper metadata ✅
- 👤 Author Information: Retrieve detailed information about authors ✅
- 📊 Research Support: Facilitate academic research and analysis ✅

---

## 🚀 Quick Start & Setup Guide

This guide provides a reliable, step-by-step process to set up and run this server, especially on systems like Ubuntu where the default Python version may be older than the required Python 3.10+.

This process uses `pyenv` to manage Python versions, which avoids altering your system's default Python installation, making it a safe and non-destructive method.

### Step 1: Clone the Repository

First, clone the project to your local machine:
```bash
git clone https://github.com/JackKuo666/Google-Scholar-MCP-Server.git
cd Google-Scholar-MCP-Server
```

### Step 2: Install and Configure `pyenv`

`pyenv` allows us to install and use the required Python 3.10 without interfering with the system's default version.

1.  **Install `pyenv`:**
    ```bash
    curl https://pyenv.run | bash
    ```

2.  **Configure your shell for `pyenv`:**
    After installation, add the following lines to the end of your `~/.bashrc` file to ensure `pyenv` is loaded every time you open a terminal.
    ```bash
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init - bash)"
    ```
    Then, restart your shell or run `source ~/.bashrc`.

3.  **Install Python Build Dependencies:**
    To compile and install Python versions with `pyenv`, you need to install some build dependencies first.
    ```bash
    sudo apt-get update
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
    ```

4.  **Install Python 3.10:**
    Now, from within the project directory, `pyenv` will automatically read the `.python-version` file and install the correct version (3.10.13).
    ```bash
    pyenv install
    ```
    This step will take a few minutes as it downloads and compiles the Python source code.

### Step 3: Create a Startup Script

The `uvx` command used to launch the server might not automatically use the Python version managed by `pyenv`. To solve this, we'll create a simple startup script that ensures the correct environment is used.

Create a file named `run_server.sh` with the following content:

```bash
#!/bin/bash
set -e

# Activate the pyenv environment
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Install/verify dependencies using the correct pip
echo "--- Installing dependencies using Python $(python --version)... ---"
pip install -r requirements.txt

# Find the full path to the pyenv python executable
PYTHON_EXEC=$(which python)
echo "--- Starting server with Python executable: $PYTHON_EXEC ---"

# Run the server command, providing the full path to the correct python
uvx mcpo --port 8000 -- "$PYTHON_EXEC" google_scholar_server.py
```

### Step 4: Run the Server

1.  **Make the script executable:**
    ```bash
    chmod +x run_server.sh
    ```

2.  **Launch the server:**
    ```bash
    ./run_server.sh
    ```

The server should now start successfully on port 8000, using the correct Python version and with all dependencies installed.

## 🛠 MCP Tools

The Google Scholar MCP Server provides the following tools:

### search_google_scholar_key_words

Search for articles on Google Scholar using key words.

**Parameters:**
- `query` (str): Search query string
- `num_results` (int, optional): Number of results to return (default: 5)

**Returns:** List of dictionaries containing article information

### search_google_scholar_advanced

Perform an advanced search for articles on Google Scholar.

**Parameters:**
- `query` (str): General search query
- `author` (str, optional): Author name
- `year_range` (tuple, optional): Tuple containing (start_year, end_year)
- `num_results` (int, optional): Number of results to return (default: 5)

**Returns:** List of dictionaries containing article information

### get_author_info

Get detailed information about an author from Google Scholar.

**Parameters:**
- `author_name` (str): Name of the author to search for

**Returns:** Dictionary containing author information