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
                    Color.white
                        .ignoresSafeArea()

                    VStack(spacing: 16) {
                        #if canImport(UIKit)
                        if let uiImage = UIImage(named: "movieIt_logo") {
                            Image(uiImage: uiImage)
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFit()
                                .frame(width: 280, height: 280)
                                .scaleEffect(isAnimating ? 1.0 : 0.95)
                                .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isAnimating)
                        } else {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 56, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 280, height: 280)
                                .scaleEffect(isAnimating ? 1.0 : 0.95)
                                .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isAnimating)
                        }
                        #endif

                        Text("Find. Watch. Enjoy.")
                            .font(.headline)
                            .foregroundColor(.red)

                        // Loading indicator
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(.red)
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

