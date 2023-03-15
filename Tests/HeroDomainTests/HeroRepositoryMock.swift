//
//  HeroRepositoryMock.swift
//  
//
//  Created by Javier Cuesta on 15.03.23.
//

@testable import HeroDomain
import Foundation

class HeroRepositoryMock: HeroRepository {
    func images(from urls: [String]) async throws -> [URL : HeroDomain.HeroImage] {
        let baseURL =  fixturesDirectory()
        let fullURL = urls.compactMap({ URL(string: $0, relativeTo: baseURL)?.absoluteURL })
        let heroes = [Hero.Mock.antimage.profileImage,
                      Hero.Mock.axe.profileImage,
                      Hero.Mock.bane.profileImage]
        return Dictionary(uniqueKeysWithValues: zip(fullURL, heroes))
    }

    func fetchHeroes() async throws -> [HeroDomain.RawHero] {
        return [RawHero.Mock.antimage,
                RawHero.Mock.axe,
                RawHero.Mock.bane]
    }
}
