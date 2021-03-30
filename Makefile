.PHONY=build
build:
	docker build -t dis-cover \
		--build-arg USER_ID=$(shell id -u) \
		--build-arg GROUP_ID=$(shell id -g) .
	docker build -t dis-cover-alpine \
		--build-arg USER_ID=$(shell id -u) \
		--build-arg GROUP_ID=$(shell id -g) \
		-f Dockerfile.alpine .

.PHONY=shell
shell: build
	docker run --rm -v "${PWD}:/home/dis-cover/dis-cover" -it dis-cover bash

.PHONY=run_scenarios

# pip install dis-cover --no-index --find-links file:///home/dis-cover/dis-cover

run_scenarios: build
	docker run --rm -v "${PWD}:/home/dis-cover/dis-cover" -it dis-cover bash -c "\
		pip install -e /home/dis-cover/dis-cover &&\
		~/.local/bin/dis-cover -c case-studies/simple_inheritance.cpp -o case-studies/outputs &&\
	 	~/.local/bin/dis-cover -c case-studies/diamond_problem.cpp -o case-studies/outputs"

.PHONY=run_scenarios_alpine
run_scenarios_alpine: build
	docker run --rm -v "${PWD}:/home/dis-cover/dis-cover" -it dis-cover-alpine bash -c "\
		pip install -e /home/dis-cover/dis-cover &&\
		~/.local/bin/dis-cover -c case-studies/simple_inheritance.cpp -o case-studies/outputs &&\
		~/.local/bin/dis-cover -c case-studies/diamond_problem.cpp -o case-studies/outputs"

.PHONY=clean
clean:
	rm -rf case-studies/outputs/* dis_cover/__pycache__ */**/__pycache__ dis_cover.egg-info

.PHONY=lint
lint: build
	docker run --rm -v "${PWD}:/home/dis-cover/dis-cover" -it dis-cover black .
	docker run --rm -v "${PWD}:/home/dis-cover/dis-cover" -it dis-cover clang-format -i case-studies/*.cpp
