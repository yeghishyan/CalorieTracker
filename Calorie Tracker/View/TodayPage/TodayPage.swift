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
    
    @Environment(\.modelContext) var modelContext
    @Query var dietItems: [DietItem]
    
    var body: some View {
        ZStack {
            Color(hex: "#F2F6F8")
    
            if let data = dietItems.first {
                ScrollView(.vertical) {
                    VStack(spacing: 40) {
                        HeaderView()
                        
                        HStack(alignment: .center, spacing: 10) {
                            CircleChartView(items: data.nutrients)
                            Spacer()
                            VerticalChartView(items: data.nutrients)
                        }
                        .padding(.horizontal, 30)
                        
                        VStack(spacing: 10) {
                            DietInfoView(data: data)
                            
                            AddItemSection()
                        }
                    }
                    .padding(.top, 60)
                }
            }
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
    func DietInfoView(data: DietItem) -> some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text(data.name)
                    .bold()
                Text(data.desc)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 12)
            .font(.system(size: 15))
            .padding(.top, 10)
            
            HorizontalCircleChartView(items: data.nutrients)
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
        if dietItems.isEmpty {
            let salmonNutrients: [ChartItem] = [
                ChartItem(
                    name: "Calories",
                    currentValue: 389, todayValue: 500,
                    bgColor: "F3DEE8", progressColor: "F30F57"
                ),
                ChartItem(
                    name: "Protein",
                    currentValue: 41, todayValue: 500,
                    bgColor: "E0F1E1", progressColor: "57E328"
                ),
                ChartItem(
                    name: "Carbs",
                    currentValue: 7.8, todayValue: 500,
                    bgColor: "E4EBF7", progressColor: "6186E5"
                ),
                ChartItem(
                    name: "Fat",
                    currentValue: 21, todayValue: 500,
                    bgColor: "F3F3E0", progressColor: "F0D101"
                )
            ]
            
            let salmonSalad: DietItem = DietItem(
                name: "Salmon salad",
                desc: "Atkins 20, Atkins 40, Atkins 100, Atkins Friendly, Low Carb, Carb Friendly, Ketogenic Diet",
                nutrients: salmonNutrients
            )
            
            modelContext.insert(salmonSalad)
        }
    }
}

#Preview {
    TodayPage()
}
