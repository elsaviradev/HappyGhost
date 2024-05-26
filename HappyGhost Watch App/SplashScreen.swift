//
//  SplashScreen.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("Happy Ghost")
                    .padding(.top, 55)
                    .frame(width: 10, height: 10)
                
                ZStack {
                    
                    Image("Cloud Down")
                        .resizable()
                        .scaledToFill()
                        .padding(.top, 120)
                    
                    Image("GhostRibbon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 100)
                        .padding(.bottom, 40)
                        .phaseAnimator([false, true]) { ghost, move in ghost
                                .offset(y: move ? 8 : -3)
                        } animation: {move in
                                .linear(duration: 1).delay(0.2)
                        }
                    
                    VStack {
                        NavigationLink(destination: ReadyView()) {
                            Image(systemName: "play.fill")
                        }
                        .frame(width: 120, height: 35)
                        .background(Color(red: 0.54, green: 0.79, blue: 0.15))
                        .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                        .padding(.top, 130)
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(red: 0.1, green: 0, blue: 0.1))
        }
    }
}

#Preview {
    SplashScreen()
}

