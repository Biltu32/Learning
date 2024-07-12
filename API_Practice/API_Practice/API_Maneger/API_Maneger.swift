//
//  API_Maneger.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 02/02/24.
//
import Foundation
import Alamofire

class API_Manager {
    static let sharedInstance = API_Manager()

func getCountry(completion:@escaping (_ result:[PostResponse]?, _ status:Bool, _ message:String) -> Void) {
    
 let headersAPICall: HTTPHeaders = [.accept("application/json")]
            
AF.request("https://jsonplaceholder.typicode.com/posts",method:.get,parameters:[:],encoding:
URLEncoding.default,headers:headersAPICall,interceptor:nil,requestModifier:nil).response {responseData in
    guard let data = responseData.data else {
    completion(nil,false, responseData.error!.localizedDescription)
    return }
    do {
        let getCountry = try JSONDecoder().decode([PostResponse].self, from: data)
        completion(getCountry, true, "Response Received Successfully")
        }
    catch {
        print("Error After decoding ==> \(error)")
        completion(nil,false, error.localizedDescription)
          }
        }
        }
}
