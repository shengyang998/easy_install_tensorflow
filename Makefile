all:
	@make compile;

prepare:
	brew install bazel || (brew upgrade bazel && brew cleanup bazel);
	pip install -U six numpy wheel;

download:
	git clone --depth=1 https://github.com/tensorflow/tensorflow || echo "Git clone Error! Please run 'make clean-all' and re-run 'make all'"

compile: prepare download
	cd tensorflow && ./configure && \
	bazel build --config=opt --local_resources 2048,.5,1.0 //tensorflow/tools/pip_package:build_pip_package && \
	rm -rf tmp; mkdir tmp && bazel-bin/tensorflow/tools/pip_package/build_pip_package ./tmp/tensorflow_pkg || \
	rm -rf tmp; echo "\nPlease run 'make clean-all' and re-run 'make all'\nOr new a issue at https://github.com/shengyang998/easy_install_tensorflow/issues\n"

clean:
	cd tensorflow && bazel clean && rm -rf tmp;
	
clean-all:
	rm -rf ./tensorflow;
	
install:
	pip uninstall tensorflow; pip install ./tensorflow/tmp/tensorflow_pkg/*;

