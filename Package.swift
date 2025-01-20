// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let vlcBinary = Target.binaryTarget(name: "VLCKit-all", url: "https://github.com/mertkarablt/VLCKit/releases/download/v3.6.1/VLCKit-all.xcframework.zip", checksum: "96fff0cc8efb60915943b56029f0c6eb2973498d7635d99d3d58d139413eedf2")

let package = Package(
    name: "VLCKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "VLCKit",
            targets: ["VLCKit"]),
    ],
    dependencies: [],
    targets: [
        vlcBinary,
        .target(
            name: "VLCKit",
            dependencies: [
                .target(name: "VLCKit-all")
            ], linkerSettings: [
                .linkedFramework("QuartzCore", .when(platforms: [.iOS])),
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("CoreText", .when(platforms: [.iOS])),
                .linkedFramework("AVFoundation", .when(platforms: [.iOS])),
                .linkedFramework("Security", .when(platforms: [.iOS])),
                .linkedFramework("CFNetwork", .when(platforms: [.iOS])),
                .linkedFramework("AudioToolbox", .when(platforms: [.iOS])),
                .linkedFramework("OpenGLES", .when(platforms: [.iOS])),
                .linkedFramework("CoreGraphics", .when(platforms: [.iOS])),
                .linkedFramework("VideoToolbox", .when(platforms: [.iOS])),
                .linkedFramework("CoreMedia", .when(platforms: [.iOS])),
                .linkedLibrary("c++", .when(platforms: [.iOS])),
                .linkedLibrary("xml2", .when(platforms: [.iOS])),
                .linkedLibrary("z", .when(platforms: [.iOS])),
                .linkedLibrary("bz2", .when(platforms: [.iOS])),
                .linkedLibrary("iconv")
            ]),
    ]
)
