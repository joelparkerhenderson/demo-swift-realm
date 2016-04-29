import Foundation
import RealmSwift

class Task: Object {
  
  // Primary key: you can optionally define a model’s primary key.
  // You can use any variable name you want; we prefer the name "id".
  // Declaring a primary key improves efficiency of search and update,
  // and and also enforces the primary key uniqueness for each value.
  // Note that once the primary key is created, it cannot be changed.
  dynamic var id = 0
  override static func primaryKey() -> String? {
    return "id"
  }
  
  // Example of an optional string property, that defaults to nil.
  dynamic var name: String? = nil
  
  // Example of an optional int property, that defaults to nil.
  // RealmOptional properties should always be declared with `let`,
  // because assigning to them directly will not work as desired.
  let length = RealmOptional<Int>()
  
  // Ignored properties: prevent Realm from persisting model properties.
  dynamic var temp_1 = 0
  dynamic var temp_2 = 0
  override static func ignoredProperties() -> [String] {
    return ["temp_1", "temp_2"]
  }
  
  // To-One relationships: for many-to-one or one-to-one relationships,
  // simply declare a property with the type of your Object subclass.
  dynamic var owner: Team?
  
  // Inverse relationships: these enable efficient round-trip relations.
  // Realm doesn't persist this property because it only has a getter.
  var stakeholders: [Team] {
    // Define "stakeholders" as the inverse relationship to Team.tasks
    return linkingObjects(Team.self, forProperty: "tasks")
  }
  
  // Indexed properties: override Object.indexedProperties() to set
  // which properties in your model should be indexed
  override static func indexedProperties() -> [String] {
    return ["name"]
  }
  
}