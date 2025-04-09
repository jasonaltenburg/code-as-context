#!/bin/zsh

# Check if a directory is provided as an argument; if not, prompt for it
if [[ $# -eq 0 ]]; then
    print -P "%BEnter the path to your codebase directory (e.g., ~/3dmmo):%b"
    read "code_dir?Path: "
elif [[ $# -eq 1 ]]; then
    code_dir="$1"
elif [[ $# -eq 2 ]]; then
    code_dir="$1"
    output_file="$2"
else
    echo "Usage: $0 <code_directory> [output_file]"
    exit 1
fi

# Ensure the directory exists and is absolute
if [[ ! -d "$code_dir" ]]; then
    echo "Error: '$code_dir' is not a valid directory."
    exit 1
fi
# Convert to absolute path
code_dir=$(realpath "$code_dir")

# Output file
if [[ -z "$output_file" ]]; then
    output_file="llm_code_as_context.txt"
fi

# Write the preface to the output file
cat << 'EOF' > "$output_file"
This file contains the contents of a codebase for LLM consumption.
Each file is separated by a delimiter in the format:
=== FILE: <relative_path_to_file> ===
The relative path is based on the root directory of the codebase.
Non-essential files (e.g., .git, node_modules, binaries) are excluded.
EOF

# Find all files in the codebase, excluding unwanted patterns, and append them
find "$code_dir" -type f \
    -not -path '*/.git/*' \
    -not -path '*/node_modules/*' \
    -not -name '*.o' \
    -not -name '*.a' \
    -not -name '*.so' \
    -not -name '*.pyc' \
    -not -name '*.class' \
    -not -name '*.bin' \
    -not -name '*.exe' \
    | while read -r file; do
        # Get the relative path from the codebase root
        rel_path=${file#$code_dir/}
        # Add delimiter and file path
        echo "\n=== FILE: $rel_path ===\n" >> "$output_file"
        # Append file contents
        cat "$file" >> "$output_file"
        # Add a newline for readability
        echo "" >> "$output_file"
    done

# Add a final delimiter
echo "\n=== END OF CODEBASE ===\n" >> "$output_file"
echo "Codebase has been written to '$output_file' in the current directory."
