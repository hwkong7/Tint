import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TintListView()   // 목록
                .tabItem {
                    Image(systemName: "paintpalette")
                    Text("Tint")
                }

            TintView()       // 소개 화면
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("About")
                }
        }
    }
}

#Preview {
    ContentView()
}
