import Foundation

protocol API {
  func data(for request: Request) async throws -> Data
  func decodable<D: Decodable>(for request: Request) async throws -> D
}

struct SebworkingAPI: API {
  func data(for request: Request) async throws -> Data {
    let urlRequest = try request.urlRequest
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    guard response.httpStatusCode?.isError != true else {
      throw APIError.invalidResponse(response)
    }
    return data
  }

  func decodable<D: Decodable>(for request: Request) async throws -> D {
    let data = try await data(for: request)
    return try data.decode(
      keyDecodingStrategy: request.keyDecodingStrategy,
      dateDecodingStrategy: request.dateDecodingStrategy
    )
  }
}
