# Feng Shui — AI Room Analyzer (Flutter)

A multiplatform mobile application that analyzes room photos using AI (Google Gemini Vision) and provides detailed Feng Shui reports with spatial mapping, scoring, and actionable recommendations.

## Features

- **AI Room Analysis** — Upload a photo, get instant Feng Shui evaluation
- **Spatial Map** — Visual bounding-box overlay showing detected elements and command position
- **Detailed Report** — Score (A+ to F), violations with severity, positive aspects, element balance, chi flow analysis
- **Redesign Prompt** — AI-generated prompt for room redesign tools
- **Feng Shui 101** — Comprehensive educational content covering Chi, Command Position, Five Elements, Bagua Map, and room-by-room tips
- **Multilanguage** — English and Turkish (extensible)

## Architecture

Clean Architecture with feature-based modularity:

```
lib/
├── core/            # Theme, l10n, network, error handling, utilities
├── features/
│   ├── analysis/    # Room analysis (data → domain → presentation)
│   ├── learn/       # Educational content
│   └── settings/    # Language switcher, about
├── router/          # GoRouter with bottom navigation shell
└── main.dart
```

### Tech Stack

| Layer              | Technology                    |
| ------------------ | ----------------------------- |
| State Management   | Riverpod (StateNotifier)      |
| Routing            | GoRouter (ShellRoute)         |
| HTTP Client        | Dio (with error interceptors) |
| Internationalization | Flutter intl + ARB files    |
| Fonts              | Google Fonts (Inter, Outfit)  |
| Image Picking      | image_picker                  |

## Getting Started

### Prerequisites

- Flutter SDK >= 3.27.0 (Dart >= 3.6.0)
- Android Studio / Xcode for platform builds
- A deployed backend proxy (see Backend Proxy section)

### Setup

```bash
# 1. Navigate to the Flutter project
cd feng_shui_app

# 2. Generate platform directories (if not present)
flutter create .

# 3. Install dependencies
flutter pub get

# 4. Generate localization files
flutter gen-l10n

# 5. Run in development
flutter run --dart-define=API_BASE_URL=http://localhost:3000
```

### Backend Proxy

The app does **not** ship the Gemini API key. It calls a backend proxy that holds the key server-side.

**Option A — Use the existing Next.js app:**

```bash
# In the web project root
npm install
echo "GEMINI_API_KEY=your_key" > .env.local
npm run dev
# Proxy runs at http://localhost:3000
```

**Option B — Deploy to Vercel:**

Deploy the Next.js project and set `GEMINI_API_KEY` as an environment variable, then pass the URL:

```bash
flutter run --dart-define=API_BASE_URL=https://your-app.vercel.app
```

### Environment Configuration

Pass build-time configuration via `--dart-define`:

```bash
# Development
flutter run --dart-define=API_BASE_URL=http://localhost:3000

# Production
flutter run --release --dart-define=API_BASE_URL=https://api.fengshui.app
```

## Testing

```bash
# Unit and widget tests
flutter test

# Specific test file
flutter test test/core/utils/score_calculator_test.dart
```

## Adding a New Language

1. Create `lib/core/l10n/app_XX.arb` (copy `app_en.arb` as template)
2. Translate all strings
3. Run `flutter gen-l10n`
4. The new locale is automatically available

## Project Structure

```
feng_shui_app/
├── lib/
│   ├── main.dart                           # Entry point
│   ├── app.dart                            # MaterialApp.router with i18n
│   ├── core/
│   │   ├── constants/fengshui_rules.dart   # 35+ Feng Shui rules
│   │   ├── error/                          # Failure/Exception types
│   │   ├── l10n/                           # ARB translation files
│   │   ├── network/                        # Dio client + API constants
│   │   ├── theme/                          # Colors, text styles, theme
│   │   └── utils/score_calculator.dart     # Score grading logic
│   ├── features/
│   │   ├── analysis/
│   │   │   ├── data/                       # API data source, repository impl
│   │   │   ├── domain/                     # Entities, repository interface, use case
│   │   │   └── presentation/              # Providers, screens, widgets
│   │   ├── learn/presentation/            # Educational screens and widgets
│   │   └── settings/presentation/         # Settings screen, locale provider
│   └── router/app_router.dart             # GoRouter config
├── test/                                   # Unit and widget tests
├── pubspec.yaml
├── l10n.yaml
└── analysis_options.yaml
```
