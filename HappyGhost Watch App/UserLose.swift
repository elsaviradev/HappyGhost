//
//  UserLose.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI

struct UserLose: View {
    var body: some View {
        ZStack {
            VStack {
                Image("Ghost 4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .padding(.bottom, 10)
                    .phaseAnimator([false, true]) { ghost, move in ghost
                            .offset(y: move ? 3 : -8)
                    } animation: {move in
                            .linear(duration: 1).delay(0.2)
                    }
                
                Image("You lose")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 30)
                    .padding(.bottom, 10)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(red: 0.1, green: 0, blue: 0.1))
    }
}

#Preview {
    UserLose()
}
