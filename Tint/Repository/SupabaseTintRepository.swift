import Foundation

struct SupabaseTintRepository: TintRepository {

    func fetchTints() async throws -> [Tint] {
        let url = URL(string: TintApiConfig.serverURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(TintApiConfig.apiKey, forHTTPHeaderField: "apikey")

        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode([Tint].self, from: data)
    }

    func saveTint(_ tint: Tint) async throws {
        let url = URL(string: TintApiConfig.serverURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(TintApiConfig.apiKey, forHTTPHeaderField: "apikey")

        request.httpBody = try JSONEncoder().encode(tint)

        _ = try await URLSession.shared.data(for: request)
    }

    func deleteTint(_ id: String) async throws {
        let url = URL(string: "\(TintApiConfig.projectURL)/rest/v1/cosmetics?id=eq.\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue(TintApiConfig.apiKey, forHTTPHeaderField: "apikey")

        _ = try await URLSession.shared.data(for: request)
    }
}
