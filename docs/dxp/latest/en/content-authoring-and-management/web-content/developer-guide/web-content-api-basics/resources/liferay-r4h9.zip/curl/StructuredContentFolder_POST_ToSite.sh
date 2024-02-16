curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-content-folders" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"description\": \"Foo\", \"name\": \"Able Folder\"}" \
	-u "test@liferay.com:learn"