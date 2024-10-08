/*
 MIT License
 
 Copyright (c) 2017-2019 MessageKit
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import Foundation
import UIKit

internal extension UIColor {

    private static func colorFromAssetBundle(named: String) -> UIColor {
        if #available(iOS 11.0, *) {
            guard let color = UIColor(named: named, in: Bundle.messageKitAssetBundle, compatibleWith: nil) else {
                fatalError(MessageKitError.couldNotFindColorAsset)
            }
            return color
        }
        // For iOS 10
        switch named {
        case "incomingMessageBackground":
            return UIColor(red: 230/255, green: 230/255, blue: 235/255, alpha: 1.0)
        case "outgoingMessageBackground":
            return UIColor(red: 69/255, green: 214/255, blue: 93/255, alpha: 1.0)
        case "incomingMessageLabel":
            return .black
        case "incomingAudioMessageTint":
            return .systemBlue
        case "outgoingAudioMessageTint":
            return .white
        case "collectionViewBackground":
            return .white
        case "typingIndicatorDot":
            return UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        case "label":
            return .black
        case "avatarViewBackground":
            return .systemGray
        default:
            return .white
        }
    }
    
    static var incomingMessageBackground: UIColor { colorFromAssetBundle(named: "incomingMessageBackground")  }

    static var outgoingMessageBackground: UIColor { colorFromAssetBundle(named: "outgoingMessageBackground") }
    
    static var incomingMessageLabel: UIColor { colorFromAssetBundle(named: "incomingMessageLabel") }
    
    static var outgoingMessageLabel: UIColor { colorFromAssetBundle(named: "outgoingMessageLabel") }
    
    static var incomingAudioMessageTint: UIColor { colorFromAssetBundle(named: "incomingAudioMessageTint") }
    
    static var outgoingAudioMessageTint: UIColor { colorFromAssetBundle(named: "outgoingAudioMessageTint") }

    static var collectionViewBackground: UIColor { colorFromAssetBundle(named: "collectionViewBackground") }

    static var typingIndicatorDot: UIColor { colorFromAssetBundle(named: "typingIndicatorDot") }
    
    static var label: UIColor { colorFromAssetBundle(named: "label") }
    
    static var avatarViewBackground: UIColor { colorFromAssetBundle(named: "avatarViewBackground") }

}
