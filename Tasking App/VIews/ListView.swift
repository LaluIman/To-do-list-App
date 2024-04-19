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
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                .listRowSeparatorTint(.white.opacity(0))
            }
        }
        .navigationTitle("To Do List 📝")
        .navigationBarItems(
            trailing:
                NavigationLink("+" , destination: Addview())
                .foregroundColor(.white)
                .font(.system(size: 40))
                .padding()
                .background(
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 40)
                        .offset(x: 3.5, y: 3)
                )
        )
    }

    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}


