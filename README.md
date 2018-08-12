# easy_install_tensorflow
Install tensorflow with one command using makefile.

> The script support macOS only, other platform supporting will be hopefully coming soon ;). Feel free to post issues. 

# Prerequisites
- XCode
    - You may have to run these commands if the build script fail with the error:
    > `Xcode version must be specified to use an Apple CROSSTOOL. If your Xcode version has changed recently, try: "bazel clean --expunge" to re-run Xcode configuration`
    ```shell
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -license  # agree
    ```
    - For record, `sudo xcode-select -p` will prints the path to the currently selected  developer  directory.
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
