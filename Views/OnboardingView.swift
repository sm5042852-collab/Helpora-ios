import SwiftUI

struct OnboardingView: View {
    @AppStorage("helpora.onboardingComplete") private var onboardingComplete = false
    @State private var page = 0
    @State private var language = "English"

    private let pages = [
        OnboardingPage(icon: "heart.fill", title: "Welcome to HELPORA", subtitle: "Together we are stronger."),
        OnboardingPage(icon: "person.2.fill", title: "Community matters", subtitle: "Ask for help, offer support and meet people safely."),
        OnboardingPage(icon: "checkmark.shield.fill", title: "Built around trust", subtitle: "Safety, respect and community are at the center.")
    ]

    var body: some View {
        VStack(spacing: 28) {
            HStack {
                Text("HELPORA").font(.headline.bold())
                Spacer()
                Picker("Language", selection: $language) {
                    Text("English").tag("English")
                    Text("Türkçe").tag("Türkçe")
                    Text("Deutsch").tag("Deutsch")
                    Text("Kurdî").tag("Kurdî")
                    Text("العربية").tag("العربية")
                }
                .pickerStyle(.menu)
            }
            .padding(.horizontal)

            TabView(selection: $page) {
                ForEach(Array(pages.enumerated()), id: \.offset) { index, item in
                    VStack(spacing: 24) {
                        Image(systemName: item.icon)
                            .font(.system(size: 70))
                            .foregroundStyle(.purple)
                        Text(item.title)
                            .font(.largeTitle.bold())
                            .multilineTextAlignment(.center)
                        Text(item.subtitle)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(32)
                    .tag(index)
                }
            }
            .tabViewStyle(.page)

            Button(page == pages.count - 1 ? "Start HELPORA" : "Continue") {
                if page == pages.count - 1 {
                    onboardingComplete = true
                } else {
                    page += 1
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal)
        }
        .padding(.vertical, 24)
    }
}

private struct OnboardingPage {
    let icon: String
    let title: String
    let subtitle: String
}
