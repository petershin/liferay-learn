curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/c/ables/batch" \
	-d "[{\"name\": \"Able 1\", \"externalReferenceCode\" : \"able-one\"}, {\"name\": \"Able 2\", \"externalReferenceCode\" : \"able-two\"}, {\"name\": \"Able 3\", \"externalReferenceCode\" : \"able-three\"}]" \
	-u "test@liferay.com:learn" 