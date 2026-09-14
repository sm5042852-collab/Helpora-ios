import SwiftUI

struct VolunteerView: View {
    private let opportunities = [
        "Help at a community event",
        "Language support volunteer",
        "Newcomer guidance",
        "Community organizer"
    ]

    var body: some View {
        List(opportunities, id: \.self) { item in
            Label(item, systemImage: "hands.sparkles.fill")
        }
        .navigationTitle("Volunteer")
    }
}
