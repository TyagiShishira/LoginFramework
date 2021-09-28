//
//  ApiFile.swift
//  LoginFramework
//
//  Created by Tyagi on 28/09/21.
//

import Foundation
import Alamofire

let baseurl = "https://jsonplaceholder.typicode.com/todos"

public class ApiFile{
    public static func apiCall(completion: @escaping([User])->Void){
                AF.request(baseurl, method: .get).responseJSON(completionHandler: { (response) in
                    do {
                        let people = try JSONDecoder().decode([User].self, from: response.data!)
                        completion(people)

                    } catch _ {
                        print ("JSON Failure")
                    }
                })
    }
}

public struct User:Codable{
    public var id:Int?
    public var title:String?
}
