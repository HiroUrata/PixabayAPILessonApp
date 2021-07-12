//
//  GetPixabayDataModel.swift
//  PixabayAPILessonApp
//
//  Created by UrataHiroki on 2021/07/12.
//

import Foundation
import Alamofire
import SwiftyJSON



class GetPixabayDataModel{
    
    var imageURLArray:[[String:String]] = []
    
}


extension GetPixabayDataModel{
    
    func searchImage(searchKey:String,searchCount:Int){
        
        let pixabayURL = "https://pixabay.com/api/?key=22343236-f9a23846f5c6250f4483d03d6&q=\(searchKey)"  //APIKey s
        
        AF.request(pixabayURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            
            case.success:
                
                self.imageURLArray = []  //検索する時に、データの重複を防ぐ
                let json:JSON = JSON(response.data as Any)
                
                for count in 0...searchCount - 1{
                    
                    if json["hits"][count]["webformatURL"].string != nil{  //取得できる"webformatURL"が存在する時は、"webformatURL"を取得する
                        
                        self.imageURLArray.append(["imageURLString":json["hits"][count]["webformatURL"].string!])
                
                    }else{
                        
                        break  //取得できる"webformatURL"が無くなった時に処理を終わらせる
                        
                    }
                
                }
                
            case.failure(let error):
                print(error)
            
            }
            
        }
    }
    
}
