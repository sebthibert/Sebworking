import Foundation

public enum APIError: Error {
  case invalidResponse(URLResponse)
}

extension APIError: Hashable {}
