//
//  RegisterView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 09.06.2021.
//

import SwiftUI
import SwiftUIX
import FirebaseAuth

struct RegisterView: View {
    let EmailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    let PasswordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[a-z]).{8,}$")
    @State var ShowMain = false
    @State var ShowLog = false
    @State var ShowProfile = false
    @State private var Email = ""
    @State private var Password = ""
    @State private var PasswordConfirm = ""
    @State private var IsValid = false
    @State var ShowAlertView: Bool = false
    @State var AlertTitle: String = ""
    @State var AlertMessage: String = ""
    @Environment(\.presentationMode) var PresentationMode1
    var body: some View {
        ZStack {
            Image("RegisterBack")
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
                Text("Регистрация")
                    .padding(.all)
                    .font(.custom("Comfortaa-Bold", size: 25))
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "envelope")
                            .font(.system(size: 20))
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.all)
                        TextField("Email", text: $Email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding([.top, .bottom, .trailing])
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
                            .padding(.leading)
                            .padding(.horizontal)
                    }
                }
               
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "key")
                            .font(.system(size: 20))
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.all)
                        SecureField("Подтвердите пароль", text: $PasswordConfirm)
                            .foregroundColor(Color("FontColor"))
                            .keyboardType(.default)
                            .padding([.top, .bottom, .trailing])
                    }
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black).opacity(0.8))
                    .font(.custom("Comfortaa-Regular", size: 20))
                    if PasswordConfirm != Password {
                    Text("Пароли должны совпадать")
                        .font(.custom("Comfortaa-Regular", size: 10))
                        .foregroundColor(Color("ColorMagic"))
                        .padding(.leading)
                }
                }
                VStack(spacing: 10.0) {
                    
                    if self.EmailPredicate.evaluate(with: Email) && self.PasswordPredicate.evaluate(with: Password) && self.PasswordConfirm == Password {
                    
                    Button(action: {SignUp()}){
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(.black)
                            .frame(width: 350, height: 45, alignment: .center)
                            .overlay(Text("Далее").foregroundColor(Color("FontColor")).font(.custom("Comfortaa-Regular", size: 20)))
                    }
                        Link("Нажимая 'Далее', вы принимаете Условия использования и Политику конфиденциальности Сервиса ", destination: URL(string: "https://designcode.io/terms")!)
                            .font(.custom("Comfortaa-Regular", size: 10))
                            .frame(width: 350, height: 45, alignment: .center)
                }
                }
                
                
                Divider()
                    .background(Color("FontColor"))
                    .padding(.horizontal)
                    
                HStack {
                    Text("Уже есть аккаунт?")
                        .font(.custom("Comfortaa-Regular", size: 17))
                        .padding(.bottom)
                    Spacer()
                    Button(action: {}) {
                        Text("Войти")
                            .frame(width: 150, height: 45, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.black))
                            .font(.custom("Comfortaa-Regular", size: 20))
                            .fullScreenCover(isPresented: $ShowLog, content: {
                                LoginView()
                            })
                            .onTapGesture {
                                ShowLog = true
                            }
                    }
                    .padding(.bottom)
                    
                }
                .frame(width: 350, height: 45, alignment: .center)
                
            }
            .frame(width: 400, height: 500, alignment: .center)
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
    func SignUp() {
        Auth.auth().createUser(withEmail: Email, password: PasswordConfirm){ result, error in
            guard error == nil else{
                self.AlertTitle = "Oh-uh!"
                self.AlertMessage = (error!.localizedDescription)
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
    func CloseSetting(){
        PresentationMode1.wrappedValue.dismiss()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
