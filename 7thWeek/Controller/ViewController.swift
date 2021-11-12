//
//  ViewController.swift
//  7thWeek
//
//  Created by Mustafa Berkay Kaya on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
   
    var not = [String]()
    var baslik = [String]()
    var indexPathRow = Int()
    var notCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

extension ViewController: saveButtonTappedDelegate, UITableViewDelegate, UITableViewDataSource {
    func didTapButton(title: String, note: String, isEditMode: Bool) {
        if isEditMode {
            baslik[indexPathRow] = title
            not[indexPathRow] = note
            tableView.reloadData()
        } else {
            not.append(note)
            baslik.append(title)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.indexPathRow = indexPath.row
            self.baslik.remove(at: indexPath.row)
            self.not.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") {_, _, _ in
            self.indexPathRow = indexPath.row
            self.performSegue(withIdentifier: "fromRow", sender: nil)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baslik.count
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            if let destinationvVC = segue.destination as? SaveNoteViewController? {
                destinationvVC?.saveNoteDelegate = self
                destinationvVC?.isediting = false
            }
        } else if segue.identifier == "fromRow" {
            if let destinationvVC = segue.destination as? SaveNoteViewController? {
                destinationvVC?.saveNoteDelegate = self
                destinationvVC?.isediting = true
                destinationvVC?.titleText = baslik[indexPathRow]
                destinationvVC?.noteText = not[indexPathRow]
            }
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "cellNote") as? NotTableViewCell {
            cell.setTitle().text = baslik[indexPath.row]
            cell.setNote().text = not[indexPath.row]
            self.notCell = cell
            
        }
       return notCell
    }
}
