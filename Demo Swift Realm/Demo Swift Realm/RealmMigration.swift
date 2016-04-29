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
    // Now that we've told Realm how to handle the schema change, opening the file
    // will automatically perform the migration
    _ = try! Realm()
  }

}