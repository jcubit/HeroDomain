//
//  HeroLoader.swift
//  HeroDomain
//
//  Created by Javier Cuesta on 13.03.23.
//

import Foundation

/// This class implements the main abstraction of this module
public final class HeroLoader: HeroService {

    private let heroRepository: HeroRepository
    private let filter: (Hero) -> Bool
    private let openDotaBaseURL: URL
    private let defaultIcon: HeroImage
    private let defaultImage: HeroImage

    public init(heroRepository: some HeroRepository, filter: @escaping (Hero) -> Bool, openDotaBaseURL: String) {
        guard let defaultIcon = HeroImage(systemName: "person.crop.circle.badge.questionmark"),
              let defaultImage = HeroImage(systemName: "person.fill.questionmark")
        else { fatalError("Could not load system images") }

        guard let openDotaBaseURL = URL(string: openDotaBaseURL)
        else { fatalError("Could not init URL with string: \(openDotaBaseURL)") }

        self.heroRepository = heroRepository
        self.filter = filter
        self.openDotaBaseURL = openDotaBaseURL
        self.defaultIcon = defaultIcon
        self.defaultImage = defaultImage
    }

    public func fetchHeroes() async throws -> [Hero] {
        let rawHeros = try await heroRepository.fetchHeroes()
        let iconURLS = rawHeros.compactMap { $0.iconURL }
        let imagesURLS = rawHeros.compactMap { $0.imageURL }

        let iconsMap = try await heroRepository.images(from: iconURLS)
        let imagesMap = try await heroRepository.images(from: imagesURLS)

        let featuredHeroes = rawHeros.compactMap { hero -> Hero? in
            guard let iconURL = hero.iconURL,
                  let imageURL = hero.imageURL,
                  let fullIconURL = URL(string: iconURL, relativeTo: openDotaBaseURL),
                  let fullImageURL = URL(string: imageURL, relativeTo: openDotaBaseURL)
            else { return nil }
            let icon = iconsMap[fullIconURL] ?? defaultIcon
            let image = imagesMap[fullImageURL] ?? defaultImage
            return Hero(hero, icon: icon, profileImage: image)
        }.filter { hero in
            filter(hero)
        }
        return featuredHeroes
    }

}

