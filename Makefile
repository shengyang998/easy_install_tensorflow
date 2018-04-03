all:
	@make prepare;
	@make download;
	cd tensorflow && ./configure && \
	bazel build --config=opt --local_resources 2048,.5,1.0 //tensorflow/tools/pip_package:build_pip_package && \
	rm -rf tmp && mkdir tmp && bazel-bin/tensorflow/tools/pip_package/build_pip_package ./tmp/tensorflow_pkg && \
	pip install /tmp/tensorflow_pkg/*;

prepare:
	brew install bazel || (brew upgrade bazel && brew cleanup bazel);
	pip install -U six numpy wheel;

download:
	git clone https://github.com/tensorflow/tensorflow;

clean:
	cd tensorflow && bazel clean && rm -rf tmp;
