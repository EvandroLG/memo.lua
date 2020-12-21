.SILENT:

install_dependencies:
	luarocks install simple_test

test:
	LUA_PATH="./src/?.lua;./src/?/init.lua;./src/memoize/?.lua;;" lua test.lua
