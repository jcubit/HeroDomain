//
//  HeroLoader.swift
//  HeroDomain
//
//  Created by Javier Cuesta on 13.03.23.
//

import Foundation

import Foundation

/// Heart abstraction of the domain layer.
/// It bridges the UI layer with the data access layer.
/// Applies the business logic.
public protocol HeroService {
    func fetchHeroes() async throws -> [Hero]
}

