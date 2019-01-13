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
    
    /**
     Read all the elements inside one Object.
     - Parameter object: Realm Object.
     - Returns: Realm first element from Results of Objects.
     */
    func readFirst<T: Object>(object: T) -> T
    
    /**
     Read all the elements inside one Object.
     - Parameter object: Realm Object.
     - Returns: Realm last element from Results of Objects.
     */
    func readLast<T: Object>(object: T) -> T
    
    /**
     Read all the elements inside one Object.
     - Parameter object: Realm Object.
     - Returns: Realm element by query of Objects.
     */
    func readWithQuery<T: Object>(object: T, query: String) -> T
    
    /**
     Delete the entire object.
     - Parameter object: Realm Object.
     */
    func deleteAll(object: Object)
    
    /**
     Delete the one element in the object.
     - Parameter object: Realm Object.
     */
    func deleteOneElement<T: Object>(object: T, id: String)

    
    /**
     Updates an existing realm object.
     - Parameter object: Realm Object.
     */
    func update(object: Object)
    
}
