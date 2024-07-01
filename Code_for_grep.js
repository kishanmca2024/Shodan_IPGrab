// Create an array to hold the extracted values
let values = [];

// Select all <strong> elements on the page
document.querySelectorAll('strong').forEach((element) => {
    console.log(element.textContent); // Log the text content to the console for debugging
    values.push(element.textContent);
});

// Check if any values were extracted
if (values.length === 0) {
    console.error("No values found. Check the selector and ensure the elements exist.");
} else {
    // Convert the array of values to a text formatted string
    let textContent = values.join("\n");

    // Create a link element to trigger the download
    let blob = new Blob([textContent], { type: 'text/plain' });
    let link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "values.txt";

    // Append the link to the document and trigger the click event to start the download
    document.body.appendChild(link);
    link.click();

    // Clean up by removing the link element
    document.body.removeChild(link);

    console.log("Download started successfully.");
}
