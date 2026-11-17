# 🌐 Localization and Internationalization

## Current status
Do not assume the interface is fully localized unless translation resources and locale-aware formatting are implemented.

## Recommendations
- Store user-facing strings in translation resources.
- Keep translation keys stable and grouped by feature.
- Format dates, numbers and currency using explicit locale settings.
- Store timestamps consistently and display them in the user's selected timezone.
- Avoid concatenating sentence fragments.
- Provide accessible language metadata and translated validation messages.

## Currency
The application's currency and tax rules must be explicitly defined by product owners. Never infer currency from browser locale or silently convert amounts.

## Quality checks
Test long translated strings, date boundaries, right-to-left layout if supported and locale-aware screen-reader output.
