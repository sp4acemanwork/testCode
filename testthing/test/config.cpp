

#include "config.h"
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
        if (strcmp(arg, "debug") == 0)
          {
            this -> debug = true;
          }
        else if(strcmp(arg, "quiet") == 0)
          {
            this -> quiet = true;
          }
        else
          {
            std::string s = " Error: unrecognized argument: ";
            s += arg;
            throw std::runtime_error(s);
          }
        }
      }
      
