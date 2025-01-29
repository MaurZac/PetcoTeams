//
//  TabButton.swift
//  PetcoTeams
//
//  Created by MaurZac on 25/01/25.
//

import SwiftUI

struct TabButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(isSelected ? .black : .white)
                if isSelected {
                    Text(title)
                        .font(.footnote)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .frame(width: 110)
            .background(isSelected ? Color.white : Color.clear)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    TabButton(icon: "soccerball", title: "Football", isSelected: true){
        print("football")
    }
}
