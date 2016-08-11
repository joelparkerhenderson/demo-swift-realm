# Demo Swift Realm

 * The [Swift](http://swift.org) programming language with
   [Apple](http://apple.com)
   [iOS](http://www.apple.com/ios/)
   [Xcode](https://developer.apple.com/xcode/)

 * The [Realm](http://realm.io) database, and a couple of models.

This README describes how to create the project, if you want to try doing it yourself.

To learn more about Swift and Realm, see the official documentation for [Realm Swift](https://realm.io/docs/swift/latest/)

## How to create the project

1. Launch Xcode and create a new project. We call ours "Demo Swift Realm". 

  * Need help? See our repo [demo_swift_hello_world](https://github.com/joelparkerhenderson/demo_swift_hello_world).


1. Create a simple way to print some text to the screen, such as a text view with an IBOutlet named "demoTextView". 

  * Need help? See our repo [demo_swift_text_view](https://github.com/joelparkerhenderson/demo_swift_text_view).
   
1. Add Realm to the project. 

  * To add Realm as a dependency, we prefer using Carthage. 

  * If you prefer, you can add it by using a dynamic framework or using Cocoapods.

## Create model classes

1. Create a directory named "Models".

1. Create a Realm model for a "Team", such as a company.

        import Foundation
        import RealmSwift
        class Team: Object {
          dynamic var name: String? = nil  
        }

1. Create a Realm model for a "Task", such as a to-do item.

        import Foundation
        import RealmSwift
        class Task: Object {
          dynamic var name: String? = nil  
        }

## Create model objects

1. Edit `ViewController.swift`. 

1. Add simple code to create model objects, then print some output to the screen.

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
		}  
 
1. Run the app. The screen shows the team name and task name.

## More examples 

The source code for this project contains many more examples such as:

  * Primary keys: how to set a primary key, and why it matters.
  * Optional properties: especially by using `RealmOptional`.
  * Ignored properties: tell Realm to skip persisting these.
  * To-One relationships: create one-to-one and many-to-one.
  * Inverse relationships: enable efficient round-trip lookups.
  * Indexed properties: set properties to be indexed.
   
   
## Create Realm migration

To make Realm models easy to upgrade, we use a Realm migration. 

We prefer to implement the Realm migration as its own class.

1. Create `RealmMigration.swift`.

		import Foundation
		import RealmSwift	
		 
        class RealmMigration {
          class func run(){
	        Realm.Configuration.defaultConfiguration = Realm.Configuration(
	          // Set the new schema version. This must be greater than the previously used
	          // version (if you've never set a schema version before, the version is 0).
	          schemaVersion: 0,
	          // Set the block which will be called automatically when opening a Realm with
  	          // a schema version lower than the one set above
 	          migrationBlock: { migration, oldSchemaVersion in
	            // We haven’t migrated anything yet, so oldSchemaVersion == 0
	            if (oldSchemaVersion < 1) {
	              // Realm will automatically detect new properties,
	              // and automatically detect removed properties,
	              // and will update the schema on disk automatically.
	            }
	          }
	        )	    
	        // Now that we've told Realm how to handle the schema change,
	        // opening the file will automatically perform the migration.
	        _ = try! Realm()
	      }
   	    }

1. Edit `AddDelegate.swift` and add the Apple function `applicationDidFinishLaunching`.

        class AppDelegate: UIResponder, UIApplicationDelegate {
          …
          func applicationDidFinishLaunching(application: UIApplication) {
            RealmMigration.run()
            …
          }
        …

  
## Tracking

* Package: demo_swift_realm
* Version: 1.0.0
* Created: 2016-04-09
* Updated: 2016-04-28
* License: GPL
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
