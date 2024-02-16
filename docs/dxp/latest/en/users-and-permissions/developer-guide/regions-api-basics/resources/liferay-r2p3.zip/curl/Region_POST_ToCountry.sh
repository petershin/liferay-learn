curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}/regions" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Foo\", \"regionCode\": \"ABL\"}" \
	-u "test@liferay.com:learn"