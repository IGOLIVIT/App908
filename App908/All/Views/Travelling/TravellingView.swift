//
//  TravellingView.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct TravellingView: View {
    
    @StateObject var viewModel = TravellingViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Travelling")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                 
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 18, weight: .medium))
                    })
                    
                }
                .padding(.bottom, 30)
                
                if viewModel.travellings.isEmpty {
                    
                    VStack {
                        
                        Text("You don't have any trips")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Add a trip to your bucket list to keep things on track")
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
                            
                            ForEach(viewModel.travellings, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 14) {
                                    
                                    HStack {
                                    
                                        HStack {
                                            
                                            Image(systemName: "calendar")
                                                .foregroundColor(Color("prim2"))
                                                .font(.system(size: 11, weight: .regular))
                                            
                                            Text("\((index.trDep ?? Date()).convertDate(format: "dd.MM.yyyy"))-\((index.trArrival ?? Date()).convertDate(format: "dd.MM.yyyy"))")
                                                .foregroundColor(Color.gray)
                                                .font(.system(size: 12, weight: .medium))
                                            
                                        }
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(.white.opacity(0.05)))
                                        
                                        Spacer()
                                        
                                        Menu(content: {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedTrav = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                HStack {
                                                    
                                                    Text("Delete")
                                                        .foregroundColor(.red)
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "trash")
                                                        .foregroundColor(.red)
                                                    
                                                }
                                            })
                                            
                                        }, label: {
                                            
                                            Image("nokta")
                                        })
                                    }
                                    
                                    Text("Trip \(index.trName ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Text("\(index.trCity ?? ""), \(index.trCountry ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    HStack {
                                        
                                        Text(index.trTrans ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(.horizontal, 5)
                                            .frame(height: 20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                        
                                        Text(index.trPlace ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(.horizontal, 5)
                                            .frame(height: 20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                        
                                        Text(index.trHoliday ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(.horizontal, 5)
                                            .frame(height: 20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))

                                        Spacer()
                                        
                                    }
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedTrav = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Go to tasks >")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        })
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                            }
                        }
                    }
                    
                }
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchTravs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTravel(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            TravelDetail(viewModel: viewModel)
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
                    
                    Button(action: {
            
                        CoreDataStack.shared.deleteTravel(withTrName: viewModel.selectedTrav?.trName ?? "", completion: {
                            
                            viewModel.fetchTravs()
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
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
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
    TravellingView()
}
