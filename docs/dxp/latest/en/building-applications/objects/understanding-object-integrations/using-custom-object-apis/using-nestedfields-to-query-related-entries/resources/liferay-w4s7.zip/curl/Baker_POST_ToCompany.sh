curl \
	"http://localhost:8080/o/c/bakers/" \
	--data-raw '
		{
			"name": "Baker 1",
			"externalReferenceCode": "baker-one",
			"r_ableToBaker_c_ableId": ${1}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/bakers/" \
	--data-raw '
		{
			"name": "Baker 2",
			"externalReferenceCode": "baker-two",
			"r_ableToBaker_c_ableId": ${1}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/bakers/" \
	--data-raw '
		{
			"name": "Baker 3",
			"externalReferenceCode": "baker-three",
			"r_ableToBaker_c_ableId": ${1}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

