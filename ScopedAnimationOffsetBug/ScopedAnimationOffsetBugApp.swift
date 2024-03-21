import SwiftUI

struct ContentView: View {
    
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Toggle Scoped Animation") {
                animate.toggle()
            }
            Button("Toggle withAnimation{}") {
                withAnimation {
                    animate.toggle()
                }
            }
            Text("Hello, world!")
                .animation(.default) {
                    $0
                        .opacity(animate ? 1 : 0.2)
                        .offset(y: animate ? 0 : 100) // <-- DOESN'T WORK
                }
        }
    }
}

#Preview {
    ContentView()
}

@main
struct ScopedAnimationOffsetBugApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
