//
//  API_Maneger.swift
//  API_Practice
//
//  Created by DAPL-Asset-210 on 07/02/24.
//
import Foundation
import Alamofire

class API_Manager {
    static let sharedInstance = API_Manager()
//First ====>
func getDetails(completion:@escaping (_ result:[GetResponse]?, _ status:Bool, _ message:String) -> Void) {
    
 let headersAPICall: HTTPHeaders = [
    .accept("application/json")
 ]
            
AF.request("https://jsonplaceholder.typicode.com/posts",method:.get,parameters:[:],encoding:
URLEncoding.default,headers:headersAPICall,interceptor:nil,requestModifier:nil).response {responseData in
    guard let data = responseData.data else {
    completion(nil,false, responseData.error!.localizedDescription)
    return }
      
    do {
        let getResponse = try JSONDecoder().decode([GetResponse].self, from: data)
        completion(getResponse, true, "Response Received Successfully")
        }
    catch {
        print("Error After decoding ==> \(error)")
        completion(nil,false, error.localizedDescription)
        }
    
        }
        }
    
//   Second ====>
func getDetailsNumber(baseURL: String,completion:@escaping (_ result:GetResponseNumber?, _ status:Bool, _ message:String) -> Void) {

    let headersAPICall: HTTPHeaders = [.accept("application/json")]

AF.request(baseURL,method:.get,parameters:[:],encoding:
URLEncoding.default,headers:headersAPICall,interceptor:nil,requestModifier:nil).response { responseData in
    guard let data = responseData.data else {
    completion(nil,false, responseData.error!.localizedDescription)
    return }

    do {
        let getResponse = try JSONDecoder().decode(GetResponseNumber.self, from: data)
        completion(getResponse, true, "Response Received Successfully")
        }
    catch {
        print("Error After decoding ==> \(error)")
        completion(nil,false, error.localizedDescription)
        }
        
        }
        }
//  Third ====>
func getComments(baseURL:String,completion:@escaping (_ result:[GetResponseComments]?, _ status:Bool, _ message:String) -> Void) {
    let headersAPICall: HTTPHeaders = [  .accept("application/json")  ]
    
AF.request(baseURL,method:.get,parameters:[:],encoding:
URLEncoding.default,headers:headersAPICall,interceptor:nil,requestModifier:nil).response {responseData in
       guard let data = responseData.data else {
       completion(nil,false, responseData.error!.localizedDescription)
       return }
       
       do {
           let getResponse = try JSONDecoder().decode([GetResponseComments].self, from: data)
           completion(getResponse, true, "Response Received Successfully")
           }
       catch {
           print("Error After decoding ==> \(error)")
           completion(nil,false, error.localizedDescription)
           }
       
           }
           }
//   Fourth ====>
func getCollection(completion:@escaping (_ result:[CollectionViewData]?, _ status:Bool, _ message:String) -> Void) {
        let headersAPICall: HTTPHeaders = [  .accept("application/json")  ]
    
AF.request("https://jsonplaceholder.typicode.com/posts",method:.get,parameters:[:],encoding:
URLEncoding.default,headers:headersAPICall,interceptor:nil,requestModifier:nil).response {responseData in
      guard let data = responseData.data else {
      completion(nil,false, responseData.error!.localizedDescription)
        return }
    
      do {
                let getResponse = try JSONDecoder().decode([CollectionViewData].self, from: data)
                completion(getResponse, true, "Response Received Successfully")
                }
    catch {
                print("Error After decoding ==> \(error)")
                completion(nil,false, error.localizedDescription)
                }
    
                }
                }
        
    }
