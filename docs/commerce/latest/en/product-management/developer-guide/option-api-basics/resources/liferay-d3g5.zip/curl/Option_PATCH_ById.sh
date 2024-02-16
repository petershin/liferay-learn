curl \
	 -H "Content-Type: application/json" \
	 -X "PATCH" \
	 "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/${1}" \
	 -d "{\"fieldType\": \"radio\", \"key\": \"bar\", \"name\": {\"en_US\": \"Bar\"}}" \
	 -u "test@liferay.com:learn"