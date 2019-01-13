# SimpleRealm

[![CI Status](https://img.shields.io/travis/amr.omraan@icloud.com/SimpleRealm.svg?style=flat)](https://travis-ci.org/amr.omraan@icloud.com/SimpleRealm)
[![Version](https://img.shields.io/cocoapods/v/SimpleRealm.svg?style=flat)](https://cocoapods.org/pods/SimpleRealm)
[![License](https://img.shields.io/cocoapods/l/SimpleRealm.svg?style=flat)](https://cocoapods.org/pods/SimpleRealm)
[![Platform](https://img.shields.io/cocoapods/p/SimpleRealm.svg?style=flat)](https://cocoapods.org/pods/SimpleRealm)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 10.0+
- Xcode 10.0+
- Swift 4.2+
## Installation

To install 
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleRealm', :git=> 'https://github.com/amrOmran89/SimpleRealm_iOS.git'
``` 

## Usage

### Quick Start

```swift
import UIKit
import SimpleRealm

class MyViewController: UIViewController {

    // create an instance from DatabaseManager()
    let databaseManager = DatabaseManager()
    
    // Create an instance from Realm Object User()
    let user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        user.name = "Boby"
        user.age = 25
        user.id = UUID().uuidString
        
        databaseManager.create(object: self.user)
        
        databaseManager.readAll(object: self.user)
        
        
        databaseManager.readWithQuery(object: self.user, query: "query")
        databaseManager.readLast(object: self.user)
        databaseManager.readFirst(object: self.user)
        
        databaseManager.update(object: self.user)
        
        databaseManager.deleteOneElement(object: self.user, id: id)
        databaseManager.deleteAll(object: self.user)
     
    }

}

/// User is Realm Object
class User: Object {    
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var id: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
```

## Author

Amr Omran

## License

SimpleRealm is available under the MIT license. See the LICENSE file for more info.
