//
//  PokePin.swift
//  PokemonGO
//
//  Created by Brian Benjamin Pareja Meruvia on 5/06/17.
//  Copyright © 2017 Brian Benjamin Pareja Meruvia. All rights reserved.
//

import Foundation
import MapKit

class PokePin : NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    init(coord: CLLocationCoordinate2D, pokemon:Pokemon){
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
