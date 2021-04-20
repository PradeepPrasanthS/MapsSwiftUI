//
//  ContentView.swift
//  MapsSampleApp
//
//  Created by Pradeep Prasanth on 20/04/21.
//

import SwiftUI
import MapKit

// Pass your latitude and longitude below
var coord = CLLocationCoordinate2D(latitude: 42.0460, longitude: -87.8861)

// Initialize the region passing the coordinates
var region: MKCoordinateRegion{
  return(
      MKCoordinateRegion(center: coord, latitudinalMeters: 200, longitudinalMeters: 200)
     )
}

// Below model is required to show the list of markers or pointers in tha map
struct Item: Identifiable{
  var id = UUID()
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct ContentView: View{
    @State var mapRegion = region
    // Pass the coordinates of the places for which you want to show the marker
    let a = [Item(latitude: coord.latitude, longitude: coord.longitude)]

    var body: some View {
      VStack{
          Text("Your location").font(.title)
            // Now you can add the maps passing the region and the list of annotationItems
            Map(coordinateRegion: $mapRegion, annotationItems: a){ point in
              MapMarker(coordinate: point.coordinate)
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
