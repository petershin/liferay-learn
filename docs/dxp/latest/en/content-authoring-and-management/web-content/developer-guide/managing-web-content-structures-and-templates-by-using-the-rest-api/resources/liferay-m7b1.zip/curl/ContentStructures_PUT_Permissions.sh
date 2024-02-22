curl \
	"http://localhost:8080/o/headless-delivery/v1.0/content-structures/${1}/permissions" \
	--data-raw '
		[
			{
				"actionIds": [
					"DELETE",
					"VIEW"
				],
				"roleName": "Power User"
			}
		]' \
	--header "Content-Type: application/json" \
	--request PUT \
	--user "test@liferay.com:learn"