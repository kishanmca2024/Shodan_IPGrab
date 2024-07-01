/**
 * Script to extract the text content of all <strong> elements on a webpage
 * and download them as a .txt file.
 *
 * Steps to use:
 * 1. Open the website from which you want to download data.
 * 2. Open the developer console (usually by pressing F12 or Ctrl+Shift+I).
 * 3. Copy and paste the script into the console.
 * 4. Press Enter to execute the script.
 */

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


Notes:
Extraction: The script extracts the text content of all <strong> elements on the page.
Download: The extracted values are joined into a single string, formatted as plain text, and downloaded as a .txt file.
Debugging: The script logs each extracted value and provides error messages if no values are found.
Usage:
Open Developer Console: Press F12 or Ctrl+Shift+I.
Paste Script: Copy and paste the script into the console.
Execute: Press Enter.
This will extract all <strong> tag values and download them in a values.txt file.
