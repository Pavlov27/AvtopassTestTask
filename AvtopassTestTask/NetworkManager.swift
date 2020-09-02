//
//  NetworkManager.swift
//  AvtopassTestTask
//
//  Created by Nikita Pavlov on 01.09.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import Foundation

class NetworkManager {

    func dataRequestFromAPI(url: String, compeletion: @escaping (_ data: Data?) -> ()) {

        guard let url = URL(string: url) else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    compeletion(data)
                }
            } else {
                compeletion(nil)
            }
            //так же обработка ошибки и ответа, если нужно
        }.resume()
    }
}
