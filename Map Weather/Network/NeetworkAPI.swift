//
//  NeetworkAPI.swift
//  Map Weather
//
//  Created by Artashes Noknok on 7/25/21.
//

import Foundation
import RxSwift

struct Err: Codable {
    var code: String?
    var message: String?
    
}

struct WeatherQuery: Codable {
    var method:String
    var lat: String
    var lon: String
    var key: String
}

struct NetworkAPI {
    
    static let shared: NetworkAPI = .init(baseUrl: Constants.NetworkingPaths.baseURL!)

    var baseUrl: URL

    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
    
    struct WeatherResult: Codable {
        let data: [WeatherModel]?
        let error: String?
        let count: Int?
    }
    
    
    func query(data:WeatherQuery) -> Observable<WeatherModel> {
        return Observable<WeatherModel>.create { obs in
            var components = URLComponents(url: self.baseUrl.appendingPathComponent(data.method), resolvingAgainstBaseURL: false)!
            components.queryItems = [
               URLQueryItem(name: "lat", value: data.lat),
               URLQueryItem(name: "lon", value: data.lon),
               URLQueryItem(name: "key", value: data.key)
            ]
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let tsk = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                guard error == nil else {
                    obs.onError(error!)
                    return
                }
                
                guard data != nil else {
                    print("Protocol error: no data received")
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No response"])
                    obs.onError(error)
                    return
                }
                
                do {
                    let res = try JSONDecoder().decode(WeatherResult.self, from: data!)
                    if ((res.data?.count ?? 0) > 0) {
                       
                        if let data = res.data {
                            print(data)
                            obs.onNext(data.first!)
                            obs.onCompleted()
                        }
                    } else {
                       let error = NSError(domain: "", code: 0, userInfo: ["Invalid PARAMETER": "No response"])
                       obs.onError(error)
                    }
                    
                } catch let err {
                    print("Format error: \(err)")
                    obs.onError(err)
                }
            })
            tsk.resume()
            return Disposables.create{ tsk.cancel() }
        }
    }
}
