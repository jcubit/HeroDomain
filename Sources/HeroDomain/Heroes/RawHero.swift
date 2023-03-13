//
//  RawHero.swift
//  HeroDomain
//
//  Created by Javier Cuesta on 13.03.23.
//

import Foundation

/// Raw hero data obtained directly from endpoint
/// Owned by the domain layer
public struct RawHero: Decodable {
    let id: Int?
    let givenName: String?
    let primaryAttribute: String?
    let attackType: String?
    let imageURL: String?
    let iconURL: String?
    let roles: [String]?
    // Base Stats
    let health: Int?
    let healthRegeneration: Double?
    let mana: Int?
    let manaRegeneration: Double?
    let armor: Double?
    let minAttack: Int?
    let maxAttack: Int?
    let strength: Int?
    let agility: Int?
    let intelligence: Int?
    let strengthGain: Double?
    let agilityGain: Double?
    let intelligenceGain: Double?
    let attackRange: Int?
    let projectileSpeed: Int?
    let attackRate: Double?
    let moveSpeed: Int?
}

extension RawHero {
    private enum CodingKeys: String, CodingKey {
        case id
        case givenName = "localized_name"
        case primaryAttribute = "primary_attr"
        case attackType = "attack_type"
        case roles
        case imageURL = "img"
        case iconURL = "icon"
        case health = "base_health"
        case healthRegeneration = "base_health_regen"
        case mana = "base_mana"
        case manaRegeneration = "base_mana_regen"
        case armor = "base_armor"
        case minAttack = "base_attack_min"
        case maxAttack = "base_attack_max"
        case strength = "base_str"
        case agility = "base_agi"
        case intelligence = "base_int"
        case strengthGain = "str_gain"
        case agilityGain = "agi_gain"
        case intelligenceGain = "int_gain"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
    }
}


extension RawHero: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension RawHero: Equatable {
    public static func == (lhs: RawHero, rhs: RawHero) -> Bool {
        lhs.id == rhs.id
    }
}



