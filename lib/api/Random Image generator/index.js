const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = 3000;
const PAGE_SIZE = 5;
const cors = require('cors');
app.use(cors());

// Serve images statically
app.use('/images', express.static(path.join(__dirname, 'images')));

// Route to get paginated profiles
app.get('/profiles/:page', (req, res) => {
    const page = parseInt(req.params.page);

    if (isNaN(page) || page < 1) {
        return res.status(400).json({ error: 'Invalid page number.' });
    }

    fs.readFile(path.join(__dirname, 'profiles.json'), 'utf8', (err, data) => {
        if (err) {
            return res.status(500).json({ error: 'Failed to read profiles data.' });
        }

        const profiles = JSON.parse(data);
        const startIndex = (page - 1) * PAGE_SIZE;
        const endIndex = startIndex + PAGE_SIZE;

        const paginatedProfiles = profiles.slice(startIndex, endIndex);

        if (paginatedProfiles.length === 0) {
            return res.status(404).json({ error: 'No profiles found for this page.' });
        }

        res.json(paginatedProfiles);
    });
});

// Route to get total number of pages
app.get('/pagesNumbers', (req, res) => {
  
    const totalPages = 2;
    res.json({ totalPages });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
