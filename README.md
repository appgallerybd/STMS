# STMS — Salat Time Management System

STMS is a Bangladesh-first mosque prayer-time management platform.

## Project structure

This repository starts with the Flutter-based worshipper mobile app. The planned platform has three parts:

1. **STMS Mobile** — Android app for worshippers, mosque discovery, prayer-time updates and notifications.
2. **Mosque Admin** — responsive web panel for approved mosque administrators.
3. **Super Admin** — separate responsive web panel for platform-wide approvals, security and reporting.

## Current status

- [x] Flutter app foundation and Bengali-first Material 3 interface
- [x] GitHub Actions Android debug APK build
- [ ] Firebase project configuration and authentication
- [ ] Live prayer-time data and mosque approval workflow
- [ ] Push notifications and nearby mosque map
- [ ] Production security rules, audit logs and release signing

The initial app uses clearly labeled demo prayer-time data. It does not yet connect to a live database or send notifications.

## Build on GitHub

Pushes to `main` trigger the Android debug APK workflow. Open **Actions**, select the latest successful workflow run, and download the `stms-debug-apk` artifact.

## Build locally

Install Flutter and Android SDK, then run:

```bash
flutter pub get
flutter run
flutter build apk --debug
```

## Security

Never commit Firebase service-account keys, signing keystores, passwords, API secrets or personal data. Production authentication and authorization must be configured and tested before real mosque data is used.
