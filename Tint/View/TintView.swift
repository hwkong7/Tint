import SwiftUI

struct TintView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.pink)

                Text("Tint Page")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("여기는 틴트 화면이야! \n이제 여기서 목록, 추가, 상세 등을 만들면 돼 😄")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            .padding()
            .navigationTitle("Tint")
        }
    }
}

#Preview {
    TintView()
}
