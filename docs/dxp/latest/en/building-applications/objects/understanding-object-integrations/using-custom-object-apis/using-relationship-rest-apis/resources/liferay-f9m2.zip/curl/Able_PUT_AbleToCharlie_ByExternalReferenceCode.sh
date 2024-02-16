curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${2}" \
	-u "test@liferay.com:learn" 

curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${3}" \
	-u "test@liferay.com:learn" 

curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToCharlie/${4}" \
	-u "test@liferay.com:learn" 