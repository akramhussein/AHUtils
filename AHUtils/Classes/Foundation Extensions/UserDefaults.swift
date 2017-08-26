import Foundation

public struct Defaults {

    // Set user defaults key - Bool
    public static func setUserDefaultsKey(_ key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }

    // Set user defaults key - Int
    public static func setUserDefaultsKey(_ key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }

    // Set user defaults key - String
    public static func setUserDefaultsKey(_ key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    public static func setUserDefaultsKey(_ key: String, value: AnyObject) {
        UserDefaults.standard.set(value, forKey: key)
    }

    // Get user defaults key
    public static func getUserDefaultsKey(_ key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }

    public static func getUserDefaultsValueForKeyAsInt(_ key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }

    public static func getUserDefaultsValueForKeyAsString(_ key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }

    public static func getUserDefaultsValueForKeyAsObject(_ key: String) -> AnyObject? {
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }

    public static func resetUserDefaultsValueForKey(_ key: String) {
        return UserDefaults.standard.set(nil, forKey: key)
    }

    public static func removeUserDefaultsValueForKey(_ key: String){
        return UserDefaults.standard.removeObject(forKey: key)
    }
}
