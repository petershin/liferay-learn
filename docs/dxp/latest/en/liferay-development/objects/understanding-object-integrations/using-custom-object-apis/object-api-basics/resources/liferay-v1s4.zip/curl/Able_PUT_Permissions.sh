curl \
	"http://localhost:8080/o/c/ables/${1}/permissions" \
	--data-raw '
		[
			{
				"actionIds": [
					"DELETE",
					"PERMISSIONS",
					"VIEW"
				],
				"roleName": "Owner"
			}
		]' \
	--header "Content-Type: application/json" \
	--request PUT \
	--user "test@liferay.com:learn"