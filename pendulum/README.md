How to run:
- Compile and create executable, then run .exe (-r):
nim c -r pendulum.nim
- Run executable by itself:
pendulum.exe

General Notes:
- Installed a bunch of libraries with nimble install
- Had to install OpenBLAS to use NumericalNim: https://sourceforge.net/projects/openblas/
- Had to install nim-lang server separately: nimble install nimlangserver

Source code changes:
Nim is still relatively niche, so there were some changes I had to make to source code or libraries.
- ggplotnim error caused by a type mismatch in untar package: I fixed it by changing an argument of gzdopen to an explicit C-compatible int: fd -> fd.cint
- ggplotnim issue where .png from from ggsave() is empty

Helpful documentation:
- Official Nim documentation: https://nim-lang.org/documentation.html
- An overview to Nim's scientific computing ecosystem: https://scinim.github.io/getting-started/overview/index.html
- Nim ODE tutorial: https://scinim.github.io/getting-started/numerical_methods/ode.html

Useful things I chose to use in Nim:
- Nim has a data type called std/rationals for exact arithmetic
- Nim's equivalent of Pandas, Datamancer
- Nim's equivalent of matplotlib, ggplotnim
- Nim's numerical algorithms library, Numericalnim