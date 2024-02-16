curl \
	-H "Content-Type: application/json" \
	-X "POST" "http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}/regions" \
	-d "{\"name\": \"Foo\", \"regionCode\": \"ABL\"}" \
	-u "test@liferay.com:learn"