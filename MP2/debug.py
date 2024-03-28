# Import necessary libraries
from difflib import Differ
import sys

# ANSI escape codes for colors
COLORS = {
    "add": "\033[32m",  # Green
    "remove": "\033[31m",  # Red
    "reset": "\033[0m"  # Reset to default terminal color
}

# Function to read a file and return its contents as a list of lines
def read_file(filepath):
    with open(filepath, 'r') as file:
        return file.readlines()

# Function to compare two lists of lines and print the differences with color coding
def compare_and_print(file1_lines, file2_lines):
    differ = Differ()
    diff = differ.compare(file1_lines, file2_lines)
    for line in diff:
        if line.startswith('+ '):
            print(COLORS["add"] + line + COLORS["reset"], end='')
        elif line.startswith('- '):
            continue  # Skip unchanged lines
        else:
            print(COLORS["remove"] + line + COLORS["reset"], end='')

# Main function to load the files, compare them, and print the differences
def main(file1_path, file2_path):
    file1_lines = read_file(file1_path)
    file2_lines = read_file(file2_path)
    compare_and_print(file1_lines, file2_lines)

# Uncomment to run with example files (replace 'path_to_file1.txt' and 'path_to_file2.txt' with actual file paths)
main('./custom_2.out', './mp2_output/custom_2.out')
