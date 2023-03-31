import React from 'react';

function Authorize({handleCode}) {
	const [authUrl, setAuthUrl] = React.useState('');
	const [clientId, setClientId] = React.useState('');

	const urlParams = new URLSearchParams(window.location.search);

	function handleAuthorize(event) {
		event.preventDefault();

		try {
			window.location.replace(
				authUrl + '?response_type=code&client_id=' + clientId
			);
		}
		catch (e) {
			throw new Error(e);
		}
	}

	const codeParams = urlParams.get('code');

	function getCode() {
		if (codeParams) {
			handleCode(codeParams);
		}
	}

	return (
		<div>
			<h2>Authorize</h2>

			<input
				onChange={(event) => setAuthUrl(event.target.value)}
				placeholder="Liferay Authorize URL"
				style={{width: 500}}
				type="text"
				value={authUrl}
			/>

			(e.g. http://localhost:8080/o/oauth2/authorize)

			<br />

			<input
				onChange={(event) => setClientId(event.target.value)}
				placeholder="Client ID"
				style={{width: 500}}
				type="text"
				value={clientId}
			/>

			<br />

			<form onSubmit={handleAuthorize}>
				<button type='onSubmit'>Authorize</button>
			</form>

			<button onClick={getCode} disabled={!codeParams}>
				Get Authorization Code
			</button>
		</div>
	);
}

export default Authorize;
