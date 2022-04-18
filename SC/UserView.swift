//
//  UserView.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("BackUserView")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                UserProfile(user: user)
                ScrollView(.vertical) {
                    TemplateTableView(title: "Projects", data: user.projects)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(minHeight: 250, maxHeight: 500)
                    TemplateTableView(title: "Skills", data: user.skills)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(minHeight: 250, maxHeight: 500)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}
