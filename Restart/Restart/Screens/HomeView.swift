//
//  HomeView.swift
//  Restart
//
//  Created by William Lopez on 9/4/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            Spacer()
            headerImageView
            
            // MARK: - CENTER
            centerTextView
            
            // MARK: - FOOTER
            Spacer()
            footerRestartView
            
        } //: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
    
    // MARK: - HEADER
    var headerImageView: some View {
        ZStack {
            CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
            
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: isAnimating ?  35 : -35)
                .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)
        }
    }
    
    // MARK: - CENTER
    var centerTextView: some View {
        Text("The time that leads to mastery is dependant on the intensity of our focus.")
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    // MARK: - FOOTER
    var footerRestartView: some View {
        Button(action: {
            withAnimation {
                playSound(sound: "success", type: "m4a")
                isOnboardingViewActive = true
            }
        }){
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            Text("Restart")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
            
        } //: BUTTON
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
