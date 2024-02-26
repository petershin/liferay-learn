curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/sites/${1}/taxonomy-vocabularies" \
	--data-raw '
		{
			"description": "Foo",
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"