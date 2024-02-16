curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${2}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${3}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${4}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 