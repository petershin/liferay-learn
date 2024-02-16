curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-postings" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"articleBody\": \"Foo\", \"headline\": \"Able\"}" \
	-u "test@liferay.com:learn"