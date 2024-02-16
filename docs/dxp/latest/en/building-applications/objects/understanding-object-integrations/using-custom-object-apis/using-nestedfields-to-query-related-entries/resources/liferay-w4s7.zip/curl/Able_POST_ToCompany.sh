curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/ables/" \
	-d "{\"name\": \"Able 1\", \"externalReferenceCode\": \"able-one\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/ables/" \
	-d "{\"name\": \"Able 2\", \"externalReferenceCode\": \"able-two\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/ables/" \
	-d "{\"name\": \"Able 3\", \"externalReferenceCode\": \"able-three\"}" \
	-u "test@liferay.com:learn"