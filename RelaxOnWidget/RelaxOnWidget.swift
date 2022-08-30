//
//  RelaxOnWidget.swift
//  RelaxOnWidget
//
//  Created by 이가은 on 2022/08/04.
//

import Intents
import WidgetKit
import SwiftUI

struct RelaxOnWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    
    var body: some View {
        
        // // TODO: 이후 큰 사이즈의 위젯이 추가되었을 때
        //        switch family {
        //            case .systemSmall:
        //                Text(entry.date, style: .time)
        //            case .systemMedium:
        //                Text("systemMedium")
        //            case .systemLarge:
        //                Text("systemLarge")
        //            case .systemExtraLarge:
        //                Text("systemExtraLarge")
        //            default:
        //                EmptyView()
        //        }
        if #available(iOS 16, *) {
            switch family {
            case .accessoryCircular:
                Gauge(value: 0.5) {
                    
                }
                .gaugeStyle(.accessoryCircular)
                .widgetURL(entry.timerUrl)
            case .accessoryRectangular:
                Gauge(value: 0.7) {
                    
                }
                .gaugeStyle(.accessoryLinear)
                .widgetURL(entry.timerUrl)
            case .systemSmall:
                let _ = print("hihihi")
                VStack {
                    Image(entry.imageName)
                        .resizable()
                        .scaledToFit()
                    Text(entry.name)
                }
                .padding(.vertical, 20)
                .widgetURL(entry.url)
            default:
                EmptyView()
            }
        } else {
            VStack {
                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                Text(entry.name)
            }
            .padding(.vertical, 20)
            .widgetURL(entry.url)
        }
    }
}

@main
struct RelaxOnWidget: Widget {
    let kind: String = "RelaxOnWidget"
    
    var body: some WidgetConfiguration {
        
        if #available(iOS 16, *) {
            return StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
                RelaxOnWidgetEntryView(entry: entry)
            })
            .configurationDisplayName("My Widget")
            .description("This is an example widget.")
            .supportedFamilies([.systemSmall, .accessoryCircular, .accessoryRectangular])
        } else {
            return StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
                RelaxOnWidgetEntryView(entry: entry)
            })
            .configurationDisplayName("My Widget")
            .description("This is an example widget.")
            .supportedFamilies([.systemSmall])
        }
    }
}

struct RelaxOnWidget_Previews: PreviewProvider {
    static var previews: some View {
        RelaxOnWidgetEntryView(entry: CDWidgetEntry(date: Date(), imageName: "Recipe5", id: 1, name: "temp"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
