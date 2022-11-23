# 使用

开发环境：ubuntu 22.04, bochs 虚拟机

## bootloader

````
make
# 制作boot.img
bximage
# 载入程序
dd if=bootloader/boot.bin of=boot.img bs=512 count=1 conv=notrunc
# 运行虚拟机
bochs -f ./bochsrc
```

````

