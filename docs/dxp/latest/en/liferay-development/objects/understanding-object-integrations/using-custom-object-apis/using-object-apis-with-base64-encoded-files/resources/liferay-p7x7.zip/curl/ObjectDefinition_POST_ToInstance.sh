curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
	--data '{
		"active": true,
		"externalReferenceCode": "ABLE",
		"label": {
			"en_US": "Able"
		},
		"modifiable": true,
		"name": "Able",
		"objectFields": [
			{
				"businessType": "Attachment",
				"externalReferenceCode": "USERS_COMPUTER_ATTACHMENT_1",
				"indexed": true,
				"label": {
					"en_US": "usersComputerAttachment1"
				},
				"localized": false,
				"name": "usersComputerAttachment1",
				"objectFieldSettings": [
					{
						"name": "acceptedFileExtensions",
						"value": "jpeg, jpg, pdf, png"
					},
					{
						"name": "maximumFileSize",
						"value": 100
					},
					{
						"name": "fileSource",
						"value": "userComputer"
					},
					{
						"name": "showFilesInDocumentsAndMedia",
						"value": false
					}
				],
				"readOnly": "false",
				"required": false,
				"system": false,
				"unique": false
			},
			{
				"businessType": "Attachment",
				"externalReferenceCode": "USERS_COMPUTER_ATTACHMENT_2",
				"indexed": true,
				"label": {
					"en_US": "usersComputerAttachment2"
				},
				"localized": false,
				"name": "usersComputerAttachment2",
				"objectFieldSettings": [
					{
						"name": "acceptedFileExtensions",
						"value": "jpeg, jpg, pdf, png"
					},
					{
						"name": "maximumFileSize",
						"value": 100
					},
					{
						"name": "fileSource",
						"value": "userComputer"
					},
					{
						"name": "showFilesInDocumentsAndMedia",
						"value": true
					},
					{
						"name": "storageDLFolderPath",
						"value": "/Able"
					}
				],
				"readOnly": "false",
				"required": false,
				"system": false,
				"unique": false
			},
			{
				"businessType": "Attachment",
				"externalReferenceCode": "DOCS_AND_MEDIA_ATTACHMENT",
				"indexed": true,
				"label": {
					"en_US": "docsAndMediaAttachment"
				},
				"localized": false,
				"name": "docsAndMediaAttachment",
				"objectFieldSettings": [
					{
						"name": "acceptedFileExtensions",
						"value": "jpeg, jpg, pdf, png"
					},
					{
						"name": "maximumFileSize",
						"value": 100
					},
					{
						"name": "fileSource",
						"value": "documentsAndMedia"
					}
				],
				"readOnly": "false",
				"required": false,
				"system": false,
				"unique": false
			}
		],
		"pluralLabel": {
			"en_US": "Ables"
		},
		"scope": "company",
		"status": {
			"code": 0,
			"label": "approved",
			"label_i18n": "Approved"
		},
		"system": false
	}' \
	--header "Content-type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"
