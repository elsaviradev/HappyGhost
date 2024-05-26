//
//  ContentView.swift
//  HappyGhost
//
//  Created by Elsavira T on 26/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var beaconManager = IBeaconDetector()
    @State private var ghostAppear: Bool = false
    
    var body: some View {
        ZStack {
            
            if ghostAppear == true {
                CatchHPView()
            } else {
                LocateHPView()
            }
        }
        .onReceive(beaconManager.$proximity) { proximity in
            print(proximity)
            switch proximity {
            case .immediate:
                ghostAppear = true
            case .near:
                ghostAppear = false
            case .far:
                ghostAppear = false
            case .unknown:
                ghostAppear = false
            @unknown default:
                ghostAppear = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
