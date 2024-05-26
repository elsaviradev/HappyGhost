//
//  CatchView.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI


struct CatchView: View {
    @State private var timeRemaining = 9
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Ghost2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .padding([.leading, .bottom], 80)
                    .phaseAnimator([false, true]) { ghost, move in ghost
                            .offset(x: move ? 100 : -180)
                    } animation: {move in
                            .linear(duration: 1.5).delay(0.1)
                    }
                VStack {
                    Text("00:0\(timeRemaining)")
                        .font(.title3).bold()
                        .foregroundStyle(.white)
                        .padding(.top, 120)
                    
                    NavigationLink(destination: UserWon(), label: {
                        Text("Catch!")
                            .frame(width: 100, height: 35)
                            .background(Color(red: 0.54, green: 0.79, blue: 0.15))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                    }).buttonStyle(PlainButtonStyle())
                }
            }
            
            .onReceive(timer) {time in
                guard isActive else { return }
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .onChange(of: scenePhase) {
                if scenePhase == .active {
                    isActive = true
                } else {
                    isActive = false
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(red: 0.1, green: 0, blue: 0.1))
        }
    }
}

#Preview {
    CatchView()
}
