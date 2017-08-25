import Foundation

internal class Resources {

    private static var framework: Bundle {
        return Bundle(for: Resources.self)
    }

    public static var general: Bundle {
        guard let path = Resources.framework.path(forResource: "AHUtils", ofType: "bundle"),
            let bundle = Bundle(path: path) else {
            fatalError("AHUtils.bundle not found")
        }

        return bundle
    }

    public static func image(_ named: String, compatibleWith: UITraitCollection? = nil) -> UIImage? {
        return UIImage(named: named, in: Resources.general, compatibleWith: nil)
    }

}
