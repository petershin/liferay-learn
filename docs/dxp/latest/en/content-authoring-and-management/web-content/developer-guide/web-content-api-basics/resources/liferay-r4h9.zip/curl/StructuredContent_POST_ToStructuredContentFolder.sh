curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${1}/structured-contents" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Foo</p>\"}, \"name\": \"content\"}], \"contentStructureId\": \"${2}\", \"title\": \"Charlie Article\"}" \
	-u "test@liferay.com:learn"