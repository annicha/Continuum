//
//  SearchablerRecord.swift
//  Continuum
//
//  Created by Annicha on 5/6/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool 
}
