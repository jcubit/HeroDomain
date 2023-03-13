//
//  HeroRepository.swift
//  HeroDomain
//
//  Created by Javier Cuesta on 13.03.23.
//

import Foundation

/// Interface to the data access layer which returns "raw" hero
/// entities from the persistence service.
/// This is owned by the domain layer
public protocol RawHeroFetcher {
    func fetchHeroes() async throws -> [RawHero]
}

public protocol ImageFetcher {
    func images(from urls: [String]) async throws -> [URL: HeroImage]
}

public typealias HeroRepository = RawHeroFetcher & ImageFetcher
