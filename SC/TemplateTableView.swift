//
//  TemplateTableView.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI

struct TemplateTableView: View {
    var title: String
    var data: [UserData]
    
    var body: some View {
        ZStack {
            Color("BackUserView").edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    
                List {
                    ForEach(data, id: \.id) { dataRow in
                        TemplateTableRow(data: dataRow)
                    }
                    .listRowBackground(Color("BackUserView"))
                }
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor(named: "BackUserView")
                    UITableView.appearance().separatorColor = UIColor(named: "Shadow")
                    UITableView.appearance().separatorStyle = .singleLine
                }
                .frame(minHeight: 250, maxHeight: 500)
                
            }
            .padding()
        }
    }
}
