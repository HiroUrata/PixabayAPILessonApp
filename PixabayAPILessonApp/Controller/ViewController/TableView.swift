//
//  TableView.swift
//  PixabayAPILessonApp
//
//  Created by UrataHiroki on 2021/07/12.
//

import Foundation
import UIKit

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 85
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.getPixabayDataModel.imageURLArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellURLLabel = cell.contentView.viewWithTag(1) as! UILabel
        
        cellURLLabel.text = self.getPixabayDataModel.imageURLArray[indexPath.row]["imageURLString"]
       
        return cell
        
    }
  
    
}
