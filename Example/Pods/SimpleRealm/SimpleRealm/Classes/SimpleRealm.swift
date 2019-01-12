//
//  SimpleRealm.swift
//  SimpleRealm
//
//  Created by Amr Omran on 01/12/2019.
//

import Foundation
import RealmSwift


public class SimpleRealm: CRUDProtocol {
    
    private let realm = try! Realm()
    
    public func create(object: Object) {
        
        do {
            try realm.write {
                realm.add(object)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func readAll<T>(object: T) -> Results<T> where T : Object {
        let results = realm.objects(T.self)
        return results
    }
    
    public func readFirst<T>(object: T) -> T where T : Object {
        let first = realm.objects(T.self).first
        return first!
    }
    
    public func readLast<T: Object>(object: T) -> T {
        let last = realm.objects(T.self).last
        return last!
    }

    
    public func readWithQuery<T>(object: T, query: String) -> T where T : Object {
        let result = realm.objects(T.self).filter(query).first
        return result!
    }
    
    public func deleteAll(object: Object) {
        realm.delete(object)
    }
    
    public func deleteOneElement(object: Object) {
     //   realm.de
    }

    
    public func update(object: Object) {
        realm.add(object, update: true)
    }
    
    
    
}
