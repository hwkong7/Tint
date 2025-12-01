import SwiftUI

struct TintAddView: View {
    @Environment(\.dismiss) var dismiss
    let viewModel: TintViewModel
    
    @State var productName = ""
    @State var brand = ""
    @State var colorFamily = ""
    @State var rating = 5
    @State var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("제품 정보 *") {
                    TextField("제품명", text: $productName)
                    TextField("브랜드", text: $brand)
                }
                
                Section(header: Text("컬러 선택")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 14) {
                            ForEach(tintColors.keys.sorted(), id: \.self) { key in
                                let color = tintColors[key]!

                                ZStack {
                                    Circle()
                                        .fill(color)
                                        .frame(width: 36, height: 36)
                                        .shadow(radius: 2)

                                    // 선택된 색상은 테두리 표시
                                    if colorFamily == key {
                                        Circle()
                                            .stroke(Color.black.opacity(0.8), lineWidth: 2)
                                            .frame(width: 42, height: 42)
                                    }
                                }
                                .onTapGesture {
                                    colorFamily = key
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }

                
                Section("평점 *") {
                    Picker("평점", selection: $rating) {
                        ForEach(1...10, id: \.self) { score in
                            Text("\(score)점")
                        }
                    }
                }
                
                Section("설명") {
                    TextEditor(text: $description)
                        .frame(height: 120)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("추가") {
                        Task {
                            let tint = Tint(
                                id: UUID(),
                                productName: productName,
                                brand: brand,
                                colorFamily: colorFamily,
                                rating: rating,
                                description: description
                            )
                            
                            await viewModel.addTint(tint)
                            dismiss()
                        }
                    }
                    .disabled(productName.isEmpty || brand.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") { dismiss() }
                }
            }
        }
    }
}
