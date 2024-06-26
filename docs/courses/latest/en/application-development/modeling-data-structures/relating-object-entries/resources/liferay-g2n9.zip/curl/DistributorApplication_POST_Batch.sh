curl \
	"http://localhost:8080/o/c/distributorapplications/batch" \
	--data-raw '
		[
			{
				"applicantEmail": "thelivingstone@maplemagic.com",
				"applicantName": "Lily Livingston",
				"applicationState": {
					"key": "open",
					"name": "Open"
				},
				"businessDistributionChannels": {},
				"businessLicenseNumber": "1111111",
				"businessName": "Maple Magic",
				"businessPhoneNumber": "+1 (111) 111-1111",
				"businessResaleNumber": "1111111",
				"businessTaxIDNumber": "1111111",
				"businessType": {
					"key": "franchise",
					"name": "Franchise"
				},
				"primaryContactEmail": "thelivingstone@maplemagic.com",
				"primaryContactName": "Lily Livingston",
				"primaryContactPhoneNumber": "+1 (111) 111-1111",
				"primaryContactTitle": "Business Development Manager"
			},
			{
				"applicantEmail": "gloriousgimble@savvydistributors.com",
				"applicantName": "Gloria Gimble",
				"applicationState": {
					"key": "open",
					"name": "Open"
				},
				"businessDistributionChannels": {},
				"businessLicenseNumber": "2222222",
				"businessName": "Savvy Distributors",
				"businessPhoneNumber": "+2 (222) 222-2222",
				"businessResaleNumber": "2222222",
				"businessTaxIDNumber": "2222222",
				"businessType": {
					"key": "other",
					"name": "Other"
				},
				"primaryContactEmail": "gloriousgimble@savvydistributors.com",
				"primaryContactName": "Gloria Gimble",
				"primaryContactPhoneNumber": "+2 (222) 222-2222",
				"primaryContactTitle": "Chief Business Development Officer"
			},
			{
				"applicantEmail": "bobbinalong@goldentap.com",
				"applicantName": "Boris Bobbins",
				"applicationState": {
					"key": "open",
					"name": "Open"
				},
				"businessDistributionChannels": {},
				"businessLicenseNumber": "3333333",
				"businessName": "Golden Tap Sweets",
				"businessPhoneNumber": "+3 (333) 333-3333",
				"businessResaleNumber": "3333333",
				"businessTaxIDNumber": "3333333",
				"businessType": {
					"key": "independentBusiness",
					"name": "Independent Business"
				},
				"primaryContactEmail": "bobbinalong@goldentap.com",
				"primaryContactName": "Boris Bobbins",
				"primaryContactPhoneNumber": "+3 (333) 333-3333",
				"primaryContactTitle": "Business Development Manager"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"