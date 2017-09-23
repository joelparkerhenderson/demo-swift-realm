# Demo Swift Realm

<img src="README.png" alt="Realm" style="width: 100%;"/>

This demonstration shows:

 * The [Swift](http://swift.org) programming language with
   [Apple](http://apple.com)
   [Xcode](https://developer.apple.com/xcode/)
   [iOS](http://www.apple.com/ios/)

 * The [Realm](http://realm.io) database, and a couple of models.


## Start

To use this demo, you can clone this repo, or you can use this README to create your own project.

If you clone this repo, then be aware that there are multiple git branches, so pick the one you want.

  * swift-4-xcode-9: Swift version 4, Xcode version 9, iOS version 11.

  * swift-3-xcode-8: Swift version 3, Xcode version 8, iOS version 10.


## Create the project

Launch Xcode and create a new project.

  * Use iOS template "Single View Application" and Product Name "Demo Swift Realm".

  * [Help](doc/setup/create_a_new_xcode_project.md)

Create a simple way to print some text to the screen.

  * We create a text view object and IBOutlet named "demoTextView".

  * [Help](doc/setup/create_a_text_view.md)

Add Realm to the project. We suggest using Carthage or Cocoapods.

  * Carthage `Cartfile`:

    github "realm/realm-cocoa"`

  * When you link the frameworks, and when you add the run phase, you want to use both `Realm.framework` and `RealmSwift.framework`.
  
  * [Help](doc/setup/add_carthage_frameworks.md)


## Create model classes

In the left Xcode area that is the project tree, create a new group and name it "Models".

In the new group "Models", create a new iOS Swift file and name it "Team.swift".

  * If Xcode prompts you for where to save it, then create a new file folder "Models", and add it to all the targets.

Create a Realm model for a "Team", such as a company.

```swift
import Foundation
import RealmSwift
class Team: Object {
  dynamic var name: String? = nil  
}
```

Create a Realm model for a "Task", such as a to-do item.

```swift
import Foundation
import RealmSwift
class Task: Object {
  dynamic var name: String? = nil  
}
```


## Create model objects

Edit `ViewController.swift`. 

Add simple code to create model objects, then print some output to the screen.

```swift
import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var demoTextView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let team = Team()
    team.name = "Arsenal Football Club"

    let task = Task()
    task.name = "Add sprint exercises"

    demoTextView.text = team.name! + "\n" + task.name!
  }
  …
```
 
## Run

Run the app. 

The Simulator screen shows the team name and task name.

Congratulations, you're successful!


## More examples 

The source code for this project contains many more examples such as:

  * Migration: how to upgrade the database when the app launches.
  * Primary keys: how to set a primary key, and why it matters.
  * Optional properties: especially by using `RealmOptional`.
  * Ignored properties: tell Realm to skip persisting these.
  * To-One relationships: create one-to-one and many-to-one.
  * Inverse relationships: enable efficient round-trip lookups.
  * Indexed properties: set properties to be indexed.
   
The source code examples are here:

  * [src/RealmMigration.swift](src/RealmMigration.swift)
  * [src/Team.swift](src/Team.swift)
  * [src/Task.swift](src/Task.swift)


## Tracking

* Package: demo_swift_realm
* Version: 3.0.0
* Created: 2016-04-09
* Updated: 2017-09-22
* License: BSD, MIT, GPL
* Contact: Joel Parker Henderson (http://joelparkerhenderson.com)
