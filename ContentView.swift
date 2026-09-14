import SwiftUI

struct ContentView: View {
    @AppStorage("helpora.onboardingComplete") private var onboardingComplete = false

    var body: some View {
        Group {
            if onboardingComplete {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
    }
}
