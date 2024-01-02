//
//  noItemsview.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 25/12/23.
//

import SwiftUI

struct noItemsview: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                
                Image("sloth")
                    .resizable()
                    .frame(width: 350, height: 350)

                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("maybe you should add an item so are not lazy like the sloth above." )
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: Addview(),
                    label: {
                        Text("Add Items ")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                        
                    })
                
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .offset( y: -50)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    NavigationView{
        noItemsview()
            .navigationTitle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Title@*/Text("Title")/*@END_MENU_TOKEN@*/)
    }
    
}
