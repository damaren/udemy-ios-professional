//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Jose Luis Damaren Junior on 08/05/23.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
