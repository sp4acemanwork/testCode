
#!/bin/bash
set -e
g++ -Wall main.cpp config.cpp -o test_run
./test_run $\*

