curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/keywords/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"name\": \"Bar\"}" \
	-u "test@liferay.com:learn"