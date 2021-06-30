//
//  ProfileView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 10.06.2021.
//

import SwiftUI
import SwiftUIX
import FirebaseAuth
import Firebase

struct ProfileView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    @State var ShowMain = false
    @State var ShowSettings = false
    @State var userEmail = Auth.auth().currentUser?.email
    @State var userID = Auth.auth().currentUser?.uid
    @Environment(\.presentationMode) var PresentationMode
    @State var ShowAlertView: Bool = false
    @State var AlertTitle: String = ""
    @State var AlertMessage: String = ""
    @State var UserEmail: String = ""
    @State var TapDelete: Bool = false
    @State var PasswordReset: Bool = false
    @State var SignOutTap: Bool = false
    var body: some View {
        
        ZStack {
            Image("ProfileBack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Профиль")
                    .font(.custom("Comfortaa-Bold", size: 35))
                    .foregroundColor(Color("FontColor"))
                    .padding([.leading, .bottom])
                VStack(spacing: 25.0) {
                    HStack {
                        Button(action: {PasswordReset.toggle()}){
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.black)
                                .frame(width: 350, height: 45, alignment: .center)
                                .overlay(Text("Изменить Пароль").foregroundColor(Color("FontColor")).font(.custom("Comfortaa-Regular", size: 20)))
                        }
                        .alert(isPresented: $PasswordReset) {
                            Alert(
                                title: Text("Изменить пароль?"),
                                message: Text("При изменение пароля, будет отправлена ссылка с восстановлением на почту"),
                                primaryButton: .destructive(Text("Изменить")) {
                                    SendPasswordResetEmai()
                                },
                    secondaryButton: .cancel(Text("Отмена"))
                            )
                            
                        }
                        .padding(.top)
                    }
                    
                    
                    
                    VStack(spacing: 20.0) {
                        Button(action: {TapDelete.toggle()}){
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.black)
                                .frame(width: 350, height: 45, alignment: .center)
                                .overlay(Text("Удалить аккаунт").foregroundColor(Color("FontColor")).font(.custom("Comfortaa-Regular", size: 20)))
                        }
                        .alert(isPresented: $TapDelete) {
                            Alert(
                                            title: Text("Удалить аккаунт ?"),
                                            message: Text("Удаление этого аккаунта приведт к удалению данных о заказах"),
                                            primaryButton: .destructive(Text("Удалить")) {
                                                DeleteUser()
                                            },
                                secondaryButton: .cancel(Text("Отмена"))
                                        )
                        }
                        
                        
                        
                        HStack(spacing: 40.0) {
                            Button(action: {SignOutTap.toggle()}) {
                                Image(.system("arrow.turn.up.left"))
                                    .frame(width: 40, height: 40)
                                    .background(Color.black)
                                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                                    .mask(Circle())
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("ColorMagic"))
                                    .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                            }
                            .alert(isPresented: $SignOutTap, content: {
                                Alert(
                                    title: Text("Выйти из аккаунт ?"),
                                    
                                    primaryButton: .destructive(Text("Выйти")) {
                                        SignOut()
                                    },
                                    secondaryButton: .cancel(Text("Отмена"))
                                )
                            })
                            
                            
                            Button(action: {ShowSettings.toggle()}) {
                                Image(.system("gearshape"))
                                    .frame(width: 40, height: 40)
                                    .background(Color.black)
                                    .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark))
                                    .mask(Circle())
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("ColorMagic"))
                                    .shadow(color: Color("ColorMagic").opacity(0.9), radius: 10)
                            }
                            .fullScreenCover(isPresented: $ShowSettings, content: {
                                if userID == "JNajr5T7GagvqnN1tbJFrBY0VJH3" {
                                    DriverView()
                                }else{
                                    SettingsView()
                                    
                                }
                                
                            })
                        }
                        
                    }
                }
                .frame(width: 400, height: 250, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
                .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
                .foregroundColor(Color("FontColor"))
            }
            
        }
        
    }
    
    
    func SignOut() {
        do{
            try Auth.auth().signOut()
            PresentationMode.wrappedValue.dismiss()
        } catch let error{
            print(error.localizedDescription)
        }
    }
    func SendPasswordResetEmai() {
        Auth.auth().sendPasswordReset(withEmail: userEmail ?? "dmit.kryukoff2013@yandex.ru"){
            error in
            guard error == nil else{
                self.AlertTitle = "Oh-uh!"
                self.AlertMessage = (error!.localizedDescription)
                self.ShowAlertView.toggle()
                return
            }
            AlertTitle = "Ссылка с восстановлением оправлена на почту"
            AlertMessage = "Проверьте свой Email на наличие письма для сброса пароля"
            ShowAlertView.toggle()
            PresentationMode.wrappedValue.dismiss()
        }
    }
    func DeleteUser() {
        Auth.auth().currentUser!.delete { error in
               if let error = error {
                   print("error deleting user - \(error)")
               } else {
                   print("Account deleted")
                PresentationMode.wrappedValue.dismiss()
               }
           }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
