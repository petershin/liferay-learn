curl \
	"http://localhost:8080/o/headless-delivery/v1.0/blog-postings/${1}" \
	--data-raw '
		{
			"articleBody": "Goo",
			"headline": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"