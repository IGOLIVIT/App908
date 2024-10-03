//
//  AddMood.swift
//  App908
//
//  Created by IGOR on 03/10/2024.
//

import SwiftUI

struct AddMood: View {
    
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
                            
                            viewModel.moDay = viewModel.curSmile
                            viewModel.moEmo = viewModel.curEmotion
                            viewModel.moWeather = viewModel.curWeather
                            
                            viewModel.addMood()
                            
                            viewModel.curSmile = ""
                            viewModel.curEmotion = ""
                            viewModel.curWeather = ""
                            
                            viewModel.moTNumber = ""
                            viewModel.moDescr = ""
                            
                            viewModel.fetchMoods()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Done")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.moTNumber.isEmpty || viewModel.curSmile.isEmpty || viewModel.curEmotion.isEmpty || viewModel.curWeather.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.moTNumber.isEmpty || viewModel.curSmile.isEmpty || viewModel.curEmotion.isEmpty || viewModel.curWeather.isEmpty ?  true : false)
                    }
                    
                    Text("Create card")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text("Trip number")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.moTNumber.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.moTNumber)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom, 9)
                        
                        Text("How was your day")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 16) {
                            
                            HStack {
                                
                                ForEach(viewModel.smiles, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curSmile = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.horizontal, 8)
                                            .opacity(viewModel.curSmile == index ? 1 : 0.5)
                                        
                                    })
                                    
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        .padding(.bottom, 9)
                        
                        Text("Emotions")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.emotions, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curEmotion = index
                                    
                                }, label: {
                                    
                                    VStack(spacing: 6) {
                                        
                                        Image(index)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.horizontal, 8)
                                            .opacity(viewModel.curEmotion == index ? 1 : 0.5)
                                        
                                        Text(index)
                                            .foregroundColor(.white.opacity(0.6))
                                            .font(.system(size: 11, weight: .regular))
                                    }
                                    
                                })
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        .padding(.bottom, 9)
                        
                        Text("Weather")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 16) {
                            
                            HStack {
                                
                                ForEach(viewModel.weathers, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curWeather = index
                                        
                                    }, label: {
                                        
                                        VStack(spacing: 6) {
                                            
                                            Image(index)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(.horizontal, 8)
                                                .opacity(viewModel.curWeather == index ? 1 : 0.5)
                                            
                                            Text(index)
                                                .foregroundColor(.white.opacity(0.6))
                                                .font(.system(size: 11, weight: .regular))
                                        }
                                    })
                                    
                                }
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        .padding(.bottom, 9)
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.moDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.moDescr)
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
    AddMood(viewModel: MoodViewModel())
}
