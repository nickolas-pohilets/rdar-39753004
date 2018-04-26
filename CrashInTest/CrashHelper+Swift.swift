import Foundation

private func dummy() -> Bool {
    let x: UInt32 = arc4random();
    return (x + x) != (x << 1);
}

extension CrashHelper {
    @objc
    public static func raiseSwiftFatal() {
        var x: String? = nil
        if (dummy()) {
            x = "abc"
        }
        print(x!)
    }
}
