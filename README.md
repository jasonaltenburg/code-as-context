# code-as-context: Codebase to LLM Context Converter

This Zsh script prepares a codebase for consumption by a Large Language Model (LLM). It traverses a specified directory, excludes non-essential files, and concatenates the remaining files into a single text file, with each file separated by a delimiter.

## Usage

```bash
./codebase_to_llm_context.zsh <path_to_codebase_directory> [output_file]
```

- `<path_to_codebase_directory>`: The path to the root directory of your codebase. If not provided, the script will prompt you for it.
- `[output_file]` *(optional)*: The name of the output file. If not provided, the script defaults to `llm_code_as_context.txt`.

## Output

The script generates a text file containing the concatenated codebase content. The default filename is `llm_code_as_context.txt`, but you can specify a custom name using the optional `output_file` argument.

## Excluded Files

The script automatically excludes the following:

- `.git/` directories  
- `node_modules/` directories  
- Files with the following extensions: `.o`, `.a`, `.so`, `.pyc`, `.class`, `.bin`, `.exe`

## Requirements

- Zsh
- Unix-like operating system (uses `find`, `cat`, `realpath`)

## Installation

1. Clone this repository.
2. Make the script executable:

   ```bash
   chmod +x codebase_to_llm_context.zsh
   ```

## License

MIT License

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. **Fork the repository** – this creates a copy in your GitHub account.
2. **Create a new branch** for your changes.
3. **Make your changes** – implement your feature, bug fix, or improvement.
4. **Test your changes** to ensure they work and don’t introduce new issues.
5. **Submit a pull request** to propose merging your changes into the main project.

Please ensure your code adheres to any existing style guidelines and that your commit messages are clear and descriptive.
