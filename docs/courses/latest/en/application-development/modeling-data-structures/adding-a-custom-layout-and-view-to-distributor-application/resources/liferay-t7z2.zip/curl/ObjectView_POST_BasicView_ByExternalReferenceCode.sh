curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-views" \
	--data-raw '
		{
			"defaultObjectView": true,
			"name": {
				"en_US": "Basic View"
			},
			"objectDefinitionExternalReferenceCode": "C_DISTRIBUTOR_APPLICATION",
			"objectViewColumns": [
				{
					"label": {
						"en_US": "ID"
					},
					"objectFieldName": "id",
					"priority": 0
				},
				{
					"label": {
						"en_US": "Applicant Name"
					},
					"objectFieldName": "applicantName",
					"priority": 1
				},
				{
					"label": {
						"en_US": "Business Name"
					},
					"objectFieldName": "businessName",
					"priority": 2
				},
				{
					"label": {
						"en_US": "Create Date"
					},
					"objectFieldName": "createDate",
					"priority": 3
					},
				{
					"label": {
						"en_US": "Status"
					},
					"objectFieldName": "status",
					"priority": 4
				}
			],
			"objectViewFilterColumns": [],
			"objectViewSortColumns": []
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"


