//
//  Car.swift
//  Desafio_Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import Foundation

struct Car {
    var model: String
    var image: String
    var specifications: (String, [CarSpecification])
    
    init(model: String, image: String) {
        self.model = model
        self.image = image
        specifications = ("Key Specifications", [
            CarSpecification(spec: "WLTP Mileage", desc: "7.46 kmpl"),
            CarSpecification(spec: "Engine Displacement (cc)", desc: "3998"),
            CarSpecification(spec: "Max Power (bhp@rpm)", desc: "502.88Bhp@6000rpm"),
            CarSpecification(spec: "Seating Capacity", desc: "2"),
            CarSpecification(spec: "Fuel Tank Capacity", desc: "73.0"),
            CarSpecification(spec: "Fuel Type", desc: "Petrol"),
            CarSpecification(spec: "No. of cylinder", desc: "8"),
            CarSpecification(spec: "Max Torque (nm@rpm)", desc: "675Nm@2000-5000rpm"),
            CarSpecification(spec: "Transmission type", desc: "Manual"),
            CarSpecification(spec: "Body type", desc: "Convertible")
        ])
    }
}

struct CarSpecification {
    var spec: String
    var desc: String
}

