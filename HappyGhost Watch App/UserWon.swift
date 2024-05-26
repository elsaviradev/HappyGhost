//
//  UserWon.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI

struct UserWon: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("GhostRibbon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .padding(.bottom, 60)
                    .phaseAnimator([false, true]) { ghost, move in ghost
                            .offset(y: move ? 3 : -8)
                    } animation: {move in
                            .linear(duration: 1).delay(0.2)
                    }
                
                VStack {
                    Image("Trophy")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 60)
                        .position(x: 60, y: 70)
                        .padding(.bottom, 10)
                    
                    Image("You won")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 30)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(red: 0.1, green: 0, blue: 0.1))
        }
        .navigationBarBackButtonHidden()
    }
}
#Preview {
    UserWon()
}
