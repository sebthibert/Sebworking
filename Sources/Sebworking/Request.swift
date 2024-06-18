import Foundation

protocol Request {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var queryItems: [URLQueryItem]? { get }
  var httpMethod: RequestMethod { get }
  var headers: [String: String]? { get }
  var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy? { get }
  var dateEncodingStrategy: JSONEncoder.DateEncodingStrategy? { get }
  var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy? { get }
  var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? { get }
}

extension Request {
  var scheme: String { "https" }
  var queryItems: [URLQueryItem]? { nil }
  var httpMethod: RequestMethod { .get }
  var headers: [String: String]? { nil }
  var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy? { nil }
  var dateEncodingStrategy: JSONEncoder.DateEncodingStrategy? { nil }
  var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy? { nil }
  var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? { nil }

  private var components: URLComponents {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    components.percentEncodedQueryItems = queryItems
    return components
  }

  var urlRequest: URLRequest {
    get throws {
      guard let url = components.url else {
        throw RequestError.invalidURLComponents(components)
      }
      var request = URLRequest(url: url)
      request.httpMethod = String(describing: httpMethod)
      request.allHTTPHeaderFields = headers
      request.httpBody = try httpMethod.body(
        keyEncodingStrategy: keyEncodingStrategy,
        dateEncodingStrategy: dateEncodingStrategy
      )
      return request
    }
  }
}
