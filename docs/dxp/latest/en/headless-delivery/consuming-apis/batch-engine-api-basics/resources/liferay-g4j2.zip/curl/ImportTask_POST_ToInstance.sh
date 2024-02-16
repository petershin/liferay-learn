curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]" \
	-u "test@liferay.com:learn"