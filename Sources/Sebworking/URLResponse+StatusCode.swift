import Foundation

extension URLResponse {
  private var statusCode: Int? {
    (self as? HTTPURLResponse)?.statusCode
  }

  public var httpStatusCode: HTTPStatusCode? {
    statusCode.flatMap { .init(code: $0) }
  }
}
