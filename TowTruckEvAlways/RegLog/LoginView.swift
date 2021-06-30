//
//  LoginView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 09.06.2021.
//

import SwiftUI
import SwiftUIX
import FirebaseAuth


struct LoginView: View {
    let EmailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    let PasswordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[a-z]).{8,}$")
    @State var ShowReg: Bool = false
    @State var ShowMain: Bool = false
    @State private var Email: String = ""
    @State private var Password: String = ""
    @State var IsValid: Bool = false
    @State var ShowProfile: Bool = false
    @State var ShowAlertView: Bool = false
    @State var AlertTitle: String = ""
    @State var AlertMessage: String = ""
    @Environment(\.presentationMode) var PresentationMode1
    var body: some View {
        ZStack {
            Image("LoginBack")
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
            VStack(spacing: 25.0) {
                Text("Авторизация")
                    .padding(.all)
                    .font(.custom("Comfortaa-Bold", size: 25))
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "envelope")
                            .font(.system(size: 20))
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.all)
                        TextField("Email", text: $Email)
                            .padding([.top, .bottom, .trailing])
                            .keyboardType(.emailAddress)
                    }
                    .font(.custom("Comfortaa-Regular", size: 20))
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8))
                    
                    if !EmailPredicate.evaluate(with: Email) && !Email.isEmpty {
                        Text("Некорректный Email")
                            .font(.custom("Comfortaa-Regular", size: 10))
                            .foregroundColor(Color("ColorMagic"))
                            .padding(.leading)
                        
                    }
                }
                
                VStack {
                    HStack {
                        Image(systemName: "key")
                            .font(.system(size: 20))
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.all)
                        SecureField("Пароль", text: $Password)
                            .foregroundColor(Color("FontColor"))
                            .keyboardType(.default)
                            .padding([.top, .bottom, .trailing])
                    }
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8))
                    .font(.custom("Comfortaa-Regular", size: 20))
                    if !PasswordPredicate.evaluate(with: Password) && !Password.isEmpty {
                        Text("Пароль должен состоять из 8 и более символов, а также содержать заглавные и строчные буквы латинского алфавита, включая символы и знаки препинания @ # $ & *")
                            .font(.custom("Comfortaa-Regular", size: 10))
                            .foregroundColor(Color("ColorMagic"))
                            .multilineTextAlignment(.leading)
                            .frame(width: 350, height: 45, alignment: .center)
                        
                    }
                }
                
                VStack(spacing: 20.0) {
                    if self.EmailPredicate.evaluate(with: Email) && self.PasswordPredicate.evaluate(with: Password) {
                        Button(action: {SignIn()}){
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.black)
                                .frame(width: 350, height: 45, alignment: .center)
                                .overlay(Text("Войти").foregroundColor(Color("FontColor")).font(.custom("Comfortaa-Regular", size: 20)))
                        }
                    }
                    
                    
                    
                    
                    
                    HStack {
                        Text("Забыли пароль ?")
                            .font(.custom("Comfortaa-Regular", size: 17))
                            .foregroundColor(Color("FontColor"))
                            .padding(.top)
                        Spacer()
                        Button(action: {SendPasswordResetEmai()}){
                            Text("Восстановить")
                                .frame(width: 160, height: 45, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black))
                                .font(.custom("Comfortaa-Regular", size: 17))
                                .padding(.top)
                        }
                    }
                    .frame(width: 350, height: 45, alignment: .center)
                }
                
                Divider()
                    .background(Color("FontColor"))
                    .padding(.horizontal)
                HStack {
                    Text("Еще нет аккаунта?")
                        .font(.custom("Comfortaa-Regular", size: 17))
                        .padding(.bottom)
                    Spacer()
                    Button(action: {}) {
                        Text("Регистрация")
                            .frame(width: 140, height: 45, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black))
                            .font(.custom("Comfortaa-Regular", size: 17))
                            .fullScreenCover(isPresented: $ShowReg, content: {
                                RegisterView()
                            })
                            .onTapGesture {
                                ShowReg = true
                            }
                        
                    }
                    .padding(.bottom)
                }
                .frame(width: 350, height: 45, alignment: .center)
            }
            .frame(width: 400, height: 450, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black).opacity(0.3))
            .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(25.0))
            .foregroundColor(Color("FontColor"))
            .alert(isPresented: $ShowAlertView) {
                Alert(title: Text(AlertTitle), message: Text(AlertMessage), dismissButton: .cancel())
            }
            .fullScreenCover(isPresented: $ShowProfile, content: {
                ProfileView()
            })
            
            
        }
        
        
    }
    
    func SignIn() {
        Auth.auth().signIn(withEmail: Email, password: Password){ result, error in
            guard error == nil else{
                self.AlertTitle = "Упс!"
                self.AlertMessage = "Пароль или Email пользователя введены неверно"
                self.ShowAlertView.toggle()
                return
            }
            Auth.auth().addIDTokenDidChangeListener{
                auth, user in
                if user != nil{
                    ShowProfile = true
                }
            }
        }
    }
    func SendPasswordResetEmai() {
        Auth.auth().sendPasswordReset(withEmail: Email){
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
        }
    }
    func CloseSetting(){
        PresentationMode1.wrappedValue.dismiss()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

