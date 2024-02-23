curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
	--data-raw '
		{
			"label": {
				"en_US": "Foo"
			},
			"name": "Foo",
			"pluralLabel": {
				"en_US": "Foos"
			},
			"scope": "company"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"