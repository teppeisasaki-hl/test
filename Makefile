test:
	go install github.com/zoncoen/scenarigo/cmd/scenarigo@v0.17.1
	scenarigo run -c ./scenarigo/scenarigo.yaml
	go mod tidy

test-ci:
	go install github.com/zoncoen/scenarigo/cmd/scenarigo@v0.17.1
	scenarigo plugin build -c ./scenarigo/scenarigo.yaml
	scenarigo run -c ./scenarigo/scenarigo.yaml

gen-api:
	oapi-codegen -old-config-style -generate "types" -package api ./openapi.yml > ./api/types.gen.go
	oapi-codegen -old-config-style -generate "chi-server" -package api ./openapi.yml > ./api/server.gen.go
	oapi-codegen -old-config-style -generate "spec" -package api ./openapi.yml > ./api/spec.gen.go