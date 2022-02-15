//
//  ResultsViewController.swift
//  1000000
//
//  Created by Вячеслав on 30.01.2022.
//

import UIKit



class ResultsViewController: UIViewController {
    
    
    
    @IBOutlet var resulttttLable: UILabel!
    @IBOutlet var backButton: UIButton!

    
    @IBOutlet var tView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
        configButton()
    }
    
    private func configButton() {
        resulttttLable.layer.borderColor = UIColor.yellow.cgColor
        resulttttLable.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.yellow.cgColor
        backButton.layer.borderWidth = 1
    }
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = Game.shared.records.count
        print(count)
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier) as! ResultCell
        let record = Game.shared.records[indexPath.row]
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .short
        cell.resultLabel.text = "Дата: \(dataFormatter.string(from: record.date))  Ответов: \(record.score)  Процент\(record.percent)"
        return cell
    }
}
