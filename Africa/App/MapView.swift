//
//  MapView.swift
//  Africa
//
//  Created by Pavan Shisode on 12/05/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTY
    @State private var region: MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLavel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLavel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        //MARK: - 1. BASIC MAP
        //        Map(coordinateRegion: $region)
        
        //MARK: - 2. ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // [A] PIN: OLD STYLE (always static)
            //            MapPin(coordinate: item.location, tint: .accentColor)
            
            // [B] MAPMARKER: NEW STYLE (always static)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // [C] CUSTOM BASIC ANNOTATIONS (it could be imteractive)
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            }//: Annotation
            
            // [D] COMPLEX MAP ANNOTATION (iteractive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })//: MAP
            .overlay(
                HStack {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .topLeading)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Lattitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Longitutde:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                }//:HSTACK
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    .padding()
                , alignment: .top
            )
    }
}

//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.dark)
    }
}