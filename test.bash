#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Please provide a directory name as an argument."
    exit 1
fi

# Use the first argument as the directory name
directory_name="$1"

# Create the directory
mkdir $directory_name

# Change into the directory
cd $directory_name

# Use the argument as the base name for the files
cpp_file="${directory_name}.cpp"
header_file="${directory_name}.h"
cpp_impl_file="${directory_name}_impl.cpp"

# Create the C++ source file
echo -e "#include <iostream>\n#include \"${directory_name}.h\"\n\nint main() {\n    std::cout << \"Hello, World!\" << std::endl;\n    printHello();\n    return 0;\n}" > $cpp_file

# Create the header file
echo -e "#ifndef ${directory_name}_H\n#define ${directory_name}_H\n\nvoid printHello();\n\n#endif" > $header_file

# Create the C++ source file that implements the function declared in the header
echo -e "#include <iostream>\n#include \"${directory_name}.h\"\n\nvoid printHello() {\n    std::cout << \"Hello from the header file!\" << std::endl;\n}" > $cpp_impl_file

# Display a success message
echo "Directory '$directory_name' created with C++ 'Hello World' program and header files."

