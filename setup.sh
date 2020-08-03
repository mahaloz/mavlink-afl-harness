# check parameter count 
if [ "$#" -ne 1 ]; then
    echo "Error: Not enough parameters"
    echo "Usage: ./setup /absolute/path/to/AFL/"
    exit 1
fi

# set the afl directory location
export AFL_DIR=$1

# init MavLink
git submodule update --init --recursive
sleep 2

# compile MavLink
(cd mavlink/pymavlink/ && tools/mavgen.py --lang=C --wire-protocol=2.0 --output=../../generated/include/mavlink/v2.0 ../message_definitions/v1.0/common.xml)

# compile the harness
cmake -Bbuild src && cmake --build build
