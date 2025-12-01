import SwiftUI

struct TintView: View {
    @State private var viewModel = TintViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    
                    //popularSection
                    ScrollView {
                        VStack(alignment: .leading, spacing: 28) {
                            
                            popularSection

                            // 💄 예쁜 구분선
                            HStack {
                                Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 1)
                                Text("🤍")
                                Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 1)
                            }
                            .padding(.vertical, 8)
                            
                            ratingSection
                        }
                        .padding()
                    }

                    //ratingSection
                }
                .padding()
            }
            .navigationTitle("Tint 랭킹차트")
            .task {
                await viewModel.loadTints()
            }
        }
    }
}

extension TintView {
    
    // MARK: 인기 Top 3
    private var popularSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("❤ 인기 Top 3")
                .font(.title2)
                .bold()
            
            ForEach(Array(viewModel.tints.prefix(3))) { tint in
                card(tint)
            }
        }
    }
    
    
    // MARK: 평점 높은 Top 3
    private var ratingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🌟 평점 Top 3")
                .font(.title2)
                .bold()
            
            ForEach(Array(viewModel.tints.sorted { $0.rating > $1.rating }.prefix(3))) { tint in
                card(tint)
            }
        }
    }
    
    // MARK: 카드 UI
    private func card(_ tint: Tint) -> some View {
        NavigationLink(value: tint) {
            VStack(alignment: .leading, spacing: 8) {
                Text(tint.productName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("\(tint.brand) · \(tint.colorFamily ?? "-")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("⭐️ \(tint.rating)")
                        .font(.body)
                        .foregroundColor(.pink)
                    Spacer()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 4)
            )
        }
    }
}
