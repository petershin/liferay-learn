curl \
	 -H "Content-Type: application/json" \
	 -X "PUT" \
	 "http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	 -d "[{\"id\" :1234, \"name\": \"Bar\", \"type\": \"business\"}, {\"id\": 5678, \"name\": \"Goo\", \"type\": \"guest\"}]" \
	 -u "test@liferay.com:learn"