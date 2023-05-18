async function fetchFeedback() {
  const resp = await fetch('/api/helpfulfeedback');

  document.getElementById("helpful").innerHTML = await resp.text();

  const resp2 = await fetch('/api/nothelpfulfeedback');

  document.getElementById("not helpful").innerHTML = await resp2.text();
}