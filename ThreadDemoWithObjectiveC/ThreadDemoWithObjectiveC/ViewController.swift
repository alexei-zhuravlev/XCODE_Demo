//
//  ViewController.swift
//  ThreadDemoWithObjectiveC
//
//  Created by Алексей Журавлев on 16.06.2022.
//

import UIKit

let condition = NSCondition()
var isOpen = false

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let valueOne = ValueOne()
        let valueTwo = ValueTwo()
        
        valueTwo.start()
        valueOne.start()
        
    }

}

class ValueOne:Thread{
    override func main() {
        printValueOne()
    }
    
    private func printValueOne(){
        condition.lock()
        print("1-1")
        isOpen = true
        condition.signal()
        do{
            condition.unlock()
        }
        print("1-2")
    }
}

class ValueTwo:Thread{
    override func main() {
        printValueTwo()
    }
    
    private func printValueTwo(){
        condition.lock()
        print("2-1")
        if !isOpen{
            condition.wait()
        }
        isOpen = false
        do {
            condition.unlock()
        }
        print("2-2")
    }
}
