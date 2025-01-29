//
//  MainTabView.swift
//  PetcoTeams
//
//  Created by MaurZac on 25/01/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .football
    
    enum Tab {
        case football, favourites, forYou
    }
    
    var body: some View {
        VStack {
            Group {
                switch selectedTab {
                case .football:
                    FootBallView()
                case .favourites:
                    FootBallView()
                case .forYou:
                    FootBallView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.slide)
            
            // Tab Bar
            HStack {
                TabButton(icon: "soccerball", title: "Football", isSelected: selectedTab == .football) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedTab = .football
                    }
                }
                Spacer()
                TabButton(icon: "star", title: "Favourites", isSelected: selectedTab == .favourites) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedTab = .favourites
                    }
                }
                Spacer()
                TabButton(icon: "doc.text", title: "For You", isSelected: selectedTab == .forYou) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedTab = .forYou
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(Color.black)
            .clipShape(Capsule())
            .foregroundColor(.white)
        }
        .padding(.horizontal,2)
        .padding(.vertical,-10)
    }
}

#Preview {
    MainTabView()
}
