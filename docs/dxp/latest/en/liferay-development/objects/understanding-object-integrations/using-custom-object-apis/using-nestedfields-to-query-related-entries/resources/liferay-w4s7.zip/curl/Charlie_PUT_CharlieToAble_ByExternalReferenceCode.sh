curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${1}/charlieToAble/${4}" \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${2}/charlieToAble/${4}" \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${3}/charlieToAble/${4}" \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"