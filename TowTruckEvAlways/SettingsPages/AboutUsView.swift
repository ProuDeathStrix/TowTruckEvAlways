//
//  AboutUsView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 18.06.2021.
//

import SwiftUI
import SwiftUIX
import MapKit

struct AboutUsView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 55.730985, longitude: 38.024656),
           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
       )
    var body: some View {
        ZStack {
            Image("AboutUsBack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading, spacing: 18.0) {
                    Map(coordinateRegion: $region)
                        .edgesIgnoringSafeArea(.all)
                    Text("Адрес: Балашиха, улица 1 Мая, 11")
                        .padding(.leading)
                    Text("Время работы: 24/7")
                        .padding(.leading)
                    Text("Email: dmit.kryukoff2013@yandex.ru")
                        .padding(.leading)
                    Text("Номер телефона: +7(495)555-09-45, +7(925)675-80-15")
                        .padding(.leading)
                    Text("Контактное лицо: Крюков Дмитрий")
                        .padding(.leading)
                }
                VStack(spacing: 13.0) {
                    Divider()
                        .background(Color("FontColor"))
                        .padding(.all)
                    Text("EvAlways работает с 2019 года. На данный момент у нас в Москве более 15 автомобилей и одни из самых низких цен в Москве")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Text("Работая с нами, Вы можете быть уверены в качестве наших услуг.")
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                }
            }
            .frame(width: 400, height: 700)
            .background(Color(#colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)).opacity(0.1))
            .cornerRadius(12.0)
            .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(12.0))
            .foregroundColor(Color("FontColor"))
        }
        .navigationTitle("О нас")            
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
