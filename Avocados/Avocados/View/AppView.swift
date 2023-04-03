//
//  AppView.swift
//  Avocados
//
//  Created by William Lopez on 2/3/23.
//

import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocados")
                }
            ContentView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Recipes")
                }
            RipeningStagesView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
                }
            SettingsView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
                }
        }
        .onAppear() {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
        
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .previewInterfaceOrientation(.portrait)
    }
}
