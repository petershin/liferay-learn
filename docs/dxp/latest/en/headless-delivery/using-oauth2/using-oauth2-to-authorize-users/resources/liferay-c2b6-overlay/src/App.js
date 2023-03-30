import React from 'react';
import {BrowserRouter, Link, Routes, Route} from 'react-router-dom';

import AuthorizationCode from './routes/grant-type-authorization-code/AuthorizationCode';
import ClientCredentials from './routes/grant-type-client-credentials/ClientCredentials';
import Password from './routes/grant-type-password/Password';

function App() {
	return (
		<BrowserRouter>
			<div className='App'>
				<nav>
					<ul>
						<li>
							<Link to='/grant-type-authorization-code'>
								Authorization Code Flow
							</Link>
						</li>
						<li>
							<Link to='/grant-type-client-credentials'>
								Client Credentials Flow
							</Link>
						</li>
						<li>
							<Link to='/grant-type-password'>Password Flow</Link>
						</li>
					</ul>
				</nav>
				<Routes>
					<Route
						path='/grant-type-authorization-code'
						element={<AuthorizationCode />}
					/>
					<Route
						path='/grant-type-client-credentials'
						element={<ClientCredentials />}
					/>
					<Route path='/grant-type-password' element={<Password />} />
				</Routes>
			</div>
		</BrowserRouter>
	);
}

export default App;
