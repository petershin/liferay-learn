curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/specifications" \
	--data-raw '
		{
			"key": "foo",
			"title": {
				"en_US": "Foo"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"