---
uuid: 496a6651-e3f5-4ff2-8754-6362d84e366a
---
# Predefined Element Variables Reference

In the Element Source editor, place the cursor in the desired location and click the variable in the left hand sidebar to insert it. In the Custom JSON Element, you must type the variable directly into the editor. The syntax for each variable appears in the table below.

| Variable | Type: Definition | Syntax |
| :--- | :--- | :--- |
| | <a href="#context" id="context">**CONTEXT**</a> | |
| Company ID | Number: the company ID of the current instance| `${context.company_id}` |
| Is Staging Group | Boolean: whether the current site is staged | `${context.is_staging_group}` |
| Language | Text: the 2-letter code for the current language (e.g., `en`) | `${context.language}` |
| Language ID | Text: the 4-letter language code (e.g., `en_US`) of the current language | `${context.language_id}` |
| Layout Name Localized | Text: the localized name of the page | `${context.layout-name-localized}` |
| Page Layout ID | Number: the ID of the page | `${context.plid}` |
| Publication ID | Number: the publication ID | `${context.publication_id}` |
| Scope Group ID | the current site's ID | `${context.scope_group_id}` |
| | <a href="#time" id="time">**TIME**</a> | |
| Current Date | Date: the current date | `${time.current_date}` |
| Current Day of Month | Number: the day of the month | `${time.current_day_of_month}` |
| Current Day of Week | Number: the day of the week (_1 = Monday_) | `${time.current_day_of_week}` |
| Current Day of Year | Number: the day of the year | `${time.current_day_of_year}` |
| Current Hour | Number: the current hour | `${time.current_hour}` |
| Current Year | Number: the current year | `${time.current_year}` |
| Time of Day | Time: the time | `${time.time_of_day}` |
| Time Zone Name Localized | Text: the time zone, localized for the locale | `${time.time_zone_name_localized}` |
| | <a href="#user" id="user">**USER**</a> | |
| Active Segment Entry IDs | Number: the user's segment IDs | `${user.active_segment_entry_ids}` |
| Age | Number: the user's age in number of years | `${user.age}` |
| Asset Category Ids (_Available 7.4 U41+_) | Number: the IDs of the user's categories | `${user.asset_category_ids}` |
| Asset Tag Names (_Available 7.4 U41+_) | Text: the user's tags | `${user.asset_tag_names}` |
| Birthday | Date: the user's birth date | `${user.birthday}` |
| Create Date | Date: the date when the user account was created in Liferay | `${user.create_date}` |
| Current Site Role IDs | Number: the user's site role IDs | `${user.current_site_role_ids}` |
| Email Domain | Text: the user's email domain | `${user.email_domain}` |
| First Name | Text: the user's first name | `${user.first_name}` |
| Full Name | Text: the user's full name | `${user.full_name}` |
| Group IDs | Number: the IDs of sites the user is a member of | `${user.group_ids}` |
| User ID | Number: the user's ID | `${user.id}` |
| Is Female | Boolean: true if the user is female | `${user.is_female}` |
| Is Gender X | Boolean: true if the user is gender X | `${user.is_gender_x}` |
| Is Male | Boolean: true if the user is male | `${user.is_male}` |
| Is Omniadmin | Boolean: true if the user is the Omni Admin user (the default user of the default instance) | `${user.is_omniadmin}` |
| Is Signed In | Boolean: true if the user is signed in | `${user.is_signed_in}` |
| Job Title | Text: the user's job title | `${user.job_title}` |
| Language ID | Text: the user's language code (e.g., `en_US`) | `${user.language_id}` |
| Last Name | Text: the user's last name | `${user.last_name}` |
| Parent Asset Category Ids (_Available 7.4 U41+_) | Number: the IDs of all the parent categories of the user's categories | `${user.parent_asset_category_ids}` |
| Regular Role IDs | Number: the role IDs for the user's regular roles | `${user.regular_role_ids}` |
| User group IDs | Number: the IDs of the user groups that the user is part of | `${user.user_group_ids}` |
| | <a href="#conditional-elements" id="conditional-elements">**CONDITIONAL ELEMENTS**\*</a> | |
| IP Stack City | Text: the city where the searching IP address originates | `${ipstack.city}` |
| IP Stack Continent Code | Text: the continent code (e.g., NA for North America) where the searching IP address originates | `${ipstack.continent_code}` |
| IP Stack Continent Name | Text: the continent name | `${ipstack.continent_name}` |
| IP Stack Country Code | Text: the country code (e.g., US for United States)  | `${ipstack.country_code}` |
| IP Stack Country Name | Text: the country name | `${ipstack.country_name}` |
| IP Stack Latitude | Number: the latitude in decimal degrees | `${ipstack.latitude}` |
| IP Stack Longitude | Number: the longitude in decimal degrees | `${ipstack.longitude}` |
| IP Stack Region Code | Text: the region code (e.g., CA for California) | `${ipstack.region_code}` |
| IP Stack Region Name | Text: the region name | `${ipstack.region_name}` |
| IP Stack Zip Code | Number: the zip code | `${ipstack.zip}` |
| Open Weather Map Temperature | Number: the temperature | `${openweathermap.temp}` |
| Open Weather Map Weather Description | Text: a description of the weather (e.g., "clear sky") | `${openweathermap.weather_description}` |
| Open Weather Map Weather ID | Number: the [ID corresponding to the weather description](https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2) | `${openweathermap.weather_id}` |
| Open Weather Map Main Label| Text: the [primary identifier for the weather (e.g., Rain; this is the Main field in OpenWeatherMap's API response](https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2), according to the weather ID | `${openweathermap.weather_main}` |
| Open Weather Map Wind Speed | Number: the wind speed in km/h | `${openweathermap.wind_speed}` |
| User Custom Fields **\*\*** | the value of a user custom field | `user.custom.field.[name]` |

**\*** [Activate Liferay Commerce](https://learn.liferay.com/w/commerce/installation-and-upgrades/activating-liferay-commerce-enterprise) to access the Commerce-specific variables.

**\*** Access ipstack and OpenWeatherMap variables by first enabling each service. Visit System or Instance Settings &rarr; Platform &rarr; Search Experiences. Click the Enabled checkbox and save the configuration for the service you're configuring. Note that the OpenWeatherMap service depends on the ipstack service being enabled. See [Personalizing the Search Experience](../personalizing-the-search-experience.md) for an example using the ipstack service.

**\*\*** In addition to these out-of-the-box variables, [Custom Fields](../../../../../system-administration/configuring-liferay/adding-custom-fields.md) on the user entity can also be referenced as variables in the element. For example, a user custom field with the name _Employee_ is referenced in an element with `user.custom.field.employee`.

## Additional Information

- [Creating Elements](./creating-elements.md)
- [Search Blueprints Configuration Reference](../search-blueprints-configuration-reference.md)
- [Managing Elements](./managing-elements.md)
