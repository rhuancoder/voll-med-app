//
//  CancelAppointmentView.swift
//  Vollmed
//
//  Created by Rhuan Carvalho on 07/04/25.
//

import SwiftUI

struct CancelAppointmentView: View {
    
    @State private var reasonToCancel: String = ""
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Conte-nos o motivo do cancelamento da sua consulta")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            TextEditor(text: $reasonToCancel)
                .padding()
                .font(.title3)
                .foregroundStyle(.accent)
                .scrollContentBackground(.hidden)
                .background(Color(.lightBlue).opacity(0.15))
                .cornerRadius(16.0)
                .frame(maxHeight: 300)
            
            Button(action: {
                print("Botão pressionado!")
            }, label: {
                ButtonView(text: "Cancelar consulta", buttonType: .cancel)
            })
        }
        .padding()
        .navigationTitle("Cancelar Consulta")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CancelAppointmentView()
}
