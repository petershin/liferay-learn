curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/ables/" \
	-d "{\"name\": \"Able 1 - Foo\", \"externalReferenceCode\": \"able-one\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/ables/" \
	-d "{\"name\": \"Able 2 - Foo\", \"externalReferenceCode\": \"able-two\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/ables/" \
	-d "{\"name\": \"Able 3 - Foo\", \"externalReferenceCode\": \"able-three\"}" \
	-u "test@liferay.com:learn"