//
//  To_Do_LIstApp.swift
//  To Do LIst
//
//  Created by Hlwan Aung Phyo on 2024/06/17.
//

import SwiftUI

@main
struct To_Do_LIstApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}
