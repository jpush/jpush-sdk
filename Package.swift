// swift-tools-version:5.3
import PackageDescription

// 客户 UTS 静态 Framework 验证分支，不代表正常公有云版本发布。
let package = Package(
    name: "JPush",
    platforms: [.iOS(.v8)],
    products: [.library(name: "JPush", targets: ["JPushWrapper"])],
    targets: [
        .target(
            name: "JPushWrapper",
            dependencies: ["JPush"],
            path: "JPushWrapper",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("Foundation"),
                .linkedFramework("Security"),
                .linkedFramework("WebKit"),
                .linkedLibrary("z"),
                .linkedLibrary("resolv"),
                .linkedFramework("UserNotifications", .when(platforms: [.iOS]))
            ]
        ),
        .binaryTarget(name: "JPush", path: "JPush.xcframework")
    ]
)
