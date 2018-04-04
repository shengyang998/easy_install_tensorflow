all:
	@make prepare;
	@make download && @make compile;

prepare:
	brew install bazel || (brew upgrade bazel && brew cleanup bazel);
	pip install -U six numpy wheel;

download:
	git clone https://github.com/tensorflow/tensorflow || echo "Please run 'make clean-all' and re-run 'make all'"

compile: tensorflow
	cd tensorflow && ./configure && \
	bazel build --config=opt --local_resources 2048,.5,1.0 //tensorflow/tools/pip_package:build_pip_package && \
	rm -rf tmp; mkdir tmp && bazel-bin/tensorflow/tools/pip_package/build_pip_package ./tmp/tensorflow_pkg

clean:
	bazel clean && rm -rf ./tensorflow/tmp;
	
clean-all:
	rm -rf ./tensorflow;
	
install:
	pip uninstall tensorflow; pip install ./tensorflow/tmp/tensorflow_pkg/*;

