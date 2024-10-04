//
//  R2.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                VStack(spacing: 12) {
                    
                    Text("TAKE CONTROL OF YOUR HOLIDAY PLAN")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Create leave cards and track their task completion")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(Color("prim3"))
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
                .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim3")))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    R2()
}
