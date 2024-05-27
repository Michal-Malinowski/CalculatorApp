import UIKit

class ViewController: UIViewController {

    var task: String = ""
    
    @IBOutlet weak var calcResult: UILabel!
    @IBOutlet weak var calcTask: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }

    func addTask(value: String) {
        task += value
        calcTask.text = task
    }

    func clearAll() {
        task = ""
        calcTask.text = ""
        calcResult.text = ""
    }

    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }

    @IBAction func back(_ sender: Any) {
        if !task.isEmpty {
            task.removeLast()
            calcTask.text = task
        }
    }

    @IBAction func percent(_ sender: Any) {
        addTask(value: "%")
    }

    @IBAction func divide(_ sender: Any) {
        addTask(value: "/")
    }

    @IBAction func times(_ sender: Any) {
        addTask(value: "*")
    }

    @IBAction func minus(_ sender: Any) {
        addTask(value: "-")
    }

    @IBAction func plus(_ sender: Any) {
        addTask(value: "+")
    }

    @IBAction func equals(_ sender: Any) {
        let expressionString = task.replacingOccurrences(of: "%", with: "*0.01")
        
        // Check for division by zero
        if expressionString.contains("/0") {
            calcResult.text = "Error"
            return
        }
        
        let operators: Set<Character> = ["+", "-", "*", "/"]
        if let lastChar = expressionString.last, operators.contains(lastChar) {
            calcResult.text = "Error"
            return
        }

        let exp = NSExpression(format: expressionString)
        
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            let resultString = formatResult(result: result)
            calcResult.text = resultString
        } else {
            calcResult.text = "Error"
        }
    }

    func formatResult(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }

    @IBAction func decimal(_ sender: Any) {
        addTask(value: ".")
    }

    @IBAction func digit0(_ sender: Any) {
        addTask(value: "0")
    }

    @IBAction func digit1(_ sender: Any) {
        addTask(value: "1")
    }

    @IBAction func digit2(_ sender: Any) {
        addTask(value: "2")
    }

    @IBAction func digit3(_ sender: Any) {
        addTask(value: "3")
    }

    @IBAction func digit4(_ sender: Any) {
        addTask(value: "4")
    }

    @IBAction func digit5(_ sender: Any) {
        addTask(value: "5")
    }

    @IBAction func digit6(_ sender: Any) {
        addTask(value: "6")
    }

    @IBAction func digit7(_ sender: Any) {
        addTask(value: "7")
    }

    @IBAction func digit8(_ sender: Any) {
        addTask(value: "8")
    }

    @IBAction func digit9(_ sender: Any) {
        addTask(value: "9")
    }
}
