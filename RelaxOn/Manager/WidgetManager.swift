//
//  WidgetManager.swift
//  RelaxOn
//
//  Created by 이가은 on 2022/08/06.
//

import WidgetKit

struct SmallWidgetData: Codable {
    let imageName: String
    let name: String
    let id: Int
}

class WidgetManager {
    static let suiteName = "group.relaxer.RelaxOnWidget"
    static let smallWidgetData = "smallWidgetData"
    static let widgetName = "RelaxOnWidget"
    static let lockScreenwidgetName = "RelaxOnLockScreenWidget"
    static let lockScreenWidgetData = "lockScreenWidgetData"
    
    static func addMainSoundToWidget(imageName: String, name: String, id: Int) {
        let data = SmallWidgetData(imageName: imageName, name: name, id: id)
        if let encodedData = try? JSONEncoder().encode(data),
           let UserDefaultsAppGroup = UserDefaults(suiteName: suiteName) {
            UserDefaultsAppGroup.set(encodedData, forKey: smallWidgetData)
        }
        WidgetCenter.shared.reloadTimelines(ofKind: widgetName)
    }
    
    static func setupTimerToLockScreendWidget(settedSeconds: Double) {
        if let UserDefaultsAppGroup = UserDefaults(suiteName: suiteName) {
            UserDefaultsAppGroup.set(settedSeconds, forKey: lockScreenWidgetData)
        }
        WidgetCenter.shared.reloadTimelines(ofKind: lockScreenwidgetName)
    }
    
    static func getURL(id: Int) -> URL? {
        if let url = URL(string: "RelaxOn:///MixedSound\(id)") {
            return url
        } else {
            return nil
        }
    }
}
