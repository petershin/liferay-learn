curl \
	"http://localhost:8080/o/headless-delivery/v1.0/blog-postings/${1}" \
	--data-raw '
		{
			"articleBody": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"