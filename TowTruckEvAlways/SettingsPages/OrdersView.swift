//
//  OrdersView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 18.06.2021.
//

import SwiftUI
import SwiftUIX
import MapKit
import CoreLocation

struct OrdersView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.init(Color("FontColor")),
            .font : UIFont(name:"Comfortaa-Bold", size: 40)!]
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        }
    @StateObject var mapData = MapViewModel()
    var body: some View {
      
        ZStack {
            Image("OrdersBack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                List{
                    Text("Заказ № 1")
                        .listRowBackground(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(12.0))
                    
                }
                .padding(.all)
                
            }
            .frame(width: 400, height: 600, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
            .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
            .foregroundColor(Color("FontColor"))
            
        }
        .navigationTitle("Заказы")
        
        
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
