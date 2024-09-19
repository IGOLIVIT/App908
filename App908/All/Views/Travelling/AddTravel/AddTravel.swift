//
//  AddTravel.swift
//  App908
//
//  Created by IGOR on 16/09/2024.
//

import SwiftUI

struct AddTravel: View {
    
    @StateObject var viewModel: TravellingViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                })
                .padding(7)
                .background(Circle().fill(.white.opacity(0.1)))
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Create trip")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Text("Contry")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.trCountry.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.trCountry)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("City")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.trCity.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.trCity)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Transport")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.transports, id: \.self) { index in
                                
                  
                                    
                                    Button(action: {
                                        
                                        viewModel.curTrans = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(viewModel.curTrans == index ? 1 : 0.1)))
                                    })
                                }
                            
                        })
                        .padding(.bottom, 7)
                        
                        Text("Place of residence")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            ForEach(viewModel.places, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curPlace = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 20)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(viewModel.curPlace == index ? 1 : 0.1)))
                                })
                            }
                        })
                        .padding(.bottom, 7)
                        
                        Text("Type of holiday")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            ForEach(viewModel.holidays, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curHoliday = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 20)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(viewModel.curHoliday == index ? 1 : 0.1)))
                                })
                            }
                        })
                        .padding(.bottom, 7)
                        
                        HStack {
                            
                            Text("Date of departure")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.trDep, displayedComponents: .date)
                                .labelsHidden()

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Arrival date")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.trArrival, displayedComponents: .date)
                                .labelsHidden()

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.tickets += 1
                            
                            viewModel.trName = String(viewModel.tickets)
                            
                            viewModel.trTrans = viewModel.curTrans
                            viewModel.trHoliday = viewModel.curHoliday
                            viewModel.trPlace = viewModel.curPlace
                            
                            viewModel.addTrav()
                            
                            viewModel.curPlace = ""
                            viewModel.curTrans = ""
                            viewModel.curHoliday = ""
                            viewModel.trCountry = ""
                            viewModel.trCity = ""
                            
                            viewModel.fetchTravs()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        .opacity(viewModel.trCountry.isEmpty || viewModel.trCity.isEmpty || viewModel.curTrans.isEmpty || viewModel.curPlace.isEmpty || viewModel.curHoliday.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.trCountry.isEmpty || viewModel.trCity.isEmpty || viewModel.curTrans.isEmpty || viewModel.curPlace.isEmpty || viewModel.curHoliday.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTravel(viewModel: TravellingViewModel())
}
