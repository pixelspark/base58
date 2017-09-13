// swift-tools-version:3.1
import PackageDescription

let package = Package(
	name: "Base58",
	targets: [
		Target(name: "Base58", dependencies: ["CBase58"])
	],
	dependencies: [
		.Package(url: "https://github.com/IBM-Swift/BlueCryptor.git", majorVersion: 0)
	]
)
