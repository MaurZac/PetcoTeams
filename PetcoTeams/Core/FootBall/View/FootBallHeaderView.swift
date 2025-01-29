//
//  FootBallHeaderView.swift
//  PetcoTeams
//
//  Created by MaurZac on 28/01/25.
//
import SwiftUI

// MARK: - Encabezado de la Tabla
struct TableHeaderView: View {
    var body: some View {
        HStack {
            Text("#").bold().frame(width: 30, alignment: .center)
            Text("Team").bold().frame(width: 100, alignment: .leading)
            Text("P").bold().frame(width: 30, alignment: .center)
            Text("W").bold().frame(width: 30, alignment: .center)
            Text("D").bold().frame(width: 30, alignment: .center)
            Text("L").bold().frame(width: 30, alignment: .center)
            Text("Pts").bold().frame(width: 40, alignment: .center)
        }
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}
