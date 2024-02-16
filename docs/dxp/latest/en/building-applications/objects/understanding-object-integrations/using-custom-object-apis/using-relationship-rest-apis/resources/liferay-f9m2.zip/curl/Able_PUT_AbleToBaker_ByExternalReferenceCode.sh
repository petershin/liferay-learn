curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToBaker/${2}" \
	-u "test@liferay.com:learn" 

curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToBaker/${3}" \
	-u "test@liferay.com:learn" 

curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToBaker/${4}" \
	-u "test@liferay.com:learn" 