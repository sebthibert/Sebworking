import Foundation

enum APIError: Error {
  case invalidResponse(URLResponse)
}

extension APIError: Hashable {}
