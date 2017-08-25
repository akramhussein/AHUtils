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
        return NSLocalizedString(self, comment: "")
    }

    var length: Int {
        return self.characters.count
    }

    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func substring(length: Int) -> String {
        return self.substring(to: self.index(self.startIndex, offsetBy: length))
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

    public func contains(_ other: String) -> Bool {
        // rangeOfString returns nil if other is empty, destroying the analogy with (ordered) sets.
        if other.isEmpty {
            return true
        }
        return self.range(of: other) != nil
    }

    public func truncate(_ length: Int) -> String {
        if self.characters.count > length {
            let begining = self.substring(length: length)
            return "\(begining)…"
        } else {
            return self
        }
    }

    public func startsWith(_ other: String) -> Bool {
        // rangeOfString returns nil if other is empty, destroying the analogy with (ordered) sets.
        if other.isEmpty {
            return true
        }
        if let range = self.range(of: other, options: NSString.CompareOptions.anchored) {
            return range.lowerBound == self.startIndex
        }
        return false
    }

    public func endsWith(_ other: String) -> Bool {
        // rangeOfString returns nil if other is empty, destroying the analogy with (ordered) sets.
        if other.isEmpty {
            return true
        }
        if let range = self.range(of: other, options: [NSString.CompareOptions.anchored, NSString.CompareOptions.backwards]) {
            return range.upperBound == self.endIndex
        }
        return false
    }

    /**
     Ellipsizes a String only if it's longer than `maxLength`

     "ABCDEF".ellipsize(4)
     // "AB…EF"

     :param: maxLength The maximum length of the String.

     :returns: A String with `maxLength` characters or less
     */
    public func ellipsize(maxLength: Int) -> String {
        if (maxLength >= 2) && (self.characters.count > maxLength) {
            let index1 = self.characters.index(self.startIndex, offsetBy: (maxLength + 1) / 2) // `+ 1` has the same effect as an int ceil
            let index2 = self.characters.index(self.endIndex, offsetBy: maxLength / -2)

            return self.substring(to: index1) + "…\u{2060}" + self.substring(from: index2)
        }
        return self
    }

    fileprivate var stringWithAdditionalEscaping: String {
        return self.replacingOccurrences(of: "|", with: "%7C", options: NSString.CompareOptions(), range: nil)
    }

    public var asURL: URL? {
        return URL(string: self) ?? URL(string: self.stringWithAdditionalEscaping)
    }

    /// Returns a new string made by removing the leading String characters contained
    /// in a given character set.
    public func stringByTrimmingLeadingCharactersInSet(_ set: CharacterSet) -> String {
        var trimmed = self
        while trimmed.rangeOfCharacter(from: set)?.lowerBound == trimmed.startIndex {
            trimmed.remove(at: trimmed.startIndex)
        }
        return trimmed
    }

    public func containsIgnoringCase(find: String) -> Bool {
        return (self.range(of: find, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil) != nil)
    }
    
    public var first: String {
        return String(characters.prefix(1))
    }
    
    public var last: String {
        return String(characters.suffix(1))
    }
    
    public var uppercaseFirst: String {
        return self.first.uppercased() + String(characters.dropFirst())
    }
}
