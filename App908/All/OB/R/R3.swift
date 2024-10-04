//
//  R3.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                VStack(spacing: 12) {
                    
                    Text("TASKS AND REMINDERS")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Create and track task lists with incredible ease = from picking your destination to packing your suitcases")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    R3()
}
