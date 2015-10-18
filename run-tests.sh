#!/bin/sh

LUA="lua5.1"

# Generate classes
echo "Generating Classes:"
./classgen -i tests/test-variables.lua.cg
./classgen -i tests/test-speed.lua.fast.cg
./classgen -i tests/test-speed.lua.slow.cg
./classgen -i tests/test-collections.lua.cg
./classgen -i tests/test-advanced-collections.lua.cg

# Run tests
echo "Variable Test:"
$LUA tests/test-variables.lua
echo "Speed Test:"
$LUA tests/test-speed.lua
echo "Collections Test:"
$LUA tests/test-collections.lua
echo "Advanced Collections Test:"
$LUA tests/test-advanced-collections.lua
