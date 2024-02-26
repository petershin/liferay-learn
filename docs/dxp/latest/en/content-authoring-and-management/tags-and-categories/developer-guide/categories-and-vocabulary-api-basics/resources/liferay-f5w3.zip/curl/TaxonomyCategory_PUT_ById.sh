curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/taxonomy-categories/${1}" \
	--data-raw '
		{
			"description": "Goo",
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"