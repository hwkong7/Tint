import SwiftUI

struct TintView: View {
    @State private var viewModel = TintViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: ⭐️ 인기 틴트 Top 3 (단순 최신순)
                    popularSection
                    
                    // MARK: ⭐️ 평점 높은 틴트 Top 3
                    ratingSection
                }
                .padding()
            }
            .navigationTitle("Tint 홈")
            .task {
                await viewModel.loadTints()
            }
        }
    }
}

// MARK: - 섹션 UI 정리
extension TintView {
    
    // 인기순: 최신순 정렬한 Top 3
    private var popularSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💄 인기 틴트 Top 3")
                .font(.title3)
                .bold()
            
            let popular = Array(viewModel.tints.prefix(3))
            
            ForEach(popular) { tint in
                tintRow(tint)
            }
        }
    }
    
    // 평점순: rating 높은 순 Top 3
    private var ratingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("⭐️ 평점 높은 Top 3")
                .font(.title3)
                .bold()
            
            let topRated = viewModel.tints.sorted { $0.rating > $1.rating }.prefix(3)
            
            ForEach(topRated) { tint in
                tintRow(tint)
            }
        }
    }
    
    // 각각의 row UI
    private func tintRow(_ tint: Tint) -> some View {
        NavigationLink(value: tint) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(tint.productName)
                        .font(.headline)
                    Text("\(tint.brand) · \(tint.colorFamily ?? "-")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text("\(tint.rating)")
                    .font(.title3)
                    .foregroundColor(.pink)
            }
            .padding(.vertical, 4)
        }
    }
}
