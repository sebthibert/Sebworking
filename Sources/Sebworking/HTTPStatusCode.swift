import Foundation

enum HTTPStatusCode: Equatable {
  case informational(Int)
  case success(Int)
  case redirection(Int)
  case clientError(Int)
  case serverError(Int)
  case unknown(Int)

  init(code: Int) {
    self = switch code {
    case 100...199: .informational(code)
    case 200...299: .success(code)
    case 300...399: .redirection(code)
    case 400...499: .clientError(code)
    case 500...599: .serverError(code)
    default: .unknown(code)
    }
  }

  var isError: Bool {
    switch self {
    case .clientError, .serverError: true
    default: false
    }
  }
}
