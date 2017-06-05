import CBase58
import Foundation

public extension Data {
	public var base58encoded: String {
		var mult = 2
		while true {
			var enc = Data(repeating: 0, count: self.count * mult)

			let s = self.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> String? in
				var size = enc.count
				let success = enc.withUnsafeMutableBytes { ptr -> Bool in
					return b58enc(ptr, &size, bytes, self.count)
				}

				if success {
					return String(data: enc.subdata(in: 0..<size), encoding: .utf8)!
				}
				else {
					return nil
				}
			}

			if let s = s {
				return s
			}

			mult += 1
		}
	}

	public static func decode(base58: String) -> Data? {
		let source = base58.data(using: .utf8)!

		var bin = [UInt8](repeating: 8, count: source.count)

		var size = bin.count
		let success = source.withUnsafeBytes { (sourceBytes: UnsafePointer<CChar>) -> Bool in
			if b58tobin(&bin, &size, sourceBytes, source.count - 1) {
				return true
			}
			return false
		}

		if success {
			return Data(bytes: bin[(bin.count - size)..<bin.count])
		}
		return nil
	}
}

