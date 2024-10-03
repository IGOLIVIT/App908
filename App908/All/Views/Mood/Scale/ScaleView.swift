//
//  ScaleView.swift
//  App908
//
//  Created by IGOR on 03/10/2024.
//

import SwiftUI

struct ScaleView: View {

    @StateObject var viewModel: MoodViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.perfectly = viewModel.addPerf
                            viewModel.good = viewModel.addGood
                            viewModel.normally = viewModel.addNorm
                            viewModel.badly = viewModel.addBadly
                            viewModel.bad = viewModel.addBad

                            
                            withAnimation(.spring()) {
                                
                                viewModel.isScale = false
                            }
                            
                        }, label: {
                            
                            Text("Done")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                    }
                    
                    Text("Edit statistic")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Perfectly")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("100%")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addPerf.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addPerf)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Good")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("100%")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addGood.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addGood)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Normally")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("100%")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addNorm.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addNorm)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Badly")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("100%")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addBadly.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addBadly)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("That's too bad")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("100%")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addBad.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addBad)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScaleView(viewModel: MoodViewModel())
}
