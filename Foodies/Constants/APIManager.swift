//
//  APIManager.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 17/07/24.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func login(userName: String, password: String, qrCode: String?, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let url = APIConstants.baseURL + APIConstants.Endpoints.login
        
        let deviceInfo: [String: Any] = [
            "appName": "YLogForms",
            "appVersion": UIApplication.shared.currentApplicationVersion,
            "deviceLocalizedModel": UIDevice.current.localizedModel,
            "deviceSystemVersion": "iOS \(UIDevice.current.systemVersion)",
            "deviceSystemName": UIDevice.current.name,
            "deviceModel": UIDevice.current.systemName,
            "deviceModelName": UIDevice.current.model,
            "deviceDescription": "0",
//            "deviceUDID": UserDefaults.standard.object(forKey: YLAUserDefaults.UUID_KEY) ?? "",
//            "deviceCarrierName": carrierName ?? "0",
//            "deviceCountryCode": carrier?.isoCountryCode ?? "0",
//            "mobileCountryCode": carrier?.mobileCountryCode ?? "0",
//            "mobileNetworkCode": carrier?.mobileNetworkCode ?? "0",
            "phoneNumber": "0",
            "simNumber": "0",
            "pnToken": UserDefaults.standard.object(forKey: "DEVICETOKENID") as? String ?? "0",
            "deviceTypeCode": "SMART_DEVICE"
        ]
        
        let parameters: [String: Any] = [
            "userName": userName,
            "password": password,
            "platform": "YLogForms",
            "qrCode": qrCode ?? "",
            "deviceInfo": deviceInfo
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any] {
                        completion(.success(json))
                    } else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response format"])
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
