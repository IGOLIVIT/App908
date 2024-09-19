//
//  R1.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                                
                VStack(spacing: 12) {
                    
                    Text("PROGRESS BAR")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("Plan your perfect holiday and conveniently!")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    })
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                .ignoresSafeArea()
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    R1()
}
