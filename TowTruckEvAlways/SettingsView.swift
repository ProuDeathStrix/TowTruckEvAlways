//
//  SettingsView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 17.06.2021.
//

import SwiftUI
import SwiftUIX
import FirebaseAuth

struct SettingsView: View {
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .foregroundColor: UIColor.init(Color("FontColor")),
                .font : UIFont(name:"Comfortaa-Bold", size: 40)!]
        }
    @State var ShowMain = false
    @Environment(\.presentationMode) var PresentationMode1
    var body: some View {
            NavigationView {
                ZStack {
                    Image("SettingsBack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading) {
                       
                            HStack {
                                Button(action: {CloseSetting()}){
                                Image(.system("person"))
                                    .padding(.leading)
                                        .frame(width: 40, height: 40)
                                    .font(.system(size: 20))
                                Text("Профиль")
                                    .font(.custom("Comfortaa-Regular", size: 20))
                                    .padding([.top, .leading, .bottom], 15.0)
                                }
                            }
                        .padding(.top)
                            
                                
                        Divider()
                            .background(Color("FontColor"))
                            .padding(.horizontal)
                        NavigationLink(destination: OrdersView()) {
                            Image(.system("clock"))
                                .padding(.leading)
                                    .frame(width: 40, height: 40)
                                    .font(.system(size: 20))
                            Text("Заказы")
                                .font(.custom("Comfortaa-Regular", size: 20))
                                .padding([.top, .leading, .bottom], 15.0)
                        }
                        Divider()
                            .background(Color("FontColor"))
                            .padding(.horizontal)
                        
                        NavigationLink(destination: HelpView()) {
                            Image(.system("questionmark"))
                                .padding(.leading)
                                    .frame(width: 40, height: 40)
                                    .font(.system(size: 20))
                            Text("Помощь")
                                .font(.custom("Comfortaa-Regular", size: 20))
                                .padding([.top, .leading, .bottom], 15.0)
                        }
                        Divider()
                            .background(Color("FontColor"))
                            .padding(.horizontal)
                        
                        NavigationLink(destination: AboutUsView()) {
                            Image(.system("text.alignleft"))
                                .padding(.leading)
                                    .frame(width: 40, height: 40)
                                    .font(.system(size: 20))
                            Text("О нас")
                                .font(.custom("Comfortaa-Regular", size: 20))
                                .padding([.top, .leading, .bottom], 15.0)
                        }
                        
                        VStack {
                            Divider()
                                .background(Color("FontColor"))
                                .padding([.leading, .bottom, .trailing])
                            Image(systemName: "map")
                                .frame(width: 40, height: 40)
                                .background(Color.black.opacity(0.5))
                                .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                                .mask(Circle())
                                .font(.system(size: 20))
                                .foregroundColor(Color("FontColor"))
                                .shadow(color: Color("FontColor").opacity(0.9), radius: 10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.horizontal, 180)
                                .fullScreenCover(isPresented: $ShowMain, content: {
                                    MainView()
                                })
                                .onTapGesture {
                                    ShowMain = true
                            }
                        }
                    }
                    .frame(width: 400, height: 330, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
                    .foregroundColor(Color("FontColor"))
                }
                .navigationBarTitle("Настройки")
            }
        }
    func CloseSetting(){
        PresentationMode1.wrappedValue.dismiss()
    }
    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


