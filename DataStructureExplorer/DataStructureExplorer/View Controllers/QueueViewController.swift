//
//  QueueViewController.swift
//  DataStructureExplorer
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController, UITextFieldDelegate {

    // Data model
    var stack: Stack<String> = .init()
    
    // UI outlets
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var stackItemCountLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.valueTextField.delegate = self
        self.outputTextField.delegate = self
    }

    @IBAction func pushButtonPressed(_ sender: Any) {
        // If value is empty, don't add
        if let text = valueTextField.text {
            self.stack.push(text)
            self.stackItemCountLabel.text = "\(self.stack.count)"
        }
    }
    
    @IBAction func peekButtonPressed(_ sender: Any) {
        self.outputTextField.text = stack.peek() ?? "<empty>"
    }
    
    @IBAction func popButtonPressed(_ sender: Any) {
        self.outputTextField.text = stack.pop() ?? "<empty>"
        self.stackItemCountLabel.text = "\(self.stack.count)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
