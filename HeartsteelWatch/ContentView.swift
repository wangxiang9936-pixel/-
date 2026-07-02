import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image("Heartsteel")
                .resizable()
                .scaledToFit()
                .padding(8)
        }
        .accessibilityLabel("心之钢")
    }
}
