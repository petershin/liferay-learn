import React from 'react';

import Token from '../../components/Token';
import Users from '../../components/Users';

function ClientCredentials() {
	const [token, setToken] = React.useState({});

	function handleToken(token) {
		setToken(token);
	}

	return (
		<div>
			<h1>Client Credentials Code Flow</h1>

			<Token
				grantType='client_credentials'
				handleToken={handleToken}
			/>

			<Users token={token} />
		</div>
	);
}

export default ClientCredentials;
