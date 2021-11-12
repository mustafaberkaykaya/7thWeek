//
//  SaveNoteViewController.swift
//  7thWeek
//
//  Created by Mustafa Berkay Kaya on 11.11.2021.
//

import UIKit

protocol saveButtonTappedDelegate: NSObjectProtocol {
    func didTapButton(title: String, note: String, isEditMode: Bool)
}

class SaveNoteViewController: UIViewController {

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var noteTextView: UITextView!
    
    weak var saveNoteDelegate: saveButtonTappedDelegate?
    var titleText = ""
    var noteText = ""
    var isediting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noteTextView.layer.borderWidth = 1
        noteTextView.layer.borderColor = UIColor.black.cgColor
        
        titleTextField.text = titleText
        noteTextView.text = noteText
        
    }
    
    @IBAction private func saveButtonTapped(_ sender: Any) {
       
        if titleTextField.text!.isEmpty || noteTextView.text!.isEmpty {
            let alert = UIAlertController(title: "Error",
                                          message: "Please fill in the required sections",
                                          preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
           present(alert, animated: true, completion: nil)
        } else {
            if isediting == false {
                saveNoteDelegate?.didTapButton(title: titleTextField.text!, note: noteTextView.text!, isEditMode: false)
                navigationController?.popViewController(animated: true)
            } else {
                saveNoteDelegate?.didTapButton(title: titleTextField.text!, note: noteTextView.text!, isEditMode: true)
                navigationController?.popViewController(animated: true)
            }
        }
    
    }
    
}
