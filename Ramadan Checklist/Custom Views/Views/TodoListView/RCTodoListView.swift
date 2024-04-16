//
//  RCTodoListView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 16/04/2024.
//

import UIKit

class RCTodoListView: UITableView {
    let testTasks = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"]

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView(){
        backgroundColor = .systemMint
        
        dataSource = self
        delegate = self
        register(TodoCell.self,forCellReuseIdentifier: TodoCell.reuseIdentifier)
    }
}

extension RCTodoListView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as! TodoCell
        cell.set(taskLabel: testTasks[indexPath.row])
        
        return cell
    }
    
    
}

extension RCTodoListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected \(indexPath.row)")
    }
}
