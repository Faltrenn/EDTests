// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EDTests",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/Faltrenn/estrutura-de-dados", branch: "main")
    ],
    targets: [
        .target(name: "CCode", path: "Sources/CCode"),
        .executableTarget(
            name: "EDTests",
            dependencies: [
                .product(name: "EstruturaDeDados", package: "estrutura-de-dados"),
                "CCode"
            ]
        ),
    ]
)
