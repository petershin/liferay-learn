curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/${1}/optionValues" \
	--data-raw '
		{
			"key": "able",
			"name": {
				"en_US": "Able"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"