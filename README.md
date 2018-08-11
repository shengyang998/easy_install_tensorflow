# easy_install_tensorflow
Install tensorflow with one command using makefile.

> The script support macOS only, other platform supporting will be coming soon hopefully ;). Feel free to post issues. 

# Prerequisites
- XCode
- Pip

## Usage
If you have `GNU Make` installed already then you can run:
```shell
git clone https://github.com/shengyang998/easy_install_tensorflow.git && \
cd easy_install_tensorflow && make all -j2; 
```
to compile the package.
After that, you should run 
```shell
make install
```
to install the package.
