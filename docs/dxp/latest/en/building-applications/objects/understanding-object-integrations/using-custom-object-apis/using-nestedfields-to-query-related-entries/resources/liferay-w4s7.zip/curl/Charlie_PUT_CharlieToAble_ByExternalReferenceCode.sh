curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${1}/charlieToAble/${4}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 

curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${2}/charlieToAble/${4}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 

curl \
	"http://localhost:8080/o/c/charlies/by-external-reference-code/${3}/charlieToAble/${4}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-u "test@liferay.com:learn" 