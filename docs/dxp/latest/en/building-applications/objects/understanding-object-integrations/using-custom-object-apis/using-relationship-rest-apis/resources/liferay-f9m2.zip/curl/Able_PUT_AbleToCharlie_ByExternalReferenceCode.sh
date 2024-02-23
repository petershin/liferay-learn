curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${2}" \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${3}" \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${4}" \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"