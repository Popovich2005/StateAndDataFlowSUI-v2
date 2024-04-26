//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private var contentViewVM = ContentViewViewModel()
    
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.user.name)")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(
                    title: contentViewVM.buttonTitle,
                    color: .red,
                    action: contentViewVM.startTimer
                )
                
                Spacer()
                
                ButtonView(
                    title: "LogOut",
                    color: .blue,
                    action: loginViewVM.logOut
                )
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewViewModel())
    }
}
    
