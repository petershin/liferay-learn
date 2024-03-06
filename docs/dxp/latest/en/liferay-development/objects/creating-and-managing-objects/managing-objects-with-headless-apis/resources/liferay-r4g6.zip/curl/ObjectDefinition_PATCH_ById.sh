curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}" \
	--data-raw '
		{
			"label": {
				"en_US": "Bar"
			},
			"name": "Bar",
			"pluralLabel": {
				"en_US": "Bars"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"