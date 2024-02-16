curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/charlies/batch" \
	-d "[{\"name\": \"Charlie 1\", \"externalReferenceCode\" : \"charlie-one\"}, {\"name\": \"Charlie 2\", \"externalReferenceCode\" : \"charlie-two\"}, {\"name\": \"Charlie 3\", \"externalReferenceCode\" : \"charlie-three\"}]" \
	-u "test@liferay.com:learn" 