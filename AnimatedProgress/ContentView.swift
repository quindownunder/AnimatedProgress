//
//  ContentView.swift
//  AnimatedProgress
//
//  Created by Matthew Richardson on 29/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    @State private var value: CGFloat = 180
     
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray3), lineWidth: 20)
                    .frame(width: 250, height: 250)
                
                ForEach(0 ..< 20) { opac in
                    Circle()
                        .trim(from: (isLoading ? 1.0 : 0.0) - CGFloat(Float(opac) / 100.0), to: ((isLoading ? 1.0 : 0.0) + 0.01) - CGFloat(Float(opac) / 100.0))
                        .stroke(Color((opac % 2) == 0 ? .blue : .clear), lineWidth: 20)
                        .frame(width: 250, height: 250)
                        .opacity(Double(20 - opac) / 20.0)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
                 }
                
                ForEach(0 ..< 100) { inc in
                    if((inc % 2) == 0) {
                        Circle()
                            .trim(from: CGFloat(Float(inc) / 100.0), to: CGFloat((Float(inc) / 100.0)) + 0.01)
                            .stroke(Color(.white), lineWidth: 20)
                            .frame(width: 250, height: 250)

                    }
                }
            }
            .padding(20)
                        
            ZStack {
                ForEach(0 ..< 20) { opac in
                    Circle()
                        .trim(from: (isLoading ? 1.0 : 0.0) - CGFloat(Float(opac) / 100.0), to: ((isLoading ? 1.0 : 0.0) + 0.01) - CGFloat(Float(opac) / 100.0))
                        .stroke(Color((opac % 2) == 0 ? .blue : .clear), lineWidth: 20)
                        .frame(width: 250, height: 250)
                        .opacity(Double(20 - opac) / 20.0)
                        .rotationEffect(Angle(degrees: Double(value)))
//                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
//                        .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
                 }
            }
            .padding(20)
            Slider(value: $value, in: 0...1440, step: 1)
        }
        .onAppear() {
            isLoading = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
