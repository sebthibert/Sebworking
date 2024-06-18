import Foundation

enum RequestMethod: CustomStringConvertible {
  case get
  case post(Encodable)

  var description: String {
    switch self {
    case .get: "GET"
    case .post: "POST"
    }
  }

  func body(
    keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy?,
    dateEncodingStrategy: JSONEncoder.DateEncodingStrategy?
  ) throws -> Data? {
    switch self {
    case .get:
      nil
    case .post(let value):
      try value.encode(
        keyEncodingStrategy: keyEncodingStrategy,
        dateEncodingStrategy: dateEncodingStrategy
      )
    }
  }
}
