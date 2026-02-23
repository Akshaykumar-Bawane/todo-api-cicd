const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('k3s Rolling Update ✅ Bullet 4'));
app.get('/health', (req, res) => res.status(200).send('OK'));
app.listen(3000, () => console.log('Todo API v1 on 3000'));
