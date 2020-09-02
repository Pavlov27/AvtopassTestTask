//
//  BusCurrentInfoModel.swift
//  AvtopassTestTask
//
//  Created by Nikita Pavlov on 01.09.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import Foundation

struct BusModelUnit: Codable {
    let boardNumber: String
    let course: Int
    let lat: Double
    let licenseNumber: String
    let lng: Double
    let model: String
    let nextPathPoints: [PathPoint]?
    let prevPathPoints: [PathPoint]?
    let routeID: Int?
    let routeName: String?
    let speed: Int?
    let station: Station?
    let timeLocation: String?
    let vehicleID: String?

    enum CodingKeys: String, CodingKey {
        case boardNumber = "board_number"
        case course
        case lat
        case licenseNumber = "license_number"
        case lng
        case model
        case nextPathPoints = "next_path_points"
        case prevPathPoints = "prev_path_points"
        case routeID = "route_id"
        case routeName = "route_name"
        case speed
        case station
        case timeLocation = "time_location"
        case vehicleID = "vehicle_id"
    }
}

struct PathPoint: Codable {
    let distance: Double
    let lat: Double
    let lng: Double
    let order: Int?
    let routeID: Int?
    let routePathID: Int?

    enum CodingKeys: String, CodingKey {
        case distance
        case lat
        case lng
        case order
        case routeID = "route_id"
        case routePathID = "route_path_id"
    }
}

struct Station: Codable {
    let agentID: Int
    let lat: Double
    let lng: Double
    let name: String?
    let stationID: Int?

    enum CodingKeys: String, CodingKey {
        case agentID = "agent_id"
        case lat
        case lng
        case name
        case stationID = "station_id"
    }
}

typealias BusModel = [BusModelUnit]


