import React from 'react';

import Authorize from '../../components/Authorize';
import Token from '../../components/Token';
import Users from '../../components/Users';

function AuthorizationCode() {
	const [token, setToken] = React.useState({});

	function handleToken(token) {
		setToken(token);
	}

	return (
		<div>
			<h1>Authorization Code Flow</h1>

			<Authorize />

			<Token
				grantType='authorization_code'
				handleToken={handleToken}
			/>

			<Users token={token} />
		</div>
	);
}

export default AuthorizationCode;
