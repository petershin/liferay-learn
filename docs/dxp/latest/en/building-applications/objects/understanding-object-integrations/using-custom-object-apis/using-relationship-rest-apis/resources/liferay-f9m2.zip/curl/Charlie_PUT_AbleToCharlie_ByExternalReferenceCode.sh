curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${1}/ableToCharlie/${2}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 