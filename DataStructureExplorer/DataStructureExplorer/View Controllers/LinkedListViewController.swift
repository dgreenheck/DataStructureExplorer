//
//  LinkedListViewController.swift
//  DataStructureExplorer
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import UIKit

class LinkedListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    // Data model
    var linkedList: LinkedList<String> = .init()
    
    // UI outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add some test values to the list
        _ = linkedList.append(.init("dog"))
        _ = linkedList.append(.init("cat"))
        _ = linkedList.append(.init("mouse"))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.valueTextField.delegate = self
    }
    
    @IBAction func insertButtonPressed(_ sender: Any) {
        // Check to see if node is selected
        guard let nodeIndex = tableView.indexPathForSelectedRow?.row else { return }
        
        // If value is empty, don't add
        if let text = valueTextField.text {
            let node = LinkedListNode<String>(text)
            _ = self.linkedList.insert(node: node, at: nodeIndex)
            tableView.reloadData()
        }
    }
    
    @IBAction func appendButtonPressed(_ sender: Any) {
        // If value is empty, don't add
        if let text = valueTextField.text {
            let node = LinkedListNode<String>(text)
            _ = self.linkedList.append(node)
            tableView.reloadData()
        }
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        // Check to see if node is selected
        guard let nodeIndex = tableView.indexPathForSelectedRow?.row else { return }
        _ = linkedList.remove(at: nodeIndex)
        tableView.reloadData()
    }
    
    // ------- Table View Functions -----------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.linkedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "linkedListNode", for: indexPath)
        cell.textLabel?.text = self.linkedList.get(at: indexPath.row)?.value
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // Get node at index
        if let node = linkedList.get(at: indexPath.row) {
            var message: String = "Index: \(indexPath.row)\n"
            message += "Value: \(node.value)\n"
            message += "Previous Node Value: \(node.prev?.value ?? "nil")\n"
            message += "Next Node Value: \(node.next?.value ?? "nil")\n"
            
            let alert = UIAlertController(title: "Node Info", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
