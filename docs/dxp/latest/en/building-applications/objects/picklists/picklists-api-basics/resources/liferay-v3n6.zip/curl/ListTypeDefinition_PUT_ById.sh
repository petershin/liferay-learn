curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/${1}" \
	--data-raw '
		{
			"name": "Goo",
			"name_i18n": {
				"en_US": "Goo"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"