import Foundation

extension URLResponse {
  public var httpStatusCode: HTTPStatusCode? {
    let httpResponse = self as? HTTPURLResponse
    return httpResponse.flatMap { .init(code: $0.statusCode) }
  }
}
