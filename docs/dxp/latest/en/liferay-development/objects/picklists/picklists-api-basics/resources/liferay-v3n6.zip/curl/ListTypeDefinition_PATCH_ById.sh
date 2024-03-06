curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/${1}" \
	--data-raw '
		{
			"name": "Bar",
			"name_i18n": {
				"en_US": "Bar"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"