//
//  WatchToiOSConnector.swift
//  HappyGhost Watch App
//
//  Created by Elsavira T on 26/05/24.
//

import Foundation
import WatchConnectivity

class WatchConnector: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("WCSession is activated")
        case .inactive:
            print("WCSession is inactive")
        case .notActivated:
            if let error = error {
                print("WCSession activation failed with error: \(error.localizedDescription)")
            }
        @unknown default:
            fatalError("Unexpected WCSession activation state")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
    }
}

