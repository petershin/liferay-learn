curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/knowledge-base-folders" \
	--data-raw '
		{
			"description": "Foo",
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"