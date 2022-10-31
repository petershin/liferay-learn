import { getAuthToken } from '../utils/Requests';

export function Token({ handleToken }) {
  async function handleGetToken() {
    const token = await getAuthToken();
    handleToken(token);
  }

  return (
    <div className="Token">
      <h2>Get Token</h2>

      <button onClick={handleGetToken}>Get Token</button>
    </div>
  );
}

export default Token;
