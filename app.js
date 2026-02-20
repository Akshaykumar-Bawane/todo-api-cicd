const express = require('express');
const cors = require('cors');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/health', (req, res) => res.json({ status: 'OK', timestamp: new Date().toISOString() }));
app.get('/todos', (req, res) => res.json([{ id: 1, text: 'Sample todo' }]));
app.post('/todos', (req, res) => res.json({ message: 'Todo created' }));

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

