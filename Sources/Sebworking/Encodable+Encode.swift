import Foundation

extension Encodable {
  public func encode(
    keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy?,
    dateEncodingStrategy: JSONEncoder.DateEncodingStrategy?
  ) throws -> Data {
    let encoder = JSONEncoder()
    keyEncodingStrategy.map { encoder.keyEncodingStrategy = $0 }
    dateEncodingStrategy.map { encoder.dateEncodingStrategy = $0 }
    return try encoder.encode(self)
  }
}
