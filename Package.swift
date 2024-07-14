// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EDTests",
    platforms: [.macOS(.v13)],
    targets: [
        .target(name: "CCode", path: "Sources/CCode"),
        .target(name: "EstruturaDeDados", path: "Sources/EstruturaDeDados"),
        .executableTarget(
            name: "EDTests",
            dependencies: [
                "CCode",
                "EstruturaDeDados"
            ]
        ),
    ]
)
