curl \
	"http://localhost:8080/o/c/charlies/batch" \
	--data-raw '
		[
			{
				"name": "Charlie 1",
				"externalReferenceCode": "charlie-one"
			},
			{
				"name": "Charlie 2",
				"externalReferenceCode": "charlie-two"
			},
			{
				"name": "Charlie 3",
				"externalReferenceCode": "charlie-three"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"