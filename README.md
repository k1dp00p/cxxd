# cxxd
make a colored hexdump by mapping single-byte values to 256 colors

## usage
```
$ ./cxxd.sh file
```

## example
![example.png](https://user-images.githubusercontent.com/123702892/215841264-13750994-287d-4100-b0d4-dec122c5864a.png)

## info
the correspondence between single-byte values (0x00-0xff) and colors (256 colors) can be found with the following command
```
$ seq 0 255 | xargs -I hex printf "\033[48;5;hexm \033[m\033[38;5;hexm%02x" hex
```
![colors.png](https://user-images.githubusercontent.com/123702892/215849995-4004d5be-e312-4649-aa9d-ce3967dad867.png)
