//
//  Hero+Mock.swift
//  
//
//  Created by Javier Cuesta on 14.03.23.
//

@testable import HeroDomain

extension Hero {
    enum Mock {
        static var antimage: Hero {
            let profileImageData = try? fixtureData(for: "antimage.png")
            let profileImage = HeroImage(data: profileImageData!)
            let iconData = try? fixtureData(for: "antimageIcon.png")
            let icon = HeroImage(data: iconData!)
            return Hero(id: 1,
                 name: "Anti-Mage",
                 primaryAttribute: .agility,
                 attackType: .melee,
                 profileImage: profileImage!,
                 iconImage: icon!,
                 roles: [.carry, .escape, .nuker],
                 stats: Stats(health: 200,
                              healthRegeneration: 0.25,
                              mana: 75,
                              manaRegeneration: 0,
                              armor: 0,
                              minAttack: 29,
                              maxAttack: 33,
                              strength: 21,
                              agility: 24,
                              intelligence: 12,
                              strengthGain: 1.6,
                              agilityGain: 2.8,
                              intelligenceGain: 1.8,
                              attackRange: 150,
                              projectileSpeed: 0,
                              attackRate: 1.4,
                              moveSpeed: 310))
        }

        static var axe: Hero {
            let profileImageData = try? fixtureData(for: "axe.png")
            let profileImage = HeroImage(data: profileImageData!)
            let iconData = try? fixtureData(for: "axeIcon.png")
            let icon = HeroImage(data: iconData!)
            return Hero(id: 2,
                        name: "Axe",
                        primaryAttribute: .strength,
                        attackType: .melee,
                        profileImage: profileImage!,
                        iconImage: icon!,
                        roles: [.initiator, .durable, .disabler, .carry],
                        stats: Stats(health: 200,
                                     healthRegeneration: 0.25,
                                     mana: 75,
                                     manaRegeneration: 0,
                                     armor: -1,
                                     minAttack: 25,
                                     maxAttack: 30,
                                     strength: 34,
                                     agility: 20,
                                     intelligence: 18,
                                     strengthGain: 2.8,
                                     agilityGain: 2,
                                     intelligenceGain: 1.6,
                                     attackRange: 150,
                                     projectileSpeed: 900,
                                     attackRate: 1.7,
                                     moveSpeed: 315))
        }

        static var bane: Hero {
            let profileImageData = try? fixtureData(for: "bane.png")
            let profileImage = HeroImage(data: profileImageData!)
            let iconData = try? fixtureData(for: "baneIcon.png")
            let icon = HeroImage(data: iconData!)
            return Hero(id: 3,
                        name: "Bane",
                        primaryAttribute: .intelligence,
                        attackType: .ranged,
                        profileImage: profileImage!,
                        iconImage: icon!,
                        roles: [.support, .disabler, .nuker, .durable],
                        stats: Stats(health: 200,
                                     healthRegeneration: 0.25,
                                     mana: 75,
                                     manaRegeneration: 0,
                                     armor: 1,
                                     minAttack: 33,
                                     maxAttack: 39,
                                     strength: 23,
                                     agility: 23,
                                     intelligence: 23,
                                     strengthGain: 2.5,
                                     agilityGain: 2.5,
                                     intelligenceGain: 2.5,
                                     attackRange: 400,
                                     projectileSpeed: 900,
                                     attackRate: 1.7,
                                     moveSpeed: 305))
        }

    }
}
