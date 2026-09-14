# HELPORA iOS Architecture

## Current stack
- Swift
- SwiftUI
- ObservableObject state stores
- UserDefaults for local prototype persistence

## Feature modules
- Onboarding
- Home
- Discover
- Help Requests
- Profile
- Trust Center
- Settings
- Inbox
- Notifications

## Data strategy
Local prototype data is isolated behind stores so it can later be replaced by a secure backend without rewriting every screen.

## Next architecture upgrade
1. Xcode project and targets
2. Swift Package dependencies
3. Authentication provider
4. Secure backend API
5. Cloud database
6. Push notifications
7. Automated tests
8. CI
