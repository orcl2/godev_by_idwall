//
//  Datasource.swift
//  Desafio_Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import Foundation

struct Datasource {
    static var cars = [
        Car(model: "Nissan Skyline GT-R", image: "car-1"),
        Car(model: "Dodge Charger R/T", image: "car-2"),
        Car(model: "Plymounth Barracuda", image: "car-3"),
        Car(model: "GM Chevy Supra", image: "car-4"),
        Car(model: "Nissan 350Z", image: "car-5"),
        Car(model: "Porsche Madesta", image: "car-6"),
        Car(model: "GM Cavalier GTO", image: "car-7"),
        Car(model: "Chevy Cavalero '78", image: "car-8"),
        Car(model: "GM Camaro SuperT", image: "car-9"),
        Car(model: "Lamborgini Venom", image: "car-10"),
        Car(model: "Nissan Supra Track", image: "car-11"),
        Car(model: "Audi T8", image: "car-12"),
        Car(model: "Lamborgini Aventador", image: "car-13"),
        Car(model: "Ford Mustang Turbo", image: "car-14")
    ]
    
    static var currentCar = cars[0]
}
