curl \
	"http://localhost:8080/o/c/ables/" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able 1\"}" \
	-u "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able 2\"}" \
	-u "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able 3\"}" \
	-u "test@liferay.com:learn"