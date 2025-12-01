import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TintListView()   // 목록
                .tabItem {
                    Image(systemName: "paintpalette")
                    Text("Tint")
                }

            TintView()       // 랭킹 화면
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Rank")
                }
        }
    }
}

#Preview {
    ContentView()
}
