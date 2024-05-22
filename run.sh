#!/bin/bash

problem="$1"

# Compile the C++ code
g++ "$problem/$problem.cpp" -o "$problem/$problem.exe"

# Run the executable with input from in*.txt
for input_file in $problem/*.txt; do
    echo "Input from $input_file:"
    echo 
    cat "$input_file"
    echo
    echo "Output:"
    echo
    ./"$problem/$problem.exe" < "$input_file"
    echo
    echo "------------------------------------------"
done

