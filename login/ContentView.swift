//
//  ContentView.swift
//  login
//
//  Created by Igor Iwashita on 31/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var form: LoginForm
    @State private var showAlert: Bool
    
    init(){
        self.form = LoginForm(username: "", password: "")
        self.showAlert = false
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("background_tk")
                        .blur(radius: 5)
                        .ignoresSafeArea()
                        .overlay{
                            VStack{
                                Text("Yey Company")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding()
                                    .foregroundColor(.white)
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 360, height: 350, alignment: .center)
                                    .foregroundColor(.customPurple.opacity(0.30))
                                    .overlay{
                                        VStack{
                                            Spacer()
                                            TextField("Username", text: $form.username)
                                                .padding()
                                                .frame(width: 300, height: 50)
                                                .background(Color.white.opacity(0.60))
                                                .cornerRadius(10)
                                            TextField("Password", text: $form.password)
                                                .padding()
                                                .frame(width: 300, height: 50)
                                                .background(Color.white.opacity(0.60))
                                                .cornerRadius(10)
                                            Spacer()
                                            Button{
                                                showAlert = true
                                            } label: {
                                                Text("Entrar")
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .center)
                                                    .contentShape(Rectangle())
                                            }
                                            .alert("Invalid Credentials", isPresented: $showAlert) {
                                                Button("OK", role: .cancel) { }
                                            }
                                            .foregroundColor(.white)
                                            .frame(width: 300, height: 50)
                                            .background(Color.customPurple)
                                            .cornerRadius(10)
                                            .padding()
                                            Spacer()
                                        }
                                    }
                            }
                        }
                }
            }
            .navigationBarHidden(true)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
