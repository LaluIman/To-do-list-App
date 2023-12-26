//
//  ListView.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 23/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var ListViewModel: ListViewModel

    var body: some View {
        ZStack{
            if ListViewModel.items.isEmpty{
                noItemsview()
            } else {
                List{
                    ForEach(ListViewModel.items) { item in
                        ListRowView (item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    ListViewModel.upadateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: ListViewModel.deleteItem)
                    .onMove(perform: ListViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        
        
        .navigationTitle("To Do List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add" , destination: Addview())
        )
    }
    
    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}


