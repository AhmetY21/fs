from playwright.sync_api import sync_playwright, expect

def run():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        try:
            print("Navigating to verify-overlay page...")
            page.goto("http://localhost:3000/verify-overlay")

            # Wait for the overlay to render
            # The canvas is rendered immediately but we can wait for role=img
            overlay = page.get_by_role("img", name="Room spatial map showing furniture positions")
            expect(overlay).to_be_visible()
            print("Overlay container found and visible.")

            # Check for hidden list
            # Since it's hidden with inline styles, it might not be 'visible' in the sense of rendered pixels,
            # but it should be present in the accessibility tree.
            # Playwright's .to_be_visible() checks if it's painted. Our sr-only style makes it effectively invisible visually.
            # So we check if it's attached.

            list_element = page.locator("ul").first
            expect(list_element).to_be_attached()
            print("List element found.")

            # Check content of list items
            # We expect "Master Bed at top-left" or similar.
            # 0.1, 0.1 -> top-left

            items = list_element.locator("li")
            count = items.count()
            print(f"Found {count} list items.")

            first_item = items.nth(0)
            text = first_item.text_content()
            print(f"First item text: {text}")

            if "top-left" not in text:
                print("FAILURE: Expected 'top-left' in first item text.")
            else:
                print("SUCCESS: correct position description found.")

            # Check command position text
            # commandPosition.primary_furniture is 'bed'. The first item is 'bed'.
            # So it should say "(In Command Position)"
            if "In Command Position" in text:
                 print("SUCCESS: Command Position text found.")
            else:
                 print("FAILURE: Command Position text missing.")

            # Take screenshot
            page.screenshot(path="/home/jules/verification/verification.png")
            print("Screenshot saved to /home/jules/verification/verification.png")

        except Exception as e:
            print(f"Error: {e}")
            # Take screenshot on error too
            page.screenshot(path="/home/jules/verification/error.png")
        finally:
            browser.close()

if __name__ == "__main__":
    run()
