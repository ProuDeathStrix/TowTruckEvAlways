//
//  CalculatorForNoUsers.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 25.06.2021.
//

import SwiftUI
import SwiftUIX
import MapKit

struct CalculatorForNoUsers: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        
    }
    @State private var search: String = ""
    @State private var search1: String = ""
    @State var CarsType: [String : Double] = ["Мотоциклы и квадроциклы" : 1199.9, "Легковые автомобили" : 1399.9, "Автомобили бизнес класса и кроссоверы" : 1699.9, "Внедорожникики и минивены" : 1999.9]
    @State var WheelsBlocked: [String : Double] = ["0 Колес" : 0, "1 Колесо" : 399.9, "2 Колеса" : 799.9, "3 Колеса" : 1099.9, "4 Колеса" : 1499.9]
    @State var PaymentType = ["Картой", "Наличными"]
    @State var PaymentTypeCount = 0
    @State var ShowMain = false
    @State var ShowMain1 = false
    @State var ShowSettings = false
    @State var ShowModalTab = false
    @State var HiddenButton = false
    @State var HiddenModalTab = false
    @State var Wheels: Double = 0.0
    @State var TypeTC = 0
    @State var ShowSearch = false
    @State var ShowSearch1 = false
    @State var AlertOrder = false
    @State var ButtonAddressClick = false
    @State var randomInt = Double.random(in: 1..<50)

    
    
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    @Environment(\.presentationMode) var PresentationMode2
    
    
    
    
    

    
    
    
    
    
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                MapView()
                    .environmentObject(mapData)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 30.0) {
                    
                        
                    
                        
                    
                    
                    Button(action: {CloseSetting()}) {
                        Image(systemName: "xmark")
                            .frame(width: 40, height: 40)
                            .background(Color.black.opacity(0.5))
                            .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                            .mask(Circle())
                            .font(.system(size: 20))
                            .foregroundColor(Color("ColorMagic"))
                            .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                    }
                    Button(action: mapData.updateMapType){
                        Image(systemName: mapData.mapType == .standard ? "square.3.stack.3d" : "network")
                        .frame(width: 40, height: 40)
                        .background(Color.black.opacity(0.5))
                        .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                        .mask(Circle())
                        .font(.system(size: 20))
                        .foregroundColor(Color("ColorMagic"))
                        .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                    }
                    Button(action: mapData.focusLocation ){
                    Image(systemName: "location")
                        .frame(width: 40, height: 40)
                        .background(Color.black.opacity(0.5))
                        .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                        .mask(Circle())
                        .font(.system(size: 20))
                        .foregroundColor(Color("ColorMagic"))
                        .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                        
                }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                
                
                
                
                
                
                Button(action: {}) {
                    Text("Рассчитать")
                        .frame(width: 200, height: 45, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8))
                        .font(.custom("Comfortaa-Regular", size: 20))
                        .foregroundColor(Color("ColorMagic"))
                        .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)){
                                ShowModalTab.toggle()
                                HiddenButton.toggle()
                            }
                        }
                        .hidden(HiddenButton)
                }
                .padding(.top, 750.0)
                
                
              
                
                
                
                
                if ShowModalTab {
                    VStack(spacing: 15.0) {
                        Button(action: {}){
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.black)
                                .frame(width: 350, height: 45, alignment: .center)
                                .overlay(Text("Адрес подачи").foregroundColor(Color("FontColor")).font(.custom("Comfortaa-Regular", size: 20)))
                                .fullScreenCover(isPresented: $ShowMain1, content: {
                                    ContentView1()
                                })
                                .onTapGesture {
                                    
                                    ShowMain1 = true
                                }
                            
                        }
                        
                        
                        
                        
                                         
                        
                        
                        Button(action: {}){
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.black)
                                .frame(width: 350, height: 45, alignment: .center)
                                .overlay(Text("Адрес прибытия").foregroundColor(Color("FontColor")).font(.custom("Comfortaa-Regular", size: 20)))
                                .fullScreenCover(isPresented: $ShowMain1, content: {
                                    ContentView1()
                                })
                                .onTapGesture {
                                    ButtonAddressClick = true
                                    ShowMain1 = true
                                }

                        }
                        
                        Divider()
                            .background(Color("FontColor"))
                            .padding([.top, .leading, .trailing])
                        VStack {
                            VStack(alignment: .leading, spacing: 7.0) {
                                Stepper(value: $Wheels, in: 0.0...1598.0, step: 399.5) {
                                    if Wheels == 0.0 {
                                        Text("Колес заблокировано: 0")
                                    }
                                    else if (Wheels == 399.5){
                                        Text("Колес заблокировано: 1")
                                    }
                                    else if (Wheels == 799.0){
                                        Text("Колес заблокировано: 2")
                                    }
                                    else if (Wheels == 1198.5){
                                        Text("Колес заблокировано: 3")
                                    }
                                    else if (Wheels == 1598.0){
                                        Text("Колес заблокировано: 4")
                                    }
                                }
                                .padding(.horizontal)
                            }
                            Divider()
                                .background(Color("FontColor"))
                                .padding([.top, .leading, .trailing])
                            Form{
                                Picker(selection: $TypeTC, label: Text("Выберети тип ТС:")) {
                                    Text("Мотоциклы и квадроциклы").tag(0)
                                    Text("Легковые автомобили").tag(1)
                                    Text("Автомобили бизнес класса и кроссоверы").tag(2)
                                    Text("Внедорожникики и минивены").tag(3)
                                }
                                .foregroundColor(Color("FontColor"))
                                .listRowBackground(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(1.0))
                            }
                            .frame(width: 400, height: 100, alignment: .center)
                            Divider()
                                .background(Color("FontColor"))
                                .padding([.top, .leading, .trailing])
                            if TypeTC == 0 && ButtonAddressClick {
                                let CarType1: Double = CarsType["Мотоциклы и квадроциклы"] ?? 0.0
                                Text("Итого: \((CarType1 + Wheels + randomInt * 50.0),specifier: "%.2f") ₽")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                            }
                            else if TypeTC == 1{
                                let CarType2: Double = CarsType["Легковые автомобили"] ?? 0.0
                                Text("Итого: \((CarType2 + Wheels + randomInt * 50.0),specifier: "%.2f") ₽")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                            }
                            else if TypeTC == 2{
                                let CarType3: Double = CarsType["Автомобили бизнес класса и кроссоверы"] ?? 0.0
                                Text("Итого: \((CarType3 + Wheels + randomInt * 50.0),specifier: "%.2f") ₽")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                            }
                            else if TypeTC == 3{
                                let CarType4: Double = CarsType["Внедорожникики и минивены"] ?? 0.0
                                Text("Итого: \((CarType4 + Wheels + randomInt * 50.0),specifier: "%.2f") ₽")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                            }
                            Divider()
                                .background(Color("FontColor"))
                                .padding(.all)
                            HStack {
                                Image(systemName: "xmark")
                                    .frame(width: 40, height: 40)
                                    .background(Color.black.opacity(0.8))
                                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                                    .mask(Circle())
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("ColorMagic"))
                                    .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                                    .padding(.leading)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 1.0)){
                                            ShowModalTab.toggle()
                                            HiddenButton.toggle()
                                        }
                                }
                            }
                            
                        }
                    }
                    .frame(width: ShowModalTab ?  400 : 0, height: ShowModalTab ? 500 : 0, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
                    .foregroundColor(Color("FontColor"))
                    .padding(.top, 250.0)
                    .font(.custom("Comfortaa-Regular", size: 20))
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("В разрешении отказано"), message: Text("Пожалуйста разрешите доступ к геопозиции в настройках приложения"), dismissButton: .default(Text("Перейти в настройки"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    
            }))
        })
        
    }
    func CloseSetting(){
        PresentationMode2.wrappedValue.dismiss()
    }
    
    
    
    
    
}

struct CalculatorForNoUsers_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorForNoUsers()
    }
}
