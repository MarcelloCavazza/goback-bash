export LAST_WD_FILE="$HOME/.variables"

# Overriding 'cd' method and storing the current directory before changing
function cd() {
   echo "export LAST_WD=$(pwd)" > "$LAST_WD_FILE";
   builtin cd "$@";
}

# Method 'gb' (go back) to return to the last working directory before the last 'cd'
function gb() {
  if [ -f "$LAST_WD_FILE" ]; then
    source "$LAST_WD_FILE"
    if [ -n "$LAST_WD" ]; then
      cd "$LAST_WD"
    else
      echo "No recent working directory found in $LAST_WD_FILE."
    fi
  else
    echo "File $LAST_WD_FILE not found."
  fi
}

