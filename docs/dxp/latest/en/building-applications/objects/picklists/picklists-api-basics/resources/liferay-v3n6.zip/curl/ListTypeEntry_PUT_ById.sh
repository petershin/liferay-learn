curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-entries/${1}" \
	--data-raw '
		{
			"name": "Baker",
			"name_i18n": {
				"en_US": "Baker"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"