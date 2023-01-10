//
//  HomeService.swift
//  PrimeiroAppMVVM
//
//  Created by user218997 on 04/01/23.
//

import UIKit
import Alamofire

enum ErrorDetail: Swift.Error {
    case errorURL(urlString: String)
    case detailError(detail: String)
}

class HomeService {
    
    //fazendo requisição de forma natica com URLSession
    func getHomeDataURLSession(completion: @escaping (HomeData?, Error?) -> Void) {
        let urlString: String = "https://run.mocky.io/v3/219c7ba9-9eaa-46d6-ae23-9b7cef3b278c"
        
        guard let url: URL = URL(string: urlString) else { return completion(nil, ErrorDetail.errorURL(urlString: urlString)) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let dataResult = data else { return completion(nil, ErrorDetail.detailError(detail: "Error data")) }
            let json = try? JSONSerialization.jsonObject(with: dataResult, options: [])
            print(json as Any)
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: dataResult)
                    print("success -> \(#function)")
                    completion(homeData, nil)
                } catch {
                    print("error -> \(#function)")
                    completion(nil, error)
                }
            } else {
                print("error -> \(#function)")
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    //fazendo requisição com uma url e alamofire
    func getHomeDataAlamofire(completion: @escaping (HomeData?, Error?) -> Void) {
        let url: String = "https://run.mocky.io/v3/219c7ba9-9eaa-46d6-ae23-9b7cef3b278c"
        
        AF.request(url, method: .get).validate().responseDecodable(of: HomeData.self) { respomse in
            debugPrint(respomse)
            
            switch respomse.result {
            case .success(let success):
                print("success -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("error -> \(#function)")
                completion(nil, error)
            }
        }
    }
    
    //fazendo leitura de dados com o mock
    func getHomeDataJson(completion: @escaping (HomeData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                completion(homeData, nil)
            } catch  {
                completion(nil, error)
            }
        }
    }

}
