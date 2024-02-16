curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-contents/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Goo</p>\"}, \"name\": \"content\"}], \"contentStructureId\": \"${2}\", \"title\": \"Baker Article\"}" \
	-u "test@liferay.com:learn"