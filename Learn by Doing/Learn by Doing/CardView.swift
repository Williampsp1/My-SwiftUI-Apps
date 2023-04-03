//
//  CardView.swift
//  Learn by Doing
//
//  Created by William Lopez on 2/2/23.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpward = false
    @State private var showAlert = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                print("Button tapped")
                playSound(sound: "sound-chime", type: "mp3")
                
                hapticImpact.impactOccurred()
                showAlert.toggle()
            }) {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .tint(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title.weight(.medium))
                        .tint(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: moveUpward ? 210 : 300)
        }
        .frame(width: 355, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        }
        .alert(card.title, isPresented: $showAlert) {
            Button("Close"){
            }
        }
        message: {
            Text(card.message)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[3])
            .previewLayout(.sizeThatFits)
    }
}
