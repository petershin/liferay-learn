curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/bakers/" \
	-d "{\"name\": \"Baker 1\", \"externalReferenceCode\": \"baker-one\", \"r_ableToBaker_c_ableId\": ${1}}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/bakers/" \
	-d "{\"name\": \"Baker 2\", \"externalReferenceCode\": \"baker-two\", \"r_ableToBaker_c_ableId\": ${1}}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/c/bakers/" \
	-d "{\"name\": \"Baker 3\", \"externalReferenceCode\": \"baker-three\", \"r_ableToBaker_c_ableId\": ${1}}" \
	-u "test@liferay.com:learn"