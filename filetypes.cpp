[build-menu]
FT_00_LB=_Compile
FT_00_CM=g++ -O3 -static -o "%e" "%f" -std=c++17
FT_00_WD=
FT_01_LB=_Build
FT_01_CM=g++ -std=c++17 -Wshadow  -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
FT_01_WD=
