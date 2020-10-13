//
//  ViewController.swift
//  Todoey
//
//  Created by Mengeang CHENG on 10/13/20.
//  Copyright © 2020 Mengeang CHENG. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    
    // MARK: - Variables
    var itemArrays = ["Take a bath", "Eat breakfast", "Go to work"]
    
    // MARK: - UI
    var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints    = false
        return tv
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraints: do {
            setupConstraints()
        }
        
        view: do {
            view.backgroundColor    = .white
        }
        
        tableView: do {
            tableView.delegate      = self
            tableView.dataSource    = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        }
        
        navigationController: do {
            
            //Title
            navigationItem.title                                    = "Todoey"
            
            //Color
            navigationController?.navigationBar.barTintColor        = .systemBlue
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationController?.navigationBar.barStyle            = .black
            
            //Button
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action:  #selector(addBarButtonPressed))
            navigationController?.navigationBar.tintColor   = .white
            
        }
        
        userDefaults: do {
            guard let items = UserDefaults.standard.array(forKey: "TodoList") as? [String] else {
                return
            }
            
            itemArrays  = items
        }
        
    }


}

// MARK: - Constraints
extension TodoListViewController {
    func setupConstraints() {
        view.addSubview(tableView)
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        cell.textLabel?.text = itemArrays[indexPath.row]
        
        cell.didTap {
            
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            }
            else {
                cell.accessoryType = .checkmark
            }
        }
        
        return cell
    }
    
    
}

// MARK: - Functions
extension TodoListViewController {
    @objc func addBarButtonPressed() {
        print("Add pressed")
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Items", message: "Add items into your list", preferredStyle: .alert)
        
        alert.addTextField { (tf) in
            tf.placeholder = "Create new item"
            textField       = tf
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Add Item", style: .default, handler: { _ in
            print(textField.text ?? "")
            
            self.itemArrays.append(textField.text ?? "")
            
            UserDefaults.standard.set(self.itemArrays, forKey: "TodoList")
            
            self.tableView.reloadData()
        }))
        
        present(alert, animated: true)
    }
}

// MARK: - ************ TableCell ************
class TableCell: UITableViewCell {
    
    // MARK: - UI
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Constraints
extension TableCell {
    
}
