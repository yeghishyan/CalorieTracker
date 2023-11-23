//
//  TodayPage.swift
//  Calorie Tracker
//
//  Created by valod on 23.11.23.
//

import SwiftUI
import SwiftData

struct TodayPage: View {
    @State var selectedDay: Date = .now
    
    var data: [ChartItem] { return demo }
    
    @Environment(\.modelContext) var modelContext
    @Query var cartData: [ChartItem]
    
    var body: some View {
        ZStack {
            Color(hex: "#F2F6F8")
            
            VStack(spacing: 40) {
                HeaderView()
                
                HStack(alignment: .center, spacing: 10) {
                    CircleChartView(items: data)
                    Spacer()
                    VerticalChartView(items: data)
                }
                .padding(.horizontal, 30)
                
                VStack(spacing: 10) {
                    DietInfoView()
                    
                    AddItemSection()
                }
            }
            .padding(.top, 60)
        }
        .onAppear(perform: initData)
        .animation(.default.speed(2), value: selectedDay)
        .ignoresSafeArea(.all)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 20) {
            Text("Today")
                .font(.system(size: 43, weight: .bold))
            
            Spacer()
            
            ButtonFactory(image: "calendar")
            ButtonFactory(image: "gearshape.fill")
        }
        .padding(.horizontal, 25)
        
        WeekView(selectedDay: $selectedDay)
    }
    
    @ViewBuilder
    func DietInfoView() -> some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text(salmonSalad.name)
                    .bold()
                Text(salmonSalad.desc)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 12)
            .font(.system(size: 15))
            .padding(.top, 10)
            
            HorizontalCircleChartView(items: salmonSalad.nutrients)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    @ViewBuilder
    func AddItemSection() -> some View {
        VStack(spacing: 30) {
            HStack {
                Text("Date & Time")
                    .bold()
                
                Spacer()
                
                Text(Date.now.getFormatted("MMM dd, yyyy"))
                    .padding(5)
                    .background(Color(hex: "EEEEEF"))
                
                Text(Date.now.getFormatted("hh:mm a"))
                    .padding(5)
                    .background(Color(hex: "EEEEEF"))
            }
            .font(.system(size: 15))
            
            Button(action: {}, label: {
                Text("Add Item")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white.opacity(0.9))
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .buttonStyle(ScaledButtonStyle())
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .background(.white)

    }
    
    @ViewBuilder
    func ButtonFactory(image: String) -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: image)
                .resizable()
                .frame(width: 30, height: 30)
        })
        .foregroundStyle(.black)
    }
    
    func initData() {
        
    }
}

#Preview {
    TodayPage()
}
