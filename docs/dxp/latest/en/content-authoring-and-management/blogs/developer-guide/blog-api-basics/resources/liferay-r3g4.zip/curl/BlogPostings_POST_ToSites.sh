curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-postings" \
	--data-raw '
		{
			"articleBody": "Foo",
			"headline": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"