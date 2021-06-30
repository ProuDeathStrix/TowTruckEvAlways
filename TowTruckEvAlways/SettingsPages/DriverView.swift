//
//  DriverView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 25.06.2021.
//

import SwiftUI
import SwiftUIX

struct DriverView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.init(Color("FontColor")),
            .font : UIFont(name:"Comfortaa-Bold", size: 40)!]
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        }
    @Environment(\.presentationMode) var PresentationMode1
    var body: some View {
        ZStack {
            Image("OrdersBack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            Button(action: {CloseSetting()}){
            Image(systemName: "xmark")
                .frame(width: 40, height: 40)
                .background(Color.black.opacity(0.3))
                .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                .mask(Circle())
                .font(.system(size: 20))
                .foregroundColor(Color("FontColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
            }
            VStack{
                List{
                    VStack(alignment: .center) {
                        Text("Заказ № 1")
                            
                        Text("Lat1: 55.730766  Lon1: 38.025230")
                            .padding(.all)
                            
                        Text("Lat2: 55.760697  Lon2: 37.814314")
                            .padding(.all)
                            
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .listRowBackground(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(12.0))
                    
                }
                .padding(.all)
                
            }
            .frame(width: 400, height: 200, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
            .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
            .foregroundColor(Color("FontColor"))
    }
}
    func CloseSetting(){
        PresentationMode1.wrappedValue.dismiss()
    }
}
struct DriverView_Previews: PreviewProvider {
    static var previews: some View {
        DriverView()
    }
}
