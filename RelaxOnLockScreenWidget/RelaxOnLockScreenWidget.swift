//
//  RelaxOnLockScreenWidgetExtension.swift
//  RelaxOnLockScreenWidgetExtension
//
//  Created by 최동권 on 2022/08/29.
//

import Intents
import WidgetKit
import SwiftUI

@available(iOS 16, *)
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> CDLockScreenWidgetEntry {
        CDLockScreenWidgetEntry()
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CDLockScreenWidgetEntry) -> Void) {
        let entry = CDLockScreenWidgetEntry()
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CDLockScreenWidgetEntry>) -> Void)  {
        var entries: [CDLockScreenWidgetEntry] = []
        var currentDate = Date()
        let nowDate = Date()
        let oneMinute: TimeInterval = 60
        
        if let timerData = UserDefaults(suiteName: WidgetManager.suiteName)!.value(forKey: WidgetManager.lockScreenWidgetData) as? TimeInterval {
            let endDate = currentDate + timerData
            var settedSeconds = timerData
            
            while currentDate < endDate {
                let entry = CDLockScreenWidgetEntry(date: nowDate, endDate: endDate, settedSeconds: settedSeconds)
                entries.append(entry)
                currentDate += oneMinute
                settedSeconds -= 60
            }
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
            
            if currentDate >= endDate {
                let entry = CDLockScreenWidgetEntry(date: nowDate, endDate: endDate, settedSeconds: 0)
                let timeline = Timeline(entries: [entry], policy: .never)
                completion(timeline)
            }
        } else {
            let entry = CDLockScreenWidgetEntry()
            entries.append(entry)
            let timeline = Timeline(entries: entries, policy: .never)
            completion(timeline)
        }
    }
}

@available(iOS 16, *)
struct CDLockScreenWidgetEntry: TimelineEntry {
    let date: Date
    let endDate: Date
    let timerUrl: URL?
    let settedSeconds: Double
    
    init(date: Date = Date(), endDate: Date = Date(), settedSeconds: Double = 0.0) {
        self.date = date
        self.endDate = endDate

        self.timerUrl = URL(string: "RelaxOn:///TimerSettingView")
        self.settedSeconds = settedSeconds
    }
}

@available(iOS 16, *)
struct RelaxOnLockScreenWidgetExtensionEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .accessoryRectangular:
            HStack{
                ProgressView(timerInterval: entry.date...entry.endDate) {
                    Image("AppIcon")
                } currentValueLabel: {
                    
                }
                .progressViewStyle(.linear)
                Text("\(Int(entry.settedSeconds / 60))")
            }
        default:
            EmptyView()
        }
    }
}

@main
struct RelaxOnLockScreenWidgetExtension: Widget {
    let kind: String = "RelaxOnLockScreenWidgetExtension"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            RelaxOnLockScreenWidgetExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
#if os(watchOS)
        .supportedFamilies([.accessoryRectangular])
#else
        .supportedFamilies([.accessoryRectangular])
#endif
    }
}

@available(iOS 16, *)
struct RelaxOnLockScreenWidgetExtension_Previews: PreviewProvider {
    static var previews: some View {
        RelaxOnLockScreenWidgetExtensionEntryView(entry: CDLockScreenWidgetEntry(date: Date(), endDate: Date().addingTimeInterval(10)))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
            .previewDisplayName("Circular")
    }
}
