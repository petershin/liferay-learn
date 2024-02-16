curl \
	"http://localhost:8080/o/c/charlies/batch" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "[{\"name\": \"Charlie 1\", \"externalReferenceCode\" : \"charlie-one\"}, {\"name\": \"Charlie 2\", \"externalReferenceCode\" : \"charlie-two\"}, {\"name\": \"Charlie 3\", \"externalReferenceCode\" : \"charlie-three\"}]" \
	-u "test@liferay.com:learn" 