import SwiftUI

struct ContentView: View {
    private enum Side: String {
        case heads = "Орёл"
        case tails = "Решка"

        var symbol: String {
            switch self {
            case .heads: return "🦅"
            case .tails: return "🌿"
            }
        }
    }

    @State private var side: Side = .heads
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 28) {
                Text("Орёл и Решка")
                    .font(.largeTitle.bold())

                Text(side.symbol)
                    .font(.system(size: 96))
                    .scaleEffect(isAnimating ? 1.2 : 1)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isAnimating)

                Text(side.rawValue)
                    .font(.title.weight(.semibold))

                Button(action: flip) {
                    Text("Подбросить")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }

    private func flip() {
        isAnimating = true
        side = Bool.random() ? .heads : .tails

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            isAnimating = false
        }
    }
}

#Preview {
    ContentView()
}
