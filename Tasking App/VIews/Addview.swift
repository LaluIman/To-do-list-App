//
//  Addview.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 23/12/23.
//

import SwiftUI

struct Addview: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var TextFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type New List...", text: $TextFieldText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color.gray.opacity(0.20))
                    .cornerRadius(15)
                    
                Button(action: saveButtonPressed, label: {
                    Text("Add".uppercased())
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add New List! ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropiate() {
            listViewModel.addItem(title: TextFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    
    func textIsAppropiate() -> Bool{
        if TextFieldText.count < 3{
            alertTitle = "Item must be at least 3 characters long!😨😱😰 "
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}



    
    #Preview {
        NavigationView{
            Addview()
        }
        .environmentObject(ListViewModel() )
    }

