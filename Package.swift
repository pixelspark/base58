import PackageDescription

let package = Package(
	name: "Base58",
	targets: [
		Target(name: "Base58", dependencies: ["CBase58"])
	],
	dependencies: [
	]
)
