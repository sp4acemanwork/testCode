
#!/bin/bash
set -e
g++ -Wall main.cpp config.cpp -o sortingAlgos_run
./sortingAlgos_run $*

