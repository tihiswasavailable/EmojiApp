//
//  EmojiLoversMapView.swift
//  EmojiApp
//
//  Created by Stefan Jovic on 30.06.24.
//

import SwiftUI
import MapKit

struct EmojiLoversMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.4483, longitude: 15.3143),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle(NSLocalizedString("Emoji Lovers Map", comment: ""))
    }
}

#Preview {
    EmojiLoversMapView()
}
