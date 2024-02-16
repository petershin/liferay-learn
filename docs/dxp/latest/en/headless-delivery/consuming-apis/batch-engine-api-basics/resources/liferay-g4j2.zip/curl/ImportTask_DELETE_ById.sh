curl \
	 -H "Content-Type: application/json" \
	 -X "DELETE" \
	 "http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	 -d "[{\"id\": 1234}, {\"id\": 5678}]" \
	 -u "test@liferay.com:learn"