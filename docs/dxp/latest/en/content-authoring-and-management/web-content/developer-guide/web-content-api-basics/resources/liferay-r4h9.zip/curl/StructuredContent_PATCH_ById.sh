curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-contents/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Bar</p>\"}, \"name\": \"content\"}]}" \
	-u "test@liferay.com:learn"