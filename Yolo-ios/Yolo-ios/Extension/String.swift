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
}
