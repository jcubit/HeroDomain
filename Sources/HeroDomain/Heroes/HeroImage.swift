//
//  HeroImage.swift
//  HeroDomain
//
//  Created by Javier Cuesta on 13.03.23.
//

// A platform-independent image.

#if os(macOS)
import AppKit
import SwiftUI

public typealias HeroImage = NSImage

extension HeroImage {
    public convenience init?(systemName: String) {
        self.init(systemSymbolName: systemName, accessibilityDescription: nil)
    }
}

#elseif os(iOS)
import UIKit
import SwiftUI

public typealias HeroImage = UIImage

extension HeroImage {
    public convenience init?(systemName: String) {
        self.init(systemName: systemName)
    }
}
#endif

