//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by RANGA REDDY NUKALA on 02/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount: CGFloat = 1
    @State private var status: Bool = false
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.1999762356, green: 0.200016588, blue: 0.1999709308, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 15, damping: 10)){
                        animationAmount+=360
                        status.toggle()
                    }
                }, label: {
                    Image(systemName: "airpodspro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .center)
                        .foregroundColor(.white)
                }).rotation3DEffect(
                    .degrees(Double(animationAmount)),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
            )
                Text(status ? "AirPods Pro Connected" : "Searching..." )
                    .foregroundColor(.white)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
