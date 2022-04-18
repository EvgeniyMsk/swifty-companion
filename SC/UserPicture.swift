//
//  UserPicture.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI

struct UserPicture: View {
    var image: Image
    
    var body: some View {
        self.image
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color("Circle"), lineWidth: 3))
            .shadow(color: Color("Shadow"), radius: 3)
    }
}
