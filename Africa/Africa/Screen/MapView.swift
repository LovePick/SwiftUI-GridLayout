//
//  MapView.swift
//  Africa
//
//  Created by Supapon Pucknavin on 26/9/2565 BE.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates,span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    //MARK: - BODY
    var body: some View {
        
        // MARK: - 1. BASIC MAP
//        Map(coordinateRegion: $region)
        
        // MARK: - 2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            
            /*
            // (A) PINL OLD STYLE (alway static)
            MapPin(coordinate: item.location, tint: .accentColor)
            */
            
            
            /*
            // (B) MARKER: NEW STYLE (always static)
            MapMarker(coordinate: item.location, tint: .accentColor)
            */
            
            
            /*
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: ANNOTATION
             */
            
            
            // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
            
        }//: MAP
        .overlay (
            HStack(alignment: .center) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }//: HSTACK
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }//: HSTACK
                    
                    
                }//: VSTACK
            }//: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 15)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        
        )//: OVERLAY
     
        
        
        
    }
}


//MARK: - PREVIEWS
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
