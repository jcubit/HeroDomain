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
        self.init(systemSymbolName: systemName, accessibilityDescription: nil)
    }
}
#endif


//// A platform-independent image.
//
//#if os(macOS)
//import HeroDomain
//import SwiftUI
//
//extension Image {
//    public init(heroImage: HeroImage) {
//        self.init(nsImage: heroImage)
//    }
//}
//
//#elseif os(iOS)
//import SwiftUI
//
//extension Image {
//    public init(heroImage: HeroImage) {
//        self.init(uiImage: heroImage)
//    }
//}
//#endif
