curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/${1}/list-type-entries" \
	--data-raw '
		{
			"key": "able",
			"name": "Able",
			"name_i18n": {
				"en_US": "Able"
			}
		}' \
	--header "Content-Type: application/json" \
	--rquest "POST" \
	--user "test@liferay.com:learn"