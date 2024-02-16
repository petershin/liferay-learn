curl \
	"http://localhost:8080/o/c/ables/batch" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "[{\"id\": ${1}, \"name\": \"Able One\"}, {\"id\": ${2}, \"name\": \"Able Two\"}, {\"id\": ${3}, \"name\": \"Able Three\"}]" \
	-u "test@liferay.com:learn"