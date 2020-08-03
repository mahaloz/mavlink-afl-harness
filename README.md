# MavLink AFL Harness
This a just the harnessing source code, and accompanying compile scripts, for
fuzzing the MavLink communication library. It is based on the repo for fuzzing
using LibFuzzer [here](https://github.com/Auterion/mavlink-fuzz-testing). 

## Instructions

1. Have [AFL](https://github.com/google/AFL) downloaded and compiled.

2. Git submodules:
```
git submodule update --init --recursive
```

3. Generate the C headers using pymavlink scripts from submodule:
```
(cd mavlink/pymavlink/ && tools/mavgen.py --lang=C --wire-protocol=2.0 --output=../../generated/include/mavlink/v2.0 ../message_definitions/v1.0/common.xml)
```

4. Configure the compiler for AFL
```
export AFL_DIR=/path/to/afl/dir/
```

5. Compile the Harnesses

```
cmake -Bbuild src && cmake --build build
```

5. Run AFL:
Example command:
```
/path/to/afl-fuzz -i in_dir -o out_dir build/single_byte_harness
```

