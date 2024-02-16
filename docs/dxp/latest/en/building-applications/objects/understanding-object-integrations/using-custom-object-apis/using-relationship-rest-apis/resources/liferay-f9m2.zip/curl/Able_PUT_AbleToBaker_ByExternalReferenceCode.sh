curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToBaker/${2}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToBaker/${3}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}/ableToBaker/${4}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 