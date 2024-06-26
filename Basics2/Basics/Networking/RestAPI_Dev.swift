// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rESTAPIDev = try? JSONDecoder().decode(RESTAPIDev.self, from: jsonData)

import Foundation

// MARK: - RESTAPIDevElement
struct RESTAPIDevElement: Codable {
    let id, name: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let dataColor, dataCapacity: String?
    let capacityGB: Int?
    let dataPrice: Double?
    let dataGeneration: String?
    let year: Int?
    let cpuModel, hardDiskSize, strapColour, caseSize: String?
    let color, description, capacity: String?
    let screenSize: Double?
    let generation, price: String?

    enum CodingKeys: String, CodingKey {
        case dataColor = "color"
        case dataCapacity = "capacity"
        case capacityGB = "capacity GB"
        case dataPrice = "price"
        case dataGeneration = "generation"
        case year
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
        case strapColour = "Strap Colour"
        case caseSize = "Case Size"
        case color = "Color"
        case description = "Description"
        case capacity = "Capacity"
        case screenSize = "Screen size"
        case generation = "Generation"
        case price = "Price"
    }
}

typealias RESTAPIDev = [RESTAPIDevElement]
