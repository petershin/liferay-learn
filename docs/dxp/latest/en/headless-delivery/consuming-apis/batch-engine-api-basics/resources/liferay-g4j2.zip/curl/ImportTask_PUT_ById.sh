curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "[{\"id\": 1234, \"name\": \"Bar\", \"type\": \"business\"}, {\"id\": 5678, \"name\": \"Goo\", \"type\": \"guest\"}]" \
	-u "test@liferay.com:learn"