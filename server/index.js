const express = require('express');
const path = require('path');

const app = express();

// static files (future noVNC frontend)
app.use(express.static(path.join(__dirname, '../public')));

app.get('/', (req, res) => {
  res.send(`
    <h1>remote-browser</h1>
    <p>Server is running.</p>
  `);
});

// health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// placeholder for future VNC control API
app.get('/status', (req, res) => {
  res.json({
    display: ':1',
    vnc: 'not_started',
    browser: 'not_started'
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`remote-browser server running on port ${PORT}`);
});