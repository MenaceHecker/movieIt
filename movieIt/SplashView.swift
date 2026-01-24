import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var isAnimating = false

    var body: some View {
        Group {
            if isActive {
                ContentView()
            } else {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    VStack(spacing: 16) {
                        // Logo with white background handled by rounded mask and subtle shadow
                        Image("movieIt_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
                            .scaleEffect(isAnimating ? 1.0 : 0.9)
                            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isAnimating)

                        Text("movieIt")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Find. Watch. Enjoy.")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))

                        // Loading indicator
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(.white)
                            .scaleEffect(1.2)
                            .padding(.top, 8)
                    }
                }
            }
        }
        .onAppear {
            // Starting pulsing animation independent of navigation state
            isAnimating = true

            // Navigating right after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut) {
                    isActive = true
                    // Stopping the animation once transitioning
                    isAnimating = false
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

