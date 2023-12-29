// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of 
// Swift required to build this package.
import PackageDescription
let package = Package(
  name: "SSGoogleLogin",
  platforms: [.iOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces,
    //and make them visible to other packages.
    .library(
      name: "SSGoogleLogin",
      targets: ["SSGoogleLogin"]
    ),
  ],
  dependencies: [
   .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. 
    // A target can define a module or a test suite.
    // Targets can depend on other targets in this package,
    // and products in packages this package depends on.
    .target(
      name: "SSGoogleLogin",
      dependencies: [
        .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")
        ],
      path: "GoogleSigninReusabelComponets/Classes" //Change group name if you set it different
     ) 
  ]
)