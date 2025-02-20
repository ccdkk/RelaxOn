//
//  Static.swift
//  LullabyRecipe
//
//  Created by hyunho lee on 5/25/22.
//

import SwiftUI

enum BaseAudioName {
    case longSun
    case spaceMid
    case spaceLow
    case spaceHigh
    case oxygen
    
    var fileName: String {
        get {
            switch self {
            case .longSun:
                return "LongSun"
            case .spaceMid:
                return "SpaceMid"
            case .spaceLow:
                return "SpaceLow"
            case .spaceHigh:
                return "SpaceHigh"
            case .oxygen:
                return "Oxygen"
            }
        }
    }
    
    var displayName: String {
        get {
            switch self {
            case .longSun:
                return "Long Sun"
            case .spaceMid:
                return "Space Mid"
            case .spaceLow:
                return "Space Low"
            case .spaceHigh:
                return "Space High"
            case .oxygen:
                return "Oxygen"
            }
        }
    }
}

enum MelodyAudioName {
    case ambient
    case garden
    case gymnopedia
    case relaxing
    case wisdom
    
    var fileName: String {
        get {
            switch self {
            case .ambient:
                return "Ambient"
            case .garden:
                return "Garden"
            case .gymnopedia:
                return "Gymnopedia"
            case .relaxing:
                return "Relaxing"
            case .wisdom:
                return "Wisdom"
            }
        }
    }
    
    var displayName: String {
        get {
            switch self {
            case .ambient:
                return "Ambient"
            case .garden:
                return "Garden"
            case .gymnopedia:
                return "Gymnopedia"
            case .relaxing:
                return "Relaxing"
            case .wisdom:
                return "Wisdom"
            }
        }
    }
}

enum NaturalAudioName {
    case dryGrass
    case stream
    case summerField
    case umbrellaRain
    case wave
    
    var fileName: String {
        get {
            switch self {
            case .dryGrass:
                return "DryGrass"
            case .stream:
                return "Stream"
            case .summerField:
                return "SummerField"
            case .umbrellaRain:
                return "UmbrellaRain"
            case .wave:
                return "Wave"
            }
        }
    }
    
    var displayName: String {
        get {
            switch self {
            case .dryGrass:
                return "DryGrass"
            case .stream:
                return "Stream"
            case .summerField:
                return "SummerField"
            case .umbrellaRain:
                return "UmbrellaRain"
            case .wave:
                return "Wave"
            }
        }
    }
}

enum ColorPalette {
    case background
    case forground
    case tabBackground
    case buttonBackground
    case launchbackground
    case textGray
    
    var color: Color {
        get {
            switch self {
            case .background:
                return Color("Background")
            case .forground:
                return Color("Forground")
            case .tabBackground:
                return Color("TabBackground")
            case .buttonBackground:
                return Color("ButtonBackground")
            case .launchbackground:
                return Color("LaunchBackground")
            case .textGray:
                return Color("TextGray")
            }
        }
    }
}

enum ImageName {
    case BackPattern
    case NewSoundtrack
    
    var imageName: String {
        get {
            switch self {
            case .BackPattern:
                return "BackPattern"
            case .NewSoundtrack:
                return "NewSoundtrack"
            }
        }
    }
}

let recipeRandomName = ["Recipe1","Recipe2","Recipe3","Recipe4","Recipe5","Recipe6","Recipe7","Recipe8","Recipe9","Recipe10"]


let viewHorizontalPadding: CGFloat = 10

class deviceFrame {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var exceptPaddingWidth: CGFloat {
        get {
            return screenWidth - 30
        }
    }
}

/*
 * 사용 방법:

        init(){Theme.navigationBarColors(background: .systemFill, titleColor: .white)}
        var body: some View {} ~

 위 코드를 View 안에 넣고 원하는 UIColor 의 Color 로 설정해주면 된다.
 */

// MARK: Navigation Bar Color change
class Theme {
    static func navigationBarColors(background: UIColor?, titleColor: UIColor? = nil, tintColor: UIColor? = nil ) {

        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background ?? .clear

        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]

        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
    }
}
