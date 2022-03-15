//
//  Datasource.swift
//  Desafio_Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import Foundation

struct Datasource {
    static var cars = [
        Car(model: "", image: "car-1"),
        Car(model: "", image: "car-2"),
        Car(model: "", image: "car-3"),
        Car(model: "", image: "car-4"),
        Car(model: "", image: "car-5"),
        Car(model: "", image: "car-6"),
        Car(model: "", image: "car-7"),
        Car(model: "", image: "car-8"),
        Car(model: "", image: "car-9"),
        Car(model: "", image: "car-10"),
        Car(model: "", image: "car-11"),
        Car(model: "", image: "car-12"),
        Car(model: "", image: "car-13"),
        Car(model: "", image: "car-14")
    ]
    
    static var currentCar = cars[0]
}
