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
                
                Section("색상 정보") {
                    TextField("컬러 계열", text: $colorFamily)
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
