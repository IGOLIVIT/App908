//
//  AddTask.swift
//  App908
//
//  Created by IGOR on 16/09/2024.
//

import SwiftUI

struct AddTask: View {

    @StateObject var viewModel: TravellingViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddTask = false
                    }
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                })
                .padding(7)
                .background(Circle().fill(.white.opacity(0.1)))
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Create task")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Text("Task name")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.taskName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.taskName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)

                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.taskDate, displayedComponents: .date)
                                .labelsHidden()

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.taskTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Period")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.periods, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curPeriod = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                Text(viewModel.curPeriod)
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(6)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.05)))
                            })

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Task type")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.taskTypes, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curTaskType = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                Text(viewModel.curTaskType)
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(6)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.05)))
                            })

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.taskDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.taskDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.taskType = viewModel.curTaskType
                            viewModel.taskTimeType = viewModel.curPeriod
                            
                            viewModel.addTaskss()
                            
                            viewModel.taskName = ""
                            viewModel.taskDescr = ""
                            
                            viewModel.fetchTaskss()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTask = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        .opacity(viewModel.taskName.isEmpty || viewModel.curPeriod.isEmpty || viewModel.curTaskType.isEmpty || viewModel.taskDescr.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.taskName.isEmpty || viewModel.curPeriod.isEmpty || viewModel.curTaskType.isEmpty || viewModel.taskDescr.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTask(viewModel: TravellingViewModel())
}
