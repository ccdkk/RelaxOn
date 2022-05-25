//
//  MixedSoundCard.swift
//  LullabyRecipe
//
//  Created by hyunho lee on 2022/05/25.
//

import SwiftUI


struct MixedSoundCard : View {
    var data: MixedSound
    let selectedID: String?
    @State var show = false
    
    init(data: MixedSound,
         selectedID: String? = nil) {
        self.data = data
        self.selectedID = selectedID
    }

    var body : some View {
        
        ZStack {
            VStack(spacing: 10) {
                Image(data.imageName)
                    .resizable()
                    .frame(width: 180,
                           height: 180,
                           alignment: .center)
                    .cornerRadius(10)
                   
                Text(data.name)
                    .fontWeight(.semibold)
                Text(data.description)
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
            }
            .onTapGesture {
                
            }
        }
    }
}

struct MixedSoundCard_Previews: PreviewProvider {
    static var previews: some View {
        MixedSoundCard(
                       data: userRepositories[0],
                       selectedID: "")
    }
}