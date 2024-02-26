curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/taxonomy-vocabularies/${1}" \
	--data-raw '
		{
			"description": "Bar",
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"