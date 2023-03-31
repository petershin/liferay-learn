import React from 'react';

import {getAuthToken} from '../utils/Requests';

export function Token({handleToken, code, grantType}) {
	const [clientId, setClientId] = React.useState('');
	const [clientSecret, setClientSecret] = React.useState('');

	async function handleGetToken() {
		const token = await getAuthToken({clientId, clientSecret, code, grantType});

		handleToken(token);
	}

	return (
		<div className='Token'>
			<h2>Get Token</h2>

			<input
				onChange={(event) => setClientId(event.target.value)}
				placeholder="Client ID"
				style={{width: 500}}
				type="text"
				value={clientId}
			/>

			<br />

			<input
				onChange={(event) => setClientSecret(event.target.value)}
				placeholder="Client Secret"
				style={{width: 500}}
				type="text"
				value={clientSecret}
			/>

			<br />

			<button onClick={handleGetToken}>Get Token</button>
		</div>
	);
}

export default Token;
