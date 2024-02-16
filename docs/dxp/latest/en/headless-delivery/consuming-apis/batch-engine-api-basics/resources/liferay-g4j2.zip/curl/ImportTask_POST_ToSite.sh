curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}?siteId=${2}" \
	-d "[{\"articleBody\": \"Foo\", \"headline\": \"Able\"}, {\"articleBody\": \"Bar\", \"headline\": \"Baker\"}]" \
	-u "test@liferay.com:learn"