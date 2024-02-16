curl \
	-H "Content-Type: application/json" \
	-X "PUT" "http://localhost:8080/o/headless-admin-address/v1.0/regions/${1}" \
	-d "{\"name\": \"Goo\", \"regionCode\": \"ABL\"}" \
	-u "test@liferay.com:learn"