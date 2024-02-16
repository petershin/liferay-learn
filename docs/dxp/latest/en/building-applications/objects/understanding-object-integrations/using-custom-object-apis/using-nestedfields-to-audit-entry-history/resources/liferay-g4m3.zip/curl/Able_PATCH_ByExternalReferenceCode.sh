curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}" \
	-d "{\"name\": \"Able 1 - Bar\", \"externalReferenceCode\": \"able-one\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}" \
	-d "{\"name\": \"Able 1 - Goo\", \"externalReferenceCode\": \"able-one\"}" \
	-u "test@liferay.com:learn"