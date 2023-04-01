export const getAuthToken = async ({clientId, clientSecret, grantType, password, tokenUrl, username}) => {
	let redirectUri = window.location.href;

	if (redirectUri.lastIndexOf('?') > 0) {
		redirectUri = redirectUri.slice(0, redirectUri.lastIndexOf('?'));
	}

	const urlSearchParams = new URLSearchParams(window.location.search);

	const request = {
		client_id: clientId,
		client_secret: clientSecret,
		code: urlSearchParams.get('code'),
		grant_type: grantType,
		password: password,
		redirect_uri: redirectUri,
		username: username,
	};

	let body = [];

	for (let property in request) {
		var encodedKey = encodeURIComponent(property);
		var encodedValue = encodeURIComponent(request[property]);

		body.push(encodedKey + '=' + encodedValue);
	}

	body = body.join('&');

	const data = await fetch(tokenUrl, {
		body: body,
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
		},
		method: 'POST',
	}).then(response => response.json());

	return data;
};

export const getUsers = async ({token, url}) => {
	return fetch(
		url,
		{
			headers: {
				'Authorization': 'Bearer ' + token.access_token,
				'Content-Type': 'application/json',
			},
			method: 'GET',
		}
	);
};
