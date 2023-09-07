/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Ngo Chi Binh
  ID: s3938145
  Created  date: 15/08/2023
  Last modified: 07/09/2023
  Acknowledgement: N/A
*/

import SwiftUI

struct AddUser: View {
    @State private var showingAlert = false
    @State private var alertMessage:String = ""
    @State private var name:String = ""
    
    @Binding var show: Bool
    
    @StateObject var userVM = UserViewModel()
    var body: some View {
        
        if show {
            ZStack {
                Color.gray.opacity(show ? 0.9 : 0.9).edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack {
                        Text("Register")
                            .fontWeight(.semibold)
                        HStack {
                            Text("User Name: ")
                            TextField("Enter your user name",
                                      text: $name)
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Register") {
                            showingAlert = true
                            if (userVM.users.contains(where: {$0.name == name})) {
                                alertMessage = "\(name) already exist"
                            } else if (name == "") {
                                alertMessage = "User name must not be empty"
                            } else {
                                userVM.addUser(name: name)
                                alertMessage = ("\(name) registered, return to Main Menu then back here for new user to show up")
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            playSound(sound: "click", type: "wav")
                        })
                        .buttonStyle(SubMenuButton())
                        .padding(7)
                        .alert(isPresented: $showingAlert, content: {
                            Alert(
                                title: Text("Attention!"),
                                message: Text("\(alertMessage)")
                            )
                        })
                    }.padding()
                }
            }
            .frame(width: 350, height: 200)
            .cornerRadius(20)
        }
    }
}

struct AddUser_Previews: PreviewProvider {
    static var previews: some View {
        AddUser(show: .constant(true))
    }
}
