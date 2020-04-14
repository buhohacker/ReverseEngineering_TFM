#!/bin/bash

### Runs the files find _libraries.sh and check_secure_library.py


# Run find _libraries.sh
echo -e "\n############################################\n"
echo -e "\n      STARTING find_libraries.sh            \n"
echo -e "\n############################################\n"
bash find_libraries.sh
echo -e "\n############################################\n"
echo -e "\n      END find_libraries.sh                 \n"
echo -e "\n############################################\n"

# Run check_secure_library.py
echo -e "\n############################################\n"
echo -e "\n      STARTING check_secure_library.py      \n"
echo -e "\n############################################\n"
python check_secure_library.py
echo -e "\n############################################\n"
echo -e "\n      END check_secure_library.py           \n"
echo -e "\n############################################\n"

# Execution time
