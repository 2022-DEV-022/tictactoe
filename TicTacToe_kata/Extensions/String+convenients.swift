//
//  String+Convenients.swift
//  TicTacToe_kata
//

import Foundation

extension String {

    var localized: String {
        let path = Bundle.main.path(forResource: DefaultManager.language, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
