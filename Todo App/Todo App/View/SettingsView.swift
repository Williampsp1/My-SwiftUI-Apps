//
//  SettingsView.swift
//  Todo App
//
//  Created by William Lopez on 3/2/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    @State var isThemeChanged: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                Form {
                    Section(header: Text("Choose the app icon")) {
                        Picker(selection: $iconSettings.currentIndex, label:
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 9, style: .continuous)
                                    .strokeBorder(Color.primary, lineWidth: 2)
                                Image(systemName: "paintbrush")
                                    .font(.system(size: 28, weight: .regular, design: .default))
                                    .foregroundColor(Color.primary)
                            }
                            .frame(width: 44, height: 44)
                            
                            Text("App Icons".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.primary)
                        }
                               
                        ) {
                            ForEach(0..<iconSettings.iconNames.count) { index in
                                HStack {
                                    Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)
                                    
                                    Spacer().frame(width: 8)
                                    
                                    Text(iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)
                                }
                                .padding(3)
                            }
                        }
                        .onReceive([iconSettings.currentIndex].publisher.first()) {
                            (value) in
                            let index = iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                            if index != value {
                                UIApplication.shared.setAlternateIconName(iconSettings.iconNames[value]) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    } else {
                                        print("Success! You changed the icon!")
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 3)
                    .alert(isPresented: $isThemeChanged) {
                        Alert(title: Text("SUCCESS!"),
                              message: Text("App has been changed to the \(themes[theme.themeSettings].themeName)"))
                    }
                    
                    Section(header:
                     HStack {
                        Text("Choose the app theme")
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(themes[theme.themeSettings].themeColor)
                     }
                    ) {
                        List {
                            ForEach(themes, id: \.id) { item in
                                Button(action: {
                                    theme.themeSettings = item.id
                                    isThemeChanged.toggle()
                                    //UserDefaults.standard.set(theme.themeSettings, forKey: "Theme")
                                }) {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(item.themeColor)
                                        Text(item.themeName)
                                    }
                                }
                                .tint(Color.primary)
                            }
                        }
                    }
                    .padding(.vertical, 3)
                    
                    Section(header: Text("GitHub")) {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://github.com/Williampsp1")
                    }
                    .padding(.vertical, 3)
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "William Lopez")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }
                    .padding(.vertical, 3)
                }
                
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
            }
            .toolbar {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("ColorBackground").ignoresSafeArea())
        }
        .tint(themes[theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(IconNames())
    }
}
