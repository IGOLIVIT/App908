//
//  MoodView.swift
//  App908
//
//  Created by IGOR on 03/10/2024.
//

import SwiftUI

struct MoodView: View {

    @StateObject var viewModel = MoodViewModel()
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
                        
                    }
                    
                    Text("Mood diary")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                }
                .padding(.bottom, 30)
                
                VStack(spacing: 16) {
                    
                    HStack {
                        
                        Text("Mood scale")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isScale = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 17, weight: .regular))
                        })
                    }
                    
                    HStack {
                        
                        ForEach(viewModel.smiles, id: \.self) { index in
                            
                            Image(index)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 8)
                            
                        }
                    }
                    
                    HStack {
                        
                        Text("\(viewModel.perfectly)")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))
                            .frame(maxWidth: .infinity)
                        
                        Text("\(viewModel.good)")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))
                            .frame(maxWidth: .infinity)
                        
                        Text("\(viewModel.normally)")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))
                            .frame(maxWidth: .infinity)
                        
                        Text("\(viewModel.badly)")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))
                            .frame(maxWidth: .infinity)
                        
                        Text("\(viewModel.bad)")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                
                HStack {
                    
                    Text("Your emotions")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 17, weight: .medium))
                    })
                }
                .padding(.vertical)
                
                if viewModel.moods.isEmpty {
                    
                    VStack {
                        
                        Text("You don't have any emotion card")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Create an emotion card for your trip")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 7)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .padding(9)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    
                    Spacer()
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.moods, id: \.self) { index in
                            
                            VStack {
                                
                                Button(action: {
                                    
                                    viewModel.selectedMood = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(Color.white.opacity(0.3))
                                        .font(.system(size: 16, weight: .regular))
                                })
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                
                                HStack {
                                    
                                    VStack {
                                        
                                        Image(index.moDay ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                        
                                        VStack {
                                            
                                            Text("Trip")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("№ \(index.moTNumber ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))
                                        
                                        Spacer()
                                    }
                                    
                                    Rectangle()
                                        .fill(Color.white.opacity(0.1))
                                        .frame(maxHeight: .infinity)
                                        .frame(width: 2)
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        HStack {
                                            
                                            Image(index.moEmo ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 45)
                                            
                                            Image(index.moWeather ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 45)
                                        }
                                        
                                        Text(index.moDescr ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 160)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                            }
                        }
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchMoods()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddMood(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isScale, content: {
            
            ScaleView(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteMood(withMoTNumber: viewModel.selectedMood?.moTNumber ?? "", completion: {
                            
                            viewModel.fetchMoods()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    MoodView()
}
