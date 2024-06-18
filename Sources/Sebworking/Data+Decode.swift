import Foundation

extension Data {
  func decode<D: Decodable>(
    keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy?,
    dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?
  ) throws -> D {
    let decoder = JSONDecoder()
    keyDecodingStrategy.map { decoder.keyDecodingStrategy = $0 }
    dateDecodingStrategy.map { decoder.dateDecodingStrategy = $0 }
    return try decoder.decode(D.self, from: self)
  }
}
