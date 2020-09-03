//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by RANGA REDDY NUKALA on 02/09/20.
//

import SwiftUI


// MARK:- Custom transitions using ViewModifier

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipShape(Circle())
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .bottomTrailing), identity: CornerRotateModifier(amount: 0, anchor: .bottomTrailing))
    }
}

struct ContentView: View {
    
    @State private var enabled = false
    @State private var onTouchId = false
    
    var body: some View {
        
        VStack {
            Spacer()
            Button("Hola 👋") {
                withAnimation(
                    Animation.spring()
                ){enabled.toggle()}
            }.foregroundColor(.black)
            .font(.system(size: 40, weight: .bold))
            Spacer()
            if enabled {
                Image(systemName: "touchid")
                    .resizable()
                    .foregroundColor(onTouchId ? Color.green : Color.red)
                    .frame(width: 60, height: 60, alignment: .center)
                    .onLongPressGesture {
                        withAnimation(Animation.spring().delay(10)) {
                            onTouchId.toggle()
                        }
                    }
                    .transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
