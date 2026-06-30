import SwiftUI
import WatchKit

struct ContentView: View {
    @State private var shake: CGFloat = 0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image("Heartsteel")
                .resizable()
                .scaledToFit()
                .padding(8)
                .modifier(ShakeEffect(animatableData: shake))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            WKInterfaceDevice.current().play(.click)

            withAnimation(.linear(duration: 0.24)) {
                shake += 1
            }
        }
        .accessibilityLabel("心之钢")
        .accessibilityHint("点击振动一次")
        .accessibilityAddTraits(.isButton)
    }
}

private struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 8
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let offset = amount * sin(animatableData * .pi * 2 * shakesPerUnit)
        return ProjectionTransform(CGAffineTransform(translationX: offset, y: 0))
    }
}
