//
//  MemoViewController.swift
//  MyMemoApp
//
//  Created by 善方淳 on 2017/07/31.
//  Copyright © 2017年 善方淳. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {

    var memo: String?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var memoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.saveButton.isEnabled = false
        if let memo = self.memo {
            self.memoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
        }
        self.updateSaveButtonState()
    }
    
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController{
        self.dismiss(animated: true, completion: nil)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    private func updateSaveButtonState() {
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }

    @IBAction func memoTextFieldChanged(_ sender: Any) {
        self.updateSaveButtonState()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else {
            return
        }
        self.memo = self.memoTextField.text ?? ""
    }
}
