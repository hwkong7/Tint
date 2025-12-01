import SwiftUI

struct TintDetailView: View {
    let tint: Tint
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(tint.brand)
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text("색상 계열: \(tint.colorFamily ?? "-")")
                .font(.body)

            Text("평점: \(tint.rating)")
                .font(.title3)
                .foregroundColor(.pink)

            Text(tint.description ?? "(설명 없음)")
                .font(.body)

            Spacer()
        }
        .padding()
        .navigationTitle(tint.productName)
        .navigationBarTitleDisplayMode(.large)
    }
}
