curl \
	"http://localhost:8080/o/c/ables/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"name\": \"Able One\"}" \
	-u "test@liferay.com:learn"