//
//  ListRowView.swift
//  To Do LIst
//
//  Created by Hlwan Aung Phyo on 2024/06/17.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
#Preview {
    ListRowView(item: ItemModel(title: "first item", isCompleted: true ))
}
