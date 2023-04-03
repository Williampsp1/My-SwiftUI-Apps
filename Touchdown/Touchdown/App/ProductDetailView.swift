//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by William Lopez on 1/23/23.
//

import SwiftUI

struct ProductDetailView: View {
    let scenes = UIApplication.shared.connectedScenes
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        VStack(alignment: .leading, spacing: 5) {
            NavigationBarDetailView()
                .padding(.horizontal, 15)
                .padding(.top, window?.safeAreaInsets.top)
            
            HeaderDetailView()
                .padding(.horizontal)
            
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            
            VStack(alignment: .center, spacing: 0) {
                
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                QuantityFavouriteDetailView()
                    .padding(.vertical, 10)
                
                AddToCartDetailView()
                    .padding(.bottom, 20)
            }
            .padding(.horizontal)
            .background(Color.white.clipShape(CustomShape()).padding(.top, -105))
            
        }
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(Color(red: shop.selectedProduct?.red ?? sampleProduct.red, green: shop.selectedProduct?.green ?? sampleProduct.green, blue: shop.selectedProduct?.blue ??  sampleProduct.blue)
            .ignoresSafeArea(.all, edges: .all))
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
