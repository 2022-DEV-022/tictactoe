//
//  DefaultManager.swift
//  TicTacToe_kata
//

import Foundation

enum UserDefaultKey: String {
    case language

    var key: String {
        return self.rawValue
    }
}

enum AllowedLanguage: String {
    case fr
    case en

    var lang: String {
        return self.rawValue
    }
}

final class DefaultManager {

    static var language: String? {
        get {
            guard let lang = UserDefaults.standard.value(forKey: UserDefaultKey.language.key) as? String else {
                return Locale.current.languageCode ?? AllowedLanguage.en.lang
            }
            return lang
        }

        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultKey.language.key)
        }
    }

    private init() {
    }
}
