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
    public let id: Int?
    public let givenName: String?
    public let primaryAttribute: String?
    public let attackType: String?
    public let imageURL: String?
    public let iconURL: String?
    public let roles: [String]?
    // Base Stats
    public let health: Int?
    public let healthRegeneration: Double?
    public let mana: Int?
    public let manaRegeneration: Double?
    public let armor: Double?
    public let minAttack: Int?
    public let maxAttack: Int?
    public let strength: Int?
    public let agility: Int?
    public let intelligence: Int?
    public let strengthGain: Double?
    public let agilityGain: Double?
    public let intelligenceGain: Double?
    public let attackRange: Int?
    public let projectileSpeed: Int?
    public let attackRate: Double?
    public let moveSpeed: Int?
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



