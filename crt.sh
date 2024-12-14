(function() {
    // Select all rows in the table
    const rows = document.querySelectorAll('tr');

    // Extract subdomains from the fifth cell in each row
    const subdomains = [];
    rows.forEach(row => {
        const cells = row.querySelectorAll('td');
        if (cells.length >= 5) {
            const subdomain = cells[4]?.innerText.trim();
            if (subdomain) {
                subdomains.push(subdomain);
            }
        }
    });

    // Create a blob for downloading
    const blob = new Blob([subdomains.join('\n')], { type: 'text/plain' });

    // Create a download link
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'subdomains.txt';
    document.body.appendChild(link);
    link.click();

    // Clean up
    document.body.removeChild(link);
    URL.revokeObjectURL(link.href);

    console.log('Subdomains saved to subdomains.txt:', subdomains);
})();
