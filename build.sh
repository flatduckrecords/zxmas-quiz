#!/bin/sh
cat main.bas 1936.bas 1946.bas 1949.bas 1953.bas 1955.bas 1960.bas 1966.bas 1969.bas 1973.bas 1977.bas 1980.bas 1981.bas 1982.bas 1983.bas 1988.bas 1995.bas 1997.bas 1998.bas 2001.bas 2005.bas 2014.bas 2017.bas 2020.bas 2023.bas end.bas > game.bas
zmakebas -a 10 -l -n ZXmasTV -o loader.tap loader.bas
zmakebas -a 10 -l -n Quiz  -o game.tap game.bas
cat loader.tap screen.tap fzx.tap noise.tap game.tap > zxmastellyquiz.tap
rm game.bas game.tap loader.tap
open zxmastellyquiz.tap
