# cxxd
make a colored hexdump by mapping single-byte values to 256 colors

## usage
```
$ ./cxxd.sh [-n bytes] file
```

## example
![example.png](https://user-images.githubusercontent.com/123702892/215841264-13750994-287d-4100-b0d4-dec122c5864a.png)
```
$ echo -en "\x0d\x0d\x3f\x3f\x0d\x00\x00\x5e\x00\x0d\x3f\x3f\x0d\x0d\x00\x5e\x00\x0d\xe4\x10\xe4\x10\x00\x5e\x00\x64\xe4\xe4\xe4\xe4\x00\x5e\x0d\x0d\x3f\x3f\x3f\x0d\x0d\xe4\xe4\x5e\x82\x82\xf7\x5e\x00\x5e\x00\x0d\x0d\x0d\x0d\x0d\x00\x5e\x0d\x5e\x0d\x0d\x0d\x5e\x00\x5e" | ./cxxd.sh -n 8
```
![example_wizzy.png](https://user-images.githubusercontent.com/123702892/215890585-bff15c99-2d03-4009-a5c0-9de2ef49e190.png)

## info
the correspondence between single-byte values (0x00-0xff) and colors (256 colors) can be found with the following command
```
$ seq 0 255 | xargs -I hex printf "\033[48;5;hexm \033[m\033[38;5;hexm%02x" hex
```
![colors.png](https://user-images.githubusercontent.com/123702892/215849995-4004d5be-e312-4649-aa9d-ce3967dad867.png)
