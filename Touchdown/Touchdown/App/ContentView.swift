//
//  ContentView.swift
//  Touchdown
//
//  Created by William Lopez on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let scenes = UIApplication.shared.connectedScenes
    
    @EnvironmentObject var shop: Shop
    // MARK: - BODY
    
    var body: some View {
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top , window?.safeAreaInsets.top)
                        
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .padding(.vertical, 10)
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }
                            }
                            .padding(15)
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                            
                        }
                    }
                    
                    
                }
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
