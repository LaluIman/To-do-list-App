//
//  ListRowView.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 23/12/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: itemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompeletd ? "checkmark.circle" :"circle")
                .foregroundColor( item.isCompeletd ? .green: .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "First Title", isCompletd: false)
    static var item2 = itemModel (title: "Second", isCompletd: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
