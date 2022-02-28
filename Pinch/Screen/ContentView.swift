//
//  ContentView.swift
//  Pinch
//
//  Created by Macintosh on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties

    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1

    //MARK: - Functions

    //MARK: - Content
    var body: some View {
        NavigationView{
            ZStack{
                //MARK: - Page Image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    //.animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                //MARK: - 1. Tap Gesture(Double Tap Gesture)
                    .onTapGesture(count: 2, perform:{
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        }else{
                            withAnimation(.spring()){
                                imageScale = 1
                            }
                        }
                    })
               
            }//:ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                }
            })
        }//NavigationView
        .navigationViewStyle(.stack) // this will avoid using sidebar on ipad devices
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
