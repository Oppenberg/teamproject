all: docker_image/enwik8
	@docker build -t mgaillard/pxz_benchmark docker_image

docker_image/enwik8:
	@wget http://mattmahoney.net/dc/enwik8.zip
	@unzip enwik8.zip -d docker_image
	@rm enwik8.zip

.PHONY: clean

clean:
	@rm docker_image/enwik8
