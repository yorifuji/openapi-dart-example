
clean:
	-rm -rf openapi/client
	-rm -rf openapi/generated

generate: clean
	openapi-generator generate -i openapi/openapi.yml -g openapi-yaml -o ./openapi/generated
	openapi-generator generate -i openapi/openapi.yml -g dart-dio -o ./openapi/client
	cd ./openapi/client && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

mock-server:
	cd openapi && docker-compose up
