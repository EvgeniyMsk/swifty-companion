//
//  UserProfile.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI

struct UserProfile: View {
    var user: User
    var body: some View {
        
        VStack {
            HStack(alignment: .center, spacing: 20) {
                UserPicture(image: user.image)
                VStack(alignment: .leading)  {
                    Text(user.login)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(user.displayName)
                    Text(user.email)
                        .font(.headline)
                    Text(user.location)
                        .font(.subheadline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            }
            
            HStack(alignment: .center, spacing: 20) {
                Text("Wallet:")
                Text("\(user.wallet)")
            }
            HStack(alignment: .center, spacing: 20) {
                Text("Evaluation points:")
                Text("\(user.evaluationPoints)")
            }
            LevelBar(user: user, levelProgess: user.levelProgress)
        }
        .padding()
        
    }
}
