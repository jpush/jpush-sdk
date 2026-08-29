// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JPush",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "JPush",
            targets: ["JPushWrapper"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Wrapper target 用于链接系统框架和库
        .target(
            name: "JPushWrapper",
            dependencies: [
                "JPush"
            ],
            path: "JPushWrapper",
            linkerSettings: [
                // System Frameworks
                .linkedFramework("UIKit"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("Foundation"),
                .linkedFramework("Security"),
                .linkedFramework("WebKit"),
                .linkedFramework("UserNotifications", .when(platforms: [.iOS])),
                // System Libraries
                .linkedLibrary("z"),
                .linkedLibrary("resolv"),
            ]
        ),
        // 二进制 xcframework 目标
        .binaryTarget(
            name: "JPush",
            path: "jpush-ios-5.3.2.xcframework"
        )
    ]
)
