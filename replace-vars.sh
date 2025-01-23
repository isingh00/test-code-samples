#!/bin/bash

replace_in_file() {
  local file="$1"
  cp "$file" "$file.bak"
  for var in $(env | cut -d= -f1); do
   if grep -q "\${$var}" "$file"; then
      echo "Replacing \${$var} with ${!var} in $file"
      sed -i "s|\${$var}|${!var}|g" "$file"
    fi
  done
  cat "$file"
  echo "========================" 
  rm "$file.bak"
}

find /code/ -type f \( -iname "*.java" -o -iname "*.py" -o -iname "*.mjs" -o -iname "*.go" -o -iname "*.php" -o -iname "*.rb" -o -iname "*.cs"  -o -iname "*.sh" \) | while read -r file; do
    replace_in_file "$file"
done
echo "Variable replacement completed."
