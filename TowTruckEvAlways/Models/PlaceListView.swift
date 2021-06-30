//
//  PlaceListView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 25.06.2021.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    @State private var landmarksS: [Landmark] = [Landmark]()
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
                .background(Color.gray)
                .gesture(TapGesture()
                    .onEnded(self.onTap)
            )
            
            
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .fontWeight(.bold)
                        Text(landmark.title)
                    }
                }
            }.animation(nil)
            
        }.cornerRadius(10)
        
    }
    
   
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
