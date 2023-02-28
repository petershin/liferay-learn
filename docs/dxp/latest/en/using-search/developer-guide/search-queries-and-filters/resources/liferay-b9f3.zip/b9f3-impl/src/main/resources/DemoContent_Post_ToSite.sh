if [ "${#}" -ne 2 ]
then
	echo "ERROR"
	echo "You must pass 2 arguments: the site ID of the default site (e.g., 20120), and the site ID of the global site (e.g., 20122)."
	echo "Find these IDs in each site's Site Settings > Site Configuration screen."
	exit
fi

curl \
	-F "document={\"description\": \"Baker\", \"title\": \"Able Document\"}" \
	-F "file=@test.txt" \
	-H "Content-Type: multipart/form-data" \
	-X POST \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/documents" \
	-u "test@liferay.com:learn"

documentFolderId=$(curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/document-folders" \
	-d "{\"name\": \"Able Document Folder\"}" \
	-u "test@liferay.com:learn" | \
	jq '.id'
)

curl \
	-F "document={\"description\": \"Baker\", \"title\": \"Able Document\"}" \
	-F "file=@test.txt" \
	-H "Content-Type: multipart/form-data" \
	-X POST "http://localhost:8080/o/headless-delivery/v1.0/document-folders/${documentFolderId}/documents" \
	-u "test@liferay.com:learn"

contentStructuredId=$(curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/content-structures?search=Basic%20Web%20Content" \
	-u "test@liferay.com:learn" | \
	jq '.items[].id'
)

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-contents" \
	-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Foo</p>\"}, \"name\": \"content\"}], \"contentStructureId\": \"${contentStructuredId}\", \"title\": \"Able Content\"}" \
	-u "test@liferay.com:learn"

structuredContentFolderId=$(curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-content-folders" \
	-d "{\"description\": \"Foo\", \"name\": \"Able Content Folder\"}" \
	-u "test@liferay.com:learn" | \
	jq '.id'
)

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${structuredContentFolderId}/structured-contents" \
	-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Foo</p>\"}, \"name\": \"content\"}], \"contentStructureId\": \"${contentStructuredId}\", \"title\": \"Able Content\"}" \
	-u "test@liferay.com:learn"