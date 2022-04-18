//
//  TemplateTableRow.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI

struct TemplateTableRow: View {
    var data: UserData
    var body: some View {
        
        ZStack {
            Color("BackUserView").edgesIgnoringSafeArea(.all)
            HStack {
                Text(data.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Spacer()
                getGrade(data: data)
            }.padding()
        }
    }
    
    func getGrade(data: UserData) -> Text {
        if data.validated == true {
            return Text("\(data.grade.intValue)")
                .foregroundColor(.green)
        } else if data.state == "finished" {
            return Text("Failed")
                .foregroundColor(.red)
        } else if data.state == "skill" {
            return Text("\(data.grade.floatValue)")
        }
        return Text(data.state)
    }
    
}
