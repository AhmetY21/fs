# Palette's Journal

## 2026-02-19 - Copy Feedback
**Learning:** Users lack confidence in silent copy-to-clipboard actions. Immediate visual feedback (state change to "Copied!") is essential for confirmation and reduces repeated clicks. Encapsulating this in a small component prevents state pollution in larger pages.
**Action:** Always implement a transient "success" state for copy actions, and handle clipboard API errors gracefully.
