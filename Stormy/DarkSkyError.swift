//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Nick Reichard on 3/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsucessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl 
}
