//
//  SettingsView.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 30)
                
                VStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Rate our app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding()
                                
                                Spacer()
                                
                            }
                            
                            Spacer()
                            
                            Image("Heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/bf1ee120-afe2-44ca-abe1-8dd8b8de19be") else { return }
                        
                    }, label: {
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding()
                                
                                Spacer()
                                
                            }
                            
                            Spacer()
                            
                            Image("Doc")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                    })
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
