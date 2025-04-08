//
//  CancelAppointmentView.swift
//  Vollmed
//
//  Created by Rhuan Carvalho on 07/04/25.
//

import SwiftUI

struct CancelAppointmentView: View {
    
    var appointmentID: String
    let service = WebService()
    @State private var reasonToCancel: String = ""
    @State private var showAlert: Bool = false
    @State private var isAppointmentCanceled: Bool = false
    
    func cancelAppointment() async {
        do {
            isAppointmentCanceled = try await service.cancelAppointment(appointmentID: appointmentID, reasonToCancel: reasonToCancel)
        } catch {
            print("Ocorreu um erro ao desmarcar a consulta: \(error.localizedDescription)")
            isAppointmentCanceled = false
        }
        showAlert = true
    }
    
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
                Task {
                    await cancelAppointment()
                }
            }, label: {
                ButtonView(text: "Cancelar consulta", buttonType: .cancel)
            })
        }
        .padding()
        .navigationTitle("Cancelar Consulta")
        .navigationBarTitleDisplayMode(.large)
        .alert(isAppointmentCanceled ? "Sucesso!" : "Ops, algo deu errado!", isPresented: $showAlert, presenting: isAppointmentCanceled) { _ in
            Button("Ok", action: {})
        } message: { isCanceled in
            if isCanceled {
                Text("Consulta cancelada com sucesso!")
            } else {
                Text("Houve um erro ao cancelar a sua consulta. Por favor tente novamente ou entre em contato via telefone.")
            }
        }
    }
}

#Preview {
    CancelAppointmentView(appointmentID: "123")
}
