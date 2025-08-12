# DBT+

Minimal Flutter + Firebase starter for DBT skills app.

## Setup
1. Install [Flutter](https://flutter.dev) and [Firebase CLI](https://firebase.google.com/docs/cli).
2. Create a Firebase project and update `.firebaserc` with your project id.
3. Enable Firestore, Auth, Analytics, Crashlytics, Remote Config, Storage and Hosting.
4. Run in `dbt_plus/`:
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter gen-l10n
   ```
5. Configure platforms (Android/iOS/Web) with `flutter create .` if needed.
6. To run the app:
   ```bash
   flutter run
   ```

## Cloud Functions
In `functions/`:
```bash
npm install
npm run build
firebase deploy --only functions
```
Set `OPENAI_API_KEY` via `firebase functions:secrets:set` before deploying.

## Localization
ARB files live under `lib/core/l10n`. Use `flutter gen-l10n` after editing.

## Testing
Run `flutter test` in `dbt_plus/`.

## GDPR
User data is stored in Firebase. Ensure you update privacy policy and comply with local regulations.
