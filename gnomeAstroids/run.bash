
#!/bin/bash
set -e
g++ -Wall main.cpp config.cpp -o Astroids_run `pkg-config --cflags --libs gtkmm-4.0`
./Astroids_run

