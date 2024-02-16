curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"a2\": \"AB\", \"a3\": \"ABL\", \"name\": \"Foo\", \"number\": \"1234\"}" \
	-u "test@liferay.com:learn"