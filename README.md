# MAVLink Fuzz Testing
## Instructions

1. Make sure clang and cmake are installed.

2. Git submodules:
```
git submodule update --init --recursive
```

3. Generate the C headers using pymavlink scripts from submodule:
```
(cd mavlink/pymavlink/ && tools/mavgen.py --lang=C --wire-protocol=2.0 --output=../../generated/include/mavlink/v2.0 ../message_definitions/v1.0/common.xml)
```

4. Run one of the fuzzer tests:

```
cmake -Bbuild src && cmake --build build && build/parser_brute_force CORPUS_DIR/
```

```
cmake -Bbuild src && cmake --build build && build/parser_with_assembled_message CORPUS_DIR/
```

```
cmake -Bbuild src && cmake --build build && build/parser_with_random_message CORPUS_DIR/
```

5. The fuzzer will run until it detects crash. To stop it just press Ctrl+C.

