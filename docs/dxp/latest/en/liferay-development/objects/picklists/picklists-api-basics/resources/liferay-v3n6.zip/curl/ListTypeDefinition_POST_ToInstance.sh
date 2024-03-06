curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	--data-raw '
		{
			"name": "Foo",
			"name_i18n": {
				"en_US": "Foo"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"