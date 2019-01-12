//
//  CRUDProtocol.swift
//  SimpleRealm
//
//  Created by Amr Omran on 01/12/2019.
//

import Foundation
import RealmSwift

public protocol CRUDProtocol {
    
    /**
     Creates an object in the database.
     - Parameter object: Realm Object.
     */
    func create(object: Object)
    
    /**
     Read all the elements inside one Object.
     - Parameter object: Realm Object.
     - Returns: Realm Results array of Objects.
     */
    func readAll<T: Object>(object: T) -> Results<T>
    
    func readFirst<T: Object>(object: T) -> T
    
    func readLast<T: Object>(object: T) -> T
    
    func readWithQuery<T: Object>(object: T, query: String) -> T
    
    func deleteAll(object: Object)
    
    func deleteOneElement<T: Object>(object: T, id: String)

    
    func update(object: Object)
    
}
