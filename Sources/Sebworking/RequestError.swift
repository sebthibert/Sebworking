import Foundation

enum RequestError: Error {
  case invalidURLComponents(URLComponents)
}

extension RequestError: Hashable {}
