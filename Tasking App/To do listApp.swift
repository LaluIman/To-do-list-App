//
//  Tasking_AppApp.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 23/12/23.
//

import SwiftUI

/*
 MVVM Architecture
 
 MVVM singkatan dari
 
 Model - Data point
 VIew - UI
 View - Manages model for view
 
 
 
 */

@main
struct Tasking_AppApp: App {
    
    @StateObject var listViewModel: ListViewModel  = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
