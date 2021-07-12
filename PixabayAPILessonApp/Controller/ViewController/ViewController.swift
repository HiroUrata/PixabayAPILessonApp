//
//  ViewController.swift
//  PixabayAPILessonApp
//
//  Created by UrataHiroki on 2021/07/12.
//

import UIKit

class ViewController: UIViewController{
  
    
    @IBOutlet weak var keyowrdTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    let getPixabayDataModel = GetPixabayDataModel()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchButton.layer.cornerRadius = 17.0
       
        
    }
    
    @IBAction func search(_ sender: Any) {
        
        if (keyowrdTextField.text!.isEmpty && countTextField.text!.isEmpty) != true{
            
            self.getPixabayDataModel.searchImage(searchKey: self.keyowrdTextField.text!, searchCount: Int(self.countTextField.text!)!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                self.tableView.reloadData()
                
            }
            
     
        }else{
            
            //アラート表示など　エラー処理
            
        }
    }
}

