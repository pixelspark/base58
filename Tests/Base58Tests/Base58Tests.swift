import XCTest
import Base58

class Base58Tests: XCTestCase {
	func testBase58() {
		let enc = "Hello".data(using: .utf8)!.base58encoded
		XCTAssert(enc == "9Ajdvzr")

		let dec = String(data: Data.decode(base58: enc)!, encoding: .utf8)!
		XCTAssert(dec == "Hello")

		let encChecked = "Hello".data(using: .utf8)!.base58checkEncoded(version: 1)
		XCTAssert(encChecked == "5BShidwAu2ieX")

		let decChecked =  String(data: Data.decodeChecked(base58: encChecked, version: 1)!, encoding: .utf8)!
		XCTAssert(decChecked == "Hello")
	}
}
