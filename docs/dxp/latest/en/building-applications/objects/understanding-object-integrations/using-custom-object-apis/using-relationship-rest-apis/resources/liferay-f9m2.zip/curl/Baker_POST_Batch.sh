curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/bakers/batch" \
	-d "[{\"name\": \"Baker 1\", \"externalReferenceCode\" : \"baker-one\"}, {\"name\": \"Baker 2\", \"externalReferenceCode\" : \"baker-two\"}, {\"name\": \"Baker 3\", \"externalReferenceCode\" : \"baker-three\"}]" \
	-u "test@liferay.com:learn" 