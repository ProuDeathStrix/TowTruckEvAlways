//
//  ContentView1.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 25.06.2021.
//

import SwiftUI
import MapKit
import SwiftUIX

struct ContentView1: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    @Environment(\.presentationMode) var PresentationMode2
    
    private func getNearByLandmarks() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
            }
        }
        
        
    }
    
    func calculateOffset() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack {
            
            
            MapView1(landmarks: landmarks)
    
            
            VStack(spacing: 20.0) {
                HStack {
                    Image(.system("magnifyingglass"))
                        .padding(.leading)
                    TextField("Search", text: $search, onEditingChanged: { _ in })
                    {
                        // commit
                        self.getNearByLandmarks()
                       
                    }
                    
                }
                .frame(width: 400, height: 45)
                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
                .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
                
                Spacer()
                Button(action: {CloseSetting()}){
                    Text("Далее")
                        .frame(width: 200, height: 45, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8))
                        .font(.custom("Comfortaa-Regular", size: 20))
                        .foregroundColor(Color("ColorMagic"))
                        .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                }
            }
            .padding(.top, 150.0)
            .frame(width: 400, height: 150)
            
            
            PlaceListView(landmarks: self.landmarks) {
                // on tap
                self.tapped.toggle()
            }.animation(.spring())
                .offset(y: calculateOffset())
            
            
            
        }
        
        
    }
    func CloseSetting(){
        PresentationMode2.wrappedValue.dismiss()
    }
    
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

