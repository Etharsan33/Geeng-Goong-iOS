//
//  NSAttributedString+Extension.swift
//  MySwiftSpeedUpTools
//
//  Created by Elankumaran Tharsan on 21/07/2020.
//  Copyright © 2020 Elankumaran Tharsan. All rights reserved.
//


/// EXTENSION GET FROM SWIFTERSWIFT

#if canImport(Foundation)
import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

// MARK: - Properties
public extension NSAttributedString {

    #if os(iOS)
    /// SwifterSwift: Bolded string.
    var bolded: NSAttributedString {
        return applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    #endif

    #if !os(Linux)
    /// SwifterSwift: Underlined string.
    var underlined: NSAttributedString {
        return applying(attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    #endif

    #if os(iOS)
    /// SwifterSwift: Italicized string.
    var italicized: NSAttributedString {
        return applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    #endif

    #if !os(Linux)
    /// SwifterSwift: Struckthrough string.
    var struckthrough: NSAttributedString {
        return applying(attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    #endif

    #if !os(Linux)
    /// SwifterSwift: Dictionary of the attributes applied across the whole string
    var attributes: [NSAttributedString.Key: Any] {
        guard self.length > 0 else { return [:] }
        return attributes(at: 0, effectiveRange: nil)
    }
    #endif

}

// MARK: - Methods
public extension NSAttributedString {

    #if !os(Linux)
    /// SwifterSwift: Applies given attributes to the new instance of NSAttributedString initialized with self object
    ///
    /// - Parameter attributes: Dictionary of attributes
    /// - Returns: NSAttributedString with applied attributes
    func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes(attributes, range: range)

        return copy
    }
    #endif

    #if canImport(AppKit) || canImport(UIKit)
    /// SwifterSwift: Add color to NSAttributedString.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString colored with given color.
    func colored(with color: UIColor) -> NSAttributedString {
        return applying(attributes: [.foregroundColor: color])
    }
    #endif

    #if !os(Linux)
    /// SwifterSwift: Apply attributes to substrings matching a regular expression
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes
    ///   - pattern: a regular expression to target
    ///   - options: The regular expression options that are applied to the expression during matching. See NSRegularExpression.Options for possible values.
    /// - Returns: An NSAttributedString with attributes applied to substrings matching the pattern
    func applying(attributes: [NSAttributedString.Key: Any],
                  toRangesMatching pattern: String,
                  options: NSRegularExpression.Options = []) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: options) else { return self }

        let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
        let result = NSMutableAttributedString(attributedString: self)

        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }

        return result
    }

    /// SwifterSwift: Apply attributes to occurrences of a given string
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes
    ///   - target: a subsequence string for the attributes to be applied to
    /// - Returns: An NSAttributedString with attributes applied on the target string
    func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"

        return applying(attributes: attributes, toRangesMatching: pattern)
    }
    #endif

}

// MARK: - Operators
public extension NSAttributedString {

    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add to.
    ///   - rhs: NSAttributedString to add.
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }

    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add.
    ///   - rhs: NSAttributedString to add.
    /// - Returns: New instance with added NSAttributedString.
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }

    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add to.
    ///   - rhs: String to add.
    static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }

    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add.
    ///   - rhs: String to add.
    /// - Returns: New instance with added NSAttributedString.
    static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }

}

#endif
