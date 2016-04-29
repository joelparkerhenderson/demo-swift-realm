import Foundation
import RealmSwift

class Team: Object {
  
  // Primary key: you can optionally define a model’s primary key.
  // You can use any variable name you want; we prefer the name "id".
  // Declaring a primary key improves efficiency of search and update,
  // and and also enforces the primary key uniqueness for each value.
  // Note that once the primary key is created, it cannot be changed.
  dynamic var id = 0
  override static func primaryKey() -> String? {
    return "id"
  }
  
  // Optional string property, defaulting to nil.
  dynamic var name: String? = nil
  
  // To-Many relationships you can define a to-many relationship using
  // List properties. Lists contain other Objects of a single type and
  // have an interface very similar to a mutable Array.
  let tasks = List<Task>()

  // Indexed properties: override Object.indexedProperties() to set
  // which properties in your model should be indexed
  override static func indexedProperties() -> [String] {
    return ["name"]
  }

}

