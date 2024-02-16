curl \
	"http://localhost:8080/o/c/ables/" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able 1\", \"externalReferenceCode\": \"able-one\"}" \
	-u "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able 2\", \"externalReferenceCode\": \"able-two\"}" \
	-u "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able 3\", \"externalReferenceCode\": \"able-three\"}" \
	-u "test@liferay.com:learn"