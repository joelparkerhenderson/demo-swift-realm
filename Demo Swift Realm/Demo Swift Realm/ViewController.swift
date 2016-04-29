import UIKit

class ViewController: UIViewController {
  
  // MARK: Properties
  
  @IBOutlet weak var demoTextView: UITextView!
  
  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Create team
    let team = Team()
    team.name = "Arsenal Football Club"
    
    // Create task
    let task = Task()
    task.name = "Add sprint exercises"
    
    // Output the team name on one line,
    // and the task name on the next line.
    let text = team.name! + "\n" + task.name!
    demoTextView.text = text
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
