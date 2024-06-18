// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Sebworking",
  platforms: [.iOS(.v16)],
  products: [
    .library(name: "Sebworking", targets: ["Sebworking"])
  ],
  targets: [
    .target(name: "Sebworking"),
    .testTarget(name: "SebworkingTests", dependencies: ["Sebworking"])
  ]
)
