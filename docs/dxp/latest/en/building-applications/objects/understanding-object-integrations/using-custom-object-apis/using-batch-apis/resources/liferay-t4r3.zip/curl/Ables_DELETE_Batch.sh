curl \
	"http://localhost:8080/o/c/ables/batch" \
	--data-raw '
		[
			{
				"id": "'"${1}"'"
			},
			{
				"id": "'"${2}"'"
			},
			{
				"id": "'"${3}"'"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "DELETE" \
	--user "test@liferay.com:learn"