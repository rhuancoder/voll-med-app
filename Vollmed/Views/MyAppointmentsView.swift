//
//  MyAppointmentsView.swift
//  Vollmed
//
//  Created by Rhuan Carvalho on 31/03/25.
//

import SwiftUI

struct MyAppointmentsView: View {
    
    let service = WebService()
    
    @State private var appointments: [Appointment] = []
    
    func getAllAppointments() async {
        do {
            if let appointments = try await service.getAllAppointmentsFromPatient(patientID: patientID) {
                self.appointments = appointments
            }
        } catch {
            print("Ocorreu um erro ao obter consultas: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            if appointments.isEmpty {
                Text("Não há nenhuma consulta agendada no momento!")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.cancel)
                    .multilineTextAlignment(.center)
            } else {
                ScrollView(showsIndicators: false) {
                    ForEach(appointments) { appointment in
                        SpecialistCardView(specialist: appointment.specialist, appointment: appointment)
                    }
                }
                .navigationTitle("Minhas consultas")
                .navigationBarTitleDisplayMode(.large)
                .padding()
                .onAppear {
                    Task {
                        await getAllAppointments()
                    }
                }
            }
        }
    }
}

#Preview {
    MyAppointmentsView()
}
