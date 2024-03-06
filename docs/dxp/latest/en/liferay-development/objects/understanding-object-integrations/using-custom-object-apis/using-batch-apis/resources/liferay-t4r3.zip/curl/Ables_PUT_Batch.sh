curl \
	"http://localhost:8080/o/c/ables/batch" \
	--data-raw '
		[
			{
				"id": "'"${1}"'",
				"name": "Able One"
			},
			{
				"id": "'"${2}"'",
				"name": "Able Two"
			},
			{
				"id": "'"${3}"'",
				"name": "Able Three"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"