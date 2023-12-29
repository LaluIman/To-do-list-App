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
                
                Image("cat2")
                    .resizable()
                    .frame(width: 300, height: 300)

                Text("There are no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a Productive Person? i think you should click the ADD button to add a bunch of items to your to do list" )
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: Addview(),
                    label: {
                        Text("Add Items 🥳")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.green : Color.accentColor)
                            .cornerRadius(10)
                        
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.green.opacity(0.7):
                        Color.accentColor.opacity(0.7),
                    radius: animate ? 20 : 10,
                    x: 0,
                    y: animate ? 30 : 20)
                .scaleEffect(animate ? 1.1 : 1.0 )
                .offset(y:animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationView{
        noItemsview()
            .navigationTitle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Title@*/Text("Title")/*@END_MENU_TOKEN@*/)
    }
    
}
