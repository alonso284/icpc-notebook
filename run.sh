#!/bin/bash

# Check if the program parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <program>"
  exit 1
fi

program=$1

# Compile the program
g++ "$program/$program.cpp" -o "$program.exe" --std=c++20

# Check if the compilation was successful
if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

echo "Compilation successful. Running $program.exe with all .txt files as input."

# Run the program with all .txt files in the current directory as input
for input_file in *.txt; 
do
  if [ -f "$input_file" ]; then
    echo "Running $program.exe with input file $input_file"
    ./"$program.exe" < "$input_file"
  else
    echo "No .txt files found in the current directory."
    exit 1
  fi
done
