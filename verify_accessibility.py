from playwright.sync_api import sync_playwright

def run(playwright):
    browser = playwright.chromium.launch()
    page = browser.new_page()

    print("Navigating to home page...")
    page.goto("http://localhost:3000")

    # Check for aria-current="page" on the Analyze link
    print("Checking for aria-current='page' on Analyze link...")
    analyze_link = page.get_by_role("link", name="Analyze")

    # Verify the attribute
    aria_current = analyze_link.get_attribute("aria-current")
    if aria_current == "page":
        print("PASS: Analyze link has aria-current='page'")
    else:
        print(f"FAIL: Analyze link has aria-current='{aria_current}'")

    # Check for aria-hidden="true" on the logo icon
    print("Checking for aria-hidden='true' on logo icon...")
    # The logo icon is a span with class 'logo-icon' inside a link with class 'logo'
    # We can select it by class
    logo_icon = page.locator(".logo-icon")
    aria_hidden = logo_icon.get_attribute("aria-hidden")

    if aria_hidden == "true":
        print("PASS: Logo icon has aria-hidden='true'")
    else:
        print(f"FAIL: Logo icon has aria-hidden='{aria_hidden}'")

    # Take a screenshot
    page.screenshot(path="verification_screenshot.png")
    print("Screenshot saved to verification_screenshot.png")

    # Navigate to Learn page and check aria-current there
    print("Navigating to Learn page...")
    page.goto("http://localhost:3000/learn")

    learn_link = page.get_by_role("link", name="Feng Shui 101")
    aria_current_learn = learn_link.get_attribute("aria-current")

    if aria_current_learn == "page":
        print("PASS: Feng Shui 101 link has aria-current='page'")
    else:
        print(f"FAIL: Feng Shui 101 link has aria-current='{aria_current_learn}'")

    analyze_link_on_learn = page.get_by_role("link", name="Analyze")
    aria_current_analyze_on_learn = analyze_link_on_learn.get_attribute("aria-current")

    if aria_current_analyze_on_learn is None:
         print("PASS: Analyze link properly does NOT have aria-current on Learn page")
    else:
         print(f"FAIL: Analyze link has aria-current='{aria_current_analyze_on_learn}' on Learn page")

    browser.close()

with sync_playwright() as playwright:
    run(playwright)
