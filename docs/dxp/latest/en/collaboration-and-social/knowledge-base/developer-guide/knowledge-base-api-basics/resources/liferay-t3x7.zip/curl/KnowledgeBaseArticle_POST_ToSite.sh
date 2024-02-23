curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/knowledge-base-articles" \
	--data-raw '
		{
			"articleBody": "Foo",
			"title": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"