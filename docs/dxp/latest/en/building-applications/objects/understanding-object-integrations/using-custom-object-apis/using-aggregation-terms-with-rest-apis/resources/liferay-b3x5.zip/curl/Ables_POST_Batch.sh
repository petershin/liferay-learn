curl \
	"http://localhost:8080/o/c/ables/batch" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "[{\"name\": \"Able 1\", \"description\": \"Foo\"}, {\"name\": \"Able 2\", \"description\": \"Bar\"}, {\"name\": \"Able 3\", \"description\": \"Goo\"}]" \
	-u "test@liferay.com:learn"