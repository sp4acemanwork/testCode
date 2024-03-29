
#include <iostream>

#include <string>
#include "window.h"
#include "config.h"

int main(int argc, char** argv) 
{
    
  Window app = Gtk::Application::create("org.gtkmm.example.base");
  return app->make_window_and_run<Window>(argc,argv);
	


}
