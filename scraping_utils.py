from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

CHROME_BINARY = '/usr/bin/chromium/chrome-linux64/chrome' 
CHROMEDRIVER = "/usr/bin/chromedriver-linux64/chromedriver"

def init_browser():
    chrome_options = Options()
    chrome_options.add_argument("--headless=new")
    chrome_options.add_argument("--no-sandbox") # linux only
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument('--v=1')
    chrome_options.binary_location = CHROME_BINARY

    service = Service(executable_path=CHROMEDRIVER)
    browser = webdriver.Chrome(service=service,  options=chrome_options)

    return browser
