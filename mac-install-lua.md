# mac os install lua

	mkdir ~/web
	cd ~/web
	wget http://www.lua.org/ftp/lua-5.4.3.tar.gz
	tar zxf lua-5.4.3.tar.gz
	cd lua-5.4.3
	make macosx test
	sudo make install

# test lua
	% lua
	Lua 5.4.3  Copyright (C) 1994-2021 Lua.org, PUC-Rio
	> print("hello")
	hello
