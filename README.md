## one of the 132434723 makefile templates avaliable online

commands to run:
```
make build
make execute
make clean
```

- `make build` does the preprocessing, compilation, assembly and linking stage (i.e generate object files and final executable in the  `/build` directory)
- `make execute` simply runs the executable
- `make clean` removes the `build directory` if you want to rebuild your program

![make](https://github.com/btjm123/MakefileTemplate/assets/19306879/3640581e-7719-4865-a841-195b93aa1160)

interesting stuff i learnt along the way
- by convention, targets are supposed to match the filename in the filesystem but for targets such as `clean`, we mark it as a `PHONY` target. additionally this marker indicates that the fictional file 'clean' is always out of date  and `make clean` will always run regardless of the state of the filesystem.
- `?=` means variable is confiurable (up to user)
- the super odd if/else structure in Makefile
