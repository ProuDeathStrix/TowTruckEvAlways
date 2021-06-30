//
//  HelpView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 18.06.2021.
//

import SwiftUI
import SwiftUIX
import AVKit

struct HelpView: View {
    
    var body: some View {
        ZStack {
            Image("HelpBack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
           
            VStack {
                TabView{
                        
                    VStack(spacing: 30.0) {
                        Text("Заказ эвакуатора")
                            .font(.custom("Comfortaa-Bold", size: 30))
                        VStack(spacing: 20.0) {
                            Text("Для заказа перейдите в раздел настройки и нажмите на иконку :")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                
                            Button(action: {}){
                                Image(systemName: "map")
                                .frame(width: 40, height: 40)
                                .background(Color.black.opacity(0.5))
                                .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                                .mask(Circle())
                                .font(.system(size: 20))
                                .foregroundColor(Color("FontColor"))
                                .shadow(color: Color("FontColor").opacity(0.9), radius: 10)
                            }
                            
                        }
                        
                        
                       
                        
                        VStack(spacing: 20.0) {
                            Text("Далее нажмите на кнопку оформить заказ:")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Button(action: {}) {
                                Text("Оформить заказ")
                                    .frame(width: 200, height: 45, alignment: .center)
                                    .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8))
                                    .font(.custom("Comfortaa-Regular", size: 20))
                                    .foregroundColor(Color("ColorMagic"))
                                    .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                            }
                        }
                        
                                
                            
                                
                        
    
                        VStack(spacing: 20.0) {
                            Text("После этого откроеться окно, где нужно будет указать адрес подачи и прибытия, клоичество заблокированных колес, а также тип ТС")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Link(destination: URL(string: "https://youtu.be/vCoZtkpUWiI")!, label: {
                                Image(systemName: "play.circle")
                                    .font(.system(size: 50))
                                    .frame(width: 50, height: 50)
                            })
                        }
                            
                        
                        
                        
                       
                        
                        
                        
                    }
                    .frame(width: 400, height: 500)
                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(12.0))
                    .padding()
                    .foregroundColor(Color("FontColor"))
                    
                    
                    VStack(spacing: 25.0) {
                        Text("Добавление карты оплаты")
                        HStack {
                            Text("Для добваления карты оплаты, перейдите в раздел Настройки")
                                .padding(.horizontal)
                        }
                    }
                    .frame(width: 400, height: 500)
                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(12.0))
                    .padding()
                    .foregroundColor(Color("FontColor"))
                    
                    
                    
                    
                    
                    
                    
                    }
                    .tabViewStyle(PageTabViewStyle())
                .navigationTitle("Помощь")
            }
            .frame(width: 400, height: 600)
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

