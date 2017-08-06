//
//  SwiftSettings.swift
//  SwiftSettings
//
//  Created by Zul on 8/6/17.
//
//

import Foundation

class SwiftSettings {
    let userDefaults = UserDefaults.standard
    
    static let instance = Settings()
    private init() { }
    
    func setValue(key: String, value: Any?) {
        userDefaults.set(value, forKey: key)
        
        userDefaults.synchronize()
    }
    
    func getValue(key: String) -> Any? {
        return userDefaults.object(forKey: key)
    }
    
    func getString(key: String) -> String {
        let value = userDefaults.string(forKey: key)
        
        return value != nil ? value! : ""
    }
    
    func keyExists(key: String) -> Bool {
        return userDefaults.value(forKey: key) != nil
    }
    
    func hasValue(key: String) -> Bool {
        return userDefaults.value(forKey: key) != nil && userDefaults.string(forKey: key) != ""
    }
    
    func resetValue(key: String) {
        if keyExists(key: key) {
            userDefaults.set(nil, forKey: key)
        }
    }
    
    func resetString(key: String) {
        if keyExists(key: key) {
            userDefaults.set("", forKey: key)
        }
    }
}
