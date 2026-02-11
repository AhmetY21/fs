# ☯ Feng Shui Designer

AI-powered room harmony analysis. Upload a photo of any room and get instant Feng Shui recommendations based on 35+ verified principles.

## Features

- **Room Analysis** — Upload a photo, get spatial mapping with bounding boxes for doors, windows, and furniture
- **Command Position** — Evaluates whether key furniture is in the commanding position
- **Feng Shui Report** — Score (0-100), violations with severity, positive aspects, five element balance, chi flow quality
- **Feng Shui 101** — Educational page covering core concepts: Chi, Command Position, Five Elements, Bagua Map, Sha Chi, and room-by-room tips
- **Redesign Prompt** — Auto-generates a prompt for future AI room redesign (ControlNet)

## Tech Stack

- **Framework**: Next.js 15 (App Router)
- **AI**: Gemini 2.5 Vision API
- **UI**: Dark glassmorphism theme with gold/jade accents

## Getting Started

```bash
# Install dependencies
npm install

# Add your Gemini API key
echo "GEMINI_API_KEY=your_key_here" > .env.local

# Run the development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to use the app.

## Pages

| Route | Description |
|-------|-------------|
| `/` | Room analysis — upload & analyze |
| `/learn` | Feng Shui 101 — core concepts |

## Project Structure

```
app/
├── api/analyze/route.js    # Gemini Vision API endpoint
├── learn/page.js           # Feng Shui 101 educational page
├── page.js                 # Main analysis page
├── layout.js               # Root layout with NavBar
└── globals.css             # Design system & all styles
components/
├── NavBar.js               # Shared navigation
├── ImageUploader.js        # Drag-and-drop image upload
├── SpatialOverlay.js       # Canvas bounding-box overlay
└── FengShuiReport.js       # Score + violations display
lib/
├── fengshui-rules.js       # 35+ curated Feng Shui rules
├── fengshui-system-prompt.js # Anti-hallucination system prompt
└── score-calculator.js     # Weighted score calculation
```

## License

MIT
