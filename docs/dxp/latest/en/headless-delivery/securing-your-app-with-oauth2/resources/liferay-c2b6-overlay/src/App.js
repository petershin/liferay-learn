import React from 'react';

import AuthorizationCode from './grant-type-authorization-code/AuthorizationCode';
import ClientCredentials from './grant-type-client-credentials/ClientCredentials';
import Password from './grant-type-password/Password';
import { BrowserRouter, Link, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <nav>
          <ul>
            <li>
              <Link to="/grant-type-authorization-code">
                Authorization Code Flow
              </Link>
            </li>
            <li>
              <Link to="/grant-type-client-credentials">
                Client Credentials Flow
              </Link>
            </li>
            <li>
              <Link to="/grant-type-password">Password Flow</Link>
            </li>
          </ul>
        </nav>
        <Routes>
          <Route
            path="/grant-type-authorization-code"
            element={<AuthorizationCode />}
          />
          <Route
            path="/grant-type-client-credentials"
            element={<ClientCredentials />}
          />
          <Route path="/grant-type-password" element={<Password />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
