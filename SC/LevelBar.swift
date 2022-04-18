//
//  LevelBar.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI

struct LevelBar: View {
    var user: User
    var levelProgess: CGFloat
    
    var body: some View {
        ZStack {
            GeometryReader { gmt in
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.black)
                    .frame(height: 35.0)
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.green)
                    .frame(width: gmt.size.width/100*self.levelProgess, height: 35.0)
            }
            .frame(height: 40)
            Text("level: \(user.level)")
                .font(.headline)
                .foregroundColor(.white)
                
        }.padding()
    }
}
