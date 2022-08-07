//
//  String.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 4.08.2022.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ bundleClass: AnyClass) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle(for: bundleClass), value: "", comment: "")
    }
    
    var comfortsPasswordPolicy: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&*()\\-_=+{};:,<.>]).{8,}")
            let nsString = self as NSString
            let result = regex.matches(in: self, options: [], range: NSRange(location: 0,length: nsString.length))
            
            return result.count > 0
        }catch{
            return false
        }
    }
}
