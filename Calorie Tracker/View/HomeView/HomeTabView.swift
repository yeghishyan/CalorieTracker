//
//  HomeTabView.swift
//  GoGuess
//
//  Created by valod on 22.11.23.
//

import SwiftUI

struct HomeTabView<Content: View>: View {
    let tabs: [HomeVM.TabItem]
    @Binding var selection: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    ForEach(tabs.indices, id: \.self) { index in
                        Button {
                            self.selection = index
                        } label: {
                            TabItemView(data: tabs[index], isSelected: (index == selection))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, maxHeight: 110)
                .background(Color(hex: "#F4FAEE"))
            }
        }
        .ignoresSafeArea()
    }
}

struct TabItemView: View {
    let data: HomeVM.TabItem
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            Image(data.image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            
            if isSelected {
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(Color(hex: "#8FCA56"), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .rotationEffect(.degrees(315))
                    .frame(width: 67, height: 67)
            }
        }
        .offset(y: isSelected ? -5 : 0)
        .frame(minWidth: 100)
        .animation(.default.speed(2), value: isSelected)
        .foregroundColor(isSelected ? Color(hex: "#8FCA56") : .gray)
    }
}
