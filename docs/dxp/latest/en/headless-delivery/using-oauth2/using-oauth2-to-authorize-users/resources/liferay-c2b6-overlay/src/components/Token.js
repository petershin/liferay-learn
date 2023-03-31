import React from 'react';

import {getAuthToken} from '../utils/Requests';

export function Token({handleToken, code, grantType}) {
	const [clientId, setClientId] = React.useState('');

	async function handleGetToken() {
		const token = await getAuthToken({clientId, code, grantType});

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

			<button onClick={handleGetToken}>Get Token</button>
		</div>
	);
}

export default Token;
