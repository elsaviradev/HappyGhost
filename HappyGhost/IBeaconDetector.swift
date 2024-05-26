//
//  IBeaconDetector.swift
//  HappyGhost
//
//  Created by Elsavira T on 26/05/24.
//

import Foundation
import CoreLocation
import Combine

class IBeaconDetector: NSObject, CLLocationManagerDelegate, ObservableObject {
    let locationManager = CLLocationManager()
    let uuidString = "4968A108-6995-422F-BBCC-B07C488F4AAD"
    var constraint: CLBeaconIdentityConstraint!
    
    @Published var proximity: CLProximity = .unknown
    
    override init() {
        super.init()
        
        if let uuid = UUID(uuidString: uuidString) {
            constraint = CLBeaconIdentityConstraint(uuid: uuid)
            let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "kCBAdvDataAppleBeaconKey")
            
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startRangingBeacons(satisfying: beaconRegion.beaconIdentityConstraint)
        } else {
            print("Invalid UUID string")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLBeaconRegion {
            print("Entered beacon region!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLBeaconRegion {
            print("Exited beacon region!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            self.proximity = beacon.proximity
        }
    }
}
