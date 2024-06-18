//
//  AddView.swift
//  To Do LIst
//
//  Created by Hlwan Aung Phyo on 2024/06/17.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText : String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var alertTitle : String = ""
    @State var showAlert:Bool = false
    var body: some View {
            
        ScrollView{
                VStack {
                    TextField("Type somthing here...",text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height:55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height:55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor.gradient)
                            .cornerRadius(10)
                    }
                    
                }
                .padding(40)
                
            }
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
        .navigationTitle("Add an Item..")
            
        }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Your ToDo items must be at least 3 characters long !!!"
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView{
        AddView()
    }
    
}
