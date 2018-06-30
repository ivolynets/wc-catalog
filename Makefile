build: lint
	@go build

install: lint
	@go install

lint:
	@gofmt -w .
	@golint -set_exit_status
	@ls **/* | grep .\.go$ | xargs -L1 go vet

	