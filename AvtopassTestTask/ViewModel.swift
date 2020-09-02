//
//  ViewModel.swift
//  AvtopassTestTask
//
//  Created by Nikita Pavlov on 01.09.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import Foundation

class ViewModel {

    var networkManager = NetworkManager()

    func getBusData(completion: @escaping (_ busData: BusModel?) -> ()) {
        networkManager.dataRequestFromAPI(url: API.url, compeletion: { (data) in

            if let data = data {
                let busInfo = self.parseJSON(data)
                completion(busInfo)
            } else {
                print("Cant parse JSON Data")
                completion(nil)
            }
        })
    }

    private func parseJSON(_ jsonData: Data) -> BusModel? {
        let decoder = JSONDecoder()

        do {
            let busInfo = try decoder.decode(BusModel.self, from: jsonData)
            return busInfo
        } catch let error {
            print (error.localizedDescription)
            return nil
        }
    }
}
