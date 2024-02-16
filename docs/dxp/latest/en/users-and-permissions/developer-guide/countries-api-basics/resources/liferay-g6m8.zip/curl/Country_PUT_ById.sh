curl \
	-H "Content-Type: application/json" \
	-X "PUT" "http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}" \
	-d "{\"a2\": \"AB\", \"a3\": \"ABL\", \"name\": \"Goo\", \"number\": \"1234\"}" \
	-u "test@liferay.com:learn"