#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Please provide a class name as an argument."
    exit 1
fi
# name dir by name if spef otherwise name by spef class name  
if [ -z "$2" ];then

	echo "no folder name provided naming folder after specified class"
	directory_name="$1"
else
	echo "createing dir with name {$2}"
	directory_name="$2"	
fi

# Create the directory
mkdir $directory_name

# Change into the directory
cd $directory_name
#def vars for env
class_name="$1"
main="main.cpp"
header_file="${class_name}.h"
cpp_impl_file="${class_name}.cpp"
config_header="config.h"
config_file="config.cpp"
make_file="run.bash"

# Create the C++ source file
echo -e "
#include <iostream>\n
#include <string>\n
#include \"${cpp_impl_file}\"\n\n
#include \"config.h\"

int main(int argc, char** argv) {\n    
	
	std::cout << \"Hello, World!\" << std::endl;\n    
	printHello();\n    	
	return 0;\n

}" > $main

# Create the header file
echo -e "#ifndef ${class_name}_H\n#define ${class_name}_H\n\nvoid printHello();\n\n#endif" > $header_file

# Create the C++ source file that implements the function declared in the header
echo -e "#include <iostream>\n#include \"${class_name}.h\"\n\nvoid printHello() {\n    std::cout << \"Hello from the header file!\" << std::endl;\n}" > $cpp_impl_file
#Create header file for config class
echo -e "
#ifndef config_h
#define config_h
#include <string>

class Config{
	public:
	// Debug flag
	bool debug;
	bool quiet;
	//constructor
	Config();
	//destroctor
	virtual  ~Config();
	//pars command line args
	void parse_flags(int argc, char** argv);
	//acc func for flags
	bool get_debug_flag();
	bool get_quiet_flag();
};
//declare global
extern Config config;
void log(const std::string&);
#endif
" > $config_header
#Create config.cpp 
echo -e "

#include \"config.h\"
#include <iostream>
#include <string.h>

Config config;


// print if in debug mode

void log(const std::string& s)
{
	if (config.debug)
	{
		std::cout << s << std::endl;
	}
}






Config::Config()
{
	this->debug = false;
	this->quiet = false;
}

Config::~Config()
{
}

void Config::parse_flags(int argc, char** argv)
{
	for (int i = 1; i < argc; i++)
	{
		char* arg = argv[i];
		if (strcmp(arg, \"debug\") == 0)
		{
			this -> debug = true;
		}
		else if(strcmp(arg, \"quiet\") == 0)
		{
			this -> quiet = true;
		}
		else
		{
			std::string s = \" Error: unrecognized argument: \";
			s += arg;
			throw std::runtime_error(s);
		}
	}
}
" > $config_file

#Create run file
echo -e "
#!/bin/bash
set -e
g++ -Wall main.cpp config.cpp -o ${class_name}_run
./${class_name}_run $*
">$make_file
#make build script exicuteable 
chmod +x $make_file

# Display a success message
echo "Directory '$directory_name' created with C++ '$class_name' 'Hello World' program and header files."




