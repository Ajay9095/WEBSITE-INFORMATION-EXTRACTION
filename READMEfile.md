# README

## Website Information Extractor

This script is designed to extract various pieces of information from a given website URL. It uses web scraping techniques to gather data such as meta titles, descriptions, social media links, tech stack, payment gateways, website language, and category. The extracted information is then saved to a MySQL database.

### Prerequisites

Before running this script, ensure you have the following installed:

- Python 3.x
- Google Chrome browser
- ChromeDriver
- MySQL server

### Required Python Packages

Install the necessary Python packages using `pip`:

```bash
pip install requests beautifulsoup4 selenium mysql-connector-python langcodes
```

## Setup

1. **ChromeDriver:**
   - Download the ChromeDriver that matches your Chrome browser version.
   - Ensure ChromeDriver is in your system's PATH or specify its location in the script.

2. **MySQL Database:**
   - Ensure MySQL server is running.
   - Create a database named `web_scraping`.
   - Create a table named `website_info` with the following schema:

     ```sql
     CREATE TABLE website_info (
         id INT AUTO_INCREMENT PRIMARY KEY,
         url VARCHAR(255),
         social_media_links TEXT,
         tech_stack TEXT,
         meta_title VARCHAR(255),
         meta_description TEXT,
         payment_gateways VARCHAR(255),
         website_language VARCHAR(255),
         category VARCHAR(255)
     );
     ```

## Configuration

Update the MySQL database connection parameters in the `save_to_database` function:

```python
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='@jaykumar_A04',
    database='web_scraping'
)
```

## Usage

**Modify URLs:**

   Add or modify the list of URLs you want to process in the `main` function:

   ```python
   urls = ['https://allheartweb.com/']
   ```

## Script Details

### Imports

```python
import requests
from bs4 import BeautifulSoup
from selenium import webdriver 
import mysql.connector
import re
import langcodes
```

### extract_website_info(url)

- Uses Selenium to load the webpage and BeautifulSoup to parse the HTML content.
- Extracts meta titles, descriptions, social media links, tech stack, payment gateways, website language, and category.
- Returns a dictionary containing the extracted information.

### save_to_database(data)

- Connects to the MySQL database and saves the extracted data.

### main()

- Iterates through a list of URLs, extracts information for each, and saves it to the database.

## Example Output

The script will output a dictionary with the following structure for each processed URL:

```json
{
    'url': 'https://www.coursera.org',
    'social_media_links': '1. https://www.facebook.com/Coursera  2. https://www.linkedin.com/company/coursera',
    'tech_stack': 'CMS (Magento, Ghost, HubSpot), JavaScript Library (D3), Backend Technology (Go, Rust, R)',
    'meta_title': 'Coursera India | Online Courses & Credentials From Top Educators. Join for Free',
    'meta_description': 'Learn online and earn valuable credentials from top universities like India........',
    'payment_gateways': 'Paypal,Stripe',
    'website_language': 'English',
    'category': 'Education'
}
```

## Notes

- Ensure the ChromeDriver version matches your installed Chrome browser version.
- Customize the script to extract additional information as needed.
- Handle exceptions appropriately to manage different scenarios and errors during web scraping.

## Disclaimer

Web scraping should be performed responsibly and in accordance with the website's terms of service.