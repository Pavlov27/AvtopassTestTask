//
//  ViewController.swift
//  AvtopassTestTask
//
//  Created by Nikita Pavlov on 01.09.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import UIKit
import YandexMapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: YMKMapView!

    let viewModel = ViewModel()

    let cameraTarget = YMKPoint(latitude: 55.743638, longitude: 37.618203)
    let busImage = UIImage(named:"BusIcon2")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapWindow.map.move(
        with: YMKCameraPosition.init(target: cameraTarget, zoom: 13, azimuth: 0, tilt: 0),
        animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 2),
        cameraCallback: nil)

        showBusOnMap()
    }

    private func showBusOnMap() {
        viewModel.getBusData(completion: { [weak self] (busData) in

            if let busData = busData {

                DispatchQueue.main.async {
                    for eachBus in busData {

                    
                        let busCurrentLocation = YMKPoint(latitude: (eachBus.lat), longitude: (eachBus.lng))
                        let mapObjects = self?.mapView.mapWindow.map.mapObjects
                        let placemark = mapObjects?.addPlacemark(with: busCurrentLocation)

                        placemark?.opacity = 1
                        placemark?.setIconWith(self!.busImage)

                        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                            mapObjects?.remove(with: placemark!)
                        }
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                    self?.showBusOnMap()
                }
            } else {
                print("Cant get BusData")
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self?.showBusOnMap()
                }
            }
        })
    }
}

