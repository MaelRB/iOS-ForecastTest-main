//
//  DetailView.swift
//  App
//
//

import SwiftUI
import GlobalUI

struct DetailView: View {
    
    let forecastItem: ForecastItem
    
    var body: some View {
        ZStack {
            Color(GlobalColor.backgroundColor!)
                .ignoresSafeArea()
            
            content
                .foregroundColor(.white)
                .padding(.top, 20)
        }
    }
    
    var content: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(forecastItem.imageName)
                .renderingMode(.template)
            
            HStack(spacing: 10) {
                Text("H: \(forecastItem.high)°")
                    .bold()
                Text("L: \(forecastItem.low)°")
                    .bold()
            }
            .padding(.bottom, 20)
            
            
            HStack(spacing: 15) {
                
                Container(content: {
                    Text("\(forecastItem.sunrise)")
                        .font(.system(size: 22, weight: .bold))
                }, title: "Sunrise", imageName: "sunrise")
                
                Container(content: {
                    Text("\(forecastItem.sunset)")
                        .font(.system(size: 22, weight: .bold))
                }, title: "Sunset", imageName: "sunset")
            }
            
            Container(content: {
                Text("\(forecastItem.chanceRain * 100, specifier: "%.0f")%")
                    .font(.system(size: 22, weight: .bold))
            }, title: "Chance of rain", imageName: "cloud.rain")
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(forecastItem: .mock)
    }
}

struct Container<Content: View>: View {
    
    let content: Content
    var title: String
    var imageName: String
    
    init(@ViewBuilder content: () -> Content, title: String, imageName: String) {
        self.content = content()
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Label {
                Text(title)
            } icon: {
                Image(systemName: imageName)
            }
            .font(.system(size: 15, weight: .semibold, design: .rounded))
            
            content
        }
        .padding(15)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(uiColor: GlobalColor.secondaryBackgroundColor!)))
    }
}
