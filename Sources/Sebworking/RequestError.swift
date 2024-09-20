import Foundation

public enum RequestError: Error {
  case invalidURLComponents(URLComponents)
}

extension RequestError: Hashable {}
