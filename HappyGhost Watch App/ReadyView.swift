//
//  ReadyView.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI

struct ReadyView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("Are you ready")
                        .padding(.bottom, 20)
                    NavigationLink(destination: LocateView(), label: {
                        Image("Ready")
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color(red: 0.1, green: 0, blue: 0.1))
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ReadyView()
}
