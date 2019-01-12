//
//  UserObject.swift
//  SimpleRealm_Example
//
//  Created by Amr Omran on 01/12/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var age: String = ""
    @objc dynamic var id: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
