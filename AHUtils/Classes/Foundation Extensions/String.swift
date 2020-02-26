//
//  String.swift
//  AHUtils
//
//  Created by Akram Hussein on 08/23/2017.
//  Copyright (c) 2017 Akram Hussein. All rights reserved.
//

import Foundation

public extension String {
    var localized: String {
        let value = NSLocalizedString(self, comment: "")
        if value != self || NSLocale.preferredLanguages.first == "en" {
            return value
        }

        // Fall back to en
        guard
            let path = Bundle.main.path(forResource: "en", ofType: "lproj"),
            let bundle = Bundle(path: path)
            else { return value }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }

    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    subscript(i: Int) -> String {
        return String(Array(arrayLiteral: self)[i])
    }

    func location(_ other: String) -> Int {
        return (self as NSString).range(of: other).location
    }

    var isNumeric: Bool {
        return (self as NSString).rangeOfCharacter(from: CharacterSet.decimalDigits.inverted).location == NSNotFound
    }

    func removeWords(_ words: [String]) -> String {
        var cleanedString = self

        // Remove common words
        for word in words {
            cleanedString = cleanedString.replacingOccurrences(of: word, with: "", options: NSString.CompareOptions.literal, range: nil)
        }

        // strip newlines and spaces
        cleanedString = cleanedString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        return cleanedString
    }

    func replace(_ string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    var removeWhitespace: String {
        return self.replace(" ", replacement: "")
    }

    func contains(_ other: String) -> Bool {
        // rangeOfString returns nil if other is empty, destroying the analogy with (ordered) sets.
        if other.isEmpty {
            return true
        }
        return self.range(of: other) != nil
    }

    func startsWith(_ other: String) -> Bool {
        // rangeOfString returns nil if other is empty, destroying the analogy with (ordered) sets.
        if other.isEmpty {
            return true
        }
        if let range = self.range(of: other, options: NSString.CompareOptions.anchored) {
            return range.lowerBound == self.startIndex
        }
        return false
    }

    func endsWith(_ other: String) -> Bool {
        // rangeOfString returns nil if other is empty, destroying the analogy with (ordered) sets.
        if other.isEmpty {
            return true
        }
        if let range = self.range(of: other, options: [NSString.CompareOptions.anchored, NSString.CompareOptions.backwards]) {
            return range.upperBound == self.endIndex
        }
        return false
    }

    fileprivate var stringWithAdditionalEscaping: String {
        return self.replacingOccurrences(of: "|", with: "%7C", options: NSString.CompareOptions(), range: nil)
    }

    var asURL: URL? {
        return URL(string: self) ?? URL(string: self.stringWithAdditionalEscaping)
    }

    /// Returns a new string made by removing the leading String characters contained
    /// in a given character set.
    func stringByTrimmingLeadingCharactersInSet(_ set: CharacterSet) -> String {
        var trimmed = self
        while trimmed.rangeOfCharacter(from: set)?.lowerBound == trimmed.startIndex {
            trimmed.remove(at: trimmed.startIndex)
        }
        return trimmed
    }

    func containsIgnoringCase(find: String) -> Bool {
        return (self.range(of: find, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil) != nil)
    }

    var uppercaseFirst: String {
        return self[0].uppercased() + String(self.dropFirst())
    }
}
