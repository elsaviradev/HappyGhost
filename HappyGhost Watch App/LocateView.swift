//
//  LocateView.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI

struct LocateView: View {
    @State private var fadeInOut = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("Signal")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .position(x: 130, y: 5)
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 0.8)
                            .repeatForever(autoreverses: true)) {
                                fadeInOut.toggle()
                            }
                    }.opacity(fadeInOut ? 0.2 : 1)
                
                
                Image("Location Pin")
                    .resizable()
                    .frame(width: 35, height: 95)
                    .scaledToFit()
                    .padding(.bottom, 10)
                
                Image("Look around")
            }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(red: 0.1, green: 0, blue: 0.1))
    }
}


#Preview {
    LocateView()
}
