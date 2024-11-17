// app.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from Kubernetes!, this the changed version. We added /version');
});

app.get('/version', (req, res) => {
  res.send('some version');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});