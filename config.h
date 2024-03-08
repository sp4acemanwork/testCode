
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

