curl \
	"http://localhost:8080/o/c/charlies/" \
	--data-raw '
		{
			"name": "Charlie 1",
			"externalReferenceCode": "charlie-one",
			"r_bakerToCharlie_c_bakerId": ${1}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/charlies/" \
	--data-raw '
		{
			"name": "Charlie 2",
			"externalReferenceCode": "charlie-two",
			"r_bakerToCharlie_c_bakerId": ${1}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/charlies/" \
	--data-raw '
		{
			"name": "Charlie 3",
			"externalReferenceCode": "charlie-three",
			"r_bakerToCharlie_c_bakerId": ${1}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"