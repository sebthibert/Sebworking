import Foundation

extension URLResponse {
  private var statusCode: Int? {
    (self as? HTTPURLResponse)?.statusCode
  }

  var httpStatusCode: HTTPStatusCode? {
    statusCode.flatMap { .init(code: $0) }
  }
}
