//
//  TravelDetail.swift
//  App908
//
//  Created by IGOR on 16/09/2024.
//

import SwiftUI

struct TravelDetail: View {
    
    @StateObject var viewModel: TravellingViewModel
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
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTask = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                    }
                 
                    Text("Trip \(viewModel.selectedTrav?.trName ?? "")")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack {
                        
                        Text("Medicine")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(viewModel.taskss.filter{($0.taskType ?? "") == "Medicine"}, id: \.self) { index in
                            
                            HStack {
                                
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(Color("prim2"))
                                    .frame(maxHeight: .infinity)
                                    .frame(width: 3)
                                
                                VStack(alignment: .leading, spacing: 14) {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 3) {
                                            
                                            Text(index.taskName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Text(index.taskName ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        Menu(content: {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedTaskss = index
                                                
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
                                    
                                    HStack {
                                        
                                        Image(systemName: "clock")
                                            .foregroundColor(Color("prim2"))
                                        
                                        Text("\((index.taskDate ?? Date()).convertDate(format: "dd MMMM yyyy")), \((index.taskTime ?? Date()).convertDate(format: "HH:MM"))")
                                            .foregroundColor(Color.gray)
                                            .font(.system(size: 12, weight: .medium))
                                    }
                                    
                                }
                                
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                    }
                        .opacity(viewModel.taskss.filter{($0.taskType ?? "") == "Medicine"}.isEmpty ? 0 : 1)
                        
                        VStack {
                            
                            Text("Transport")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.taskss.filter{($0.taskType ?? "") == "Transport"}, id: \.self) { index in
                                
                                HStack {
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color("prim2"))
                                        .frame(maxHeight: .infinity)
                                        .frame(width: 3)
                                    
                                    VStack(alignment: .leading, spacing: 14) {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                
                                                Text(index.taskName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                                
                                                Text(index.taskDescr ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedTaskss = index
                                                    
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
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                                .foregroundColor(Color("prim2"))
                                            
                                            Text("\((index.taskDate ?? Date()).convertDate(format: "dd MMMM yyyy")), \((index.taskTime ?? Date()).convertDate(format: "HH:MM"))")
                                                .foregroundColor(Color.gray)
                                                .font(.system(size: 12, weight: .medium))
                                        }
                                        
                                    }
                                    
                                }
                                .padding(5)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        }
                        .opacity(viewModel.taskss.filter{($0.taskType ?? "") == "Transport"}.isEmpty ? 0 : 1)

                        VStack {
                            
                            Text("Place of residence")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.taskss.filter{($0.taskType ?? "") == "Place of residence"}, id: \.self) { index in
                                
                                HStack {
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color("prim2"))
                                        .frame(maxHeight: .infinity)
                                        .frame(width: 3)
                                    
                                    VStack(alignment: .leading, spacing: 14) {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                
                                                Text(index.taskName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                                
                                                Text(index.taskDescr ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedTaskss = index
                                                    
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
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                                .foregroundColor(Color("prim2"))
                                            
                                            Text("\((index.taskDate ?? Date()).convertDate(format: "dd MMMM yyyy")), \((index.taskTime ?? Date()).convertDate(format: "HH:MM"))")
                                                .foregroundColor(Color.gray)
                                                .font(.system(size: 12, weight: .medium))
                                        }
                                        
                                    }
                                    
                                }
                                .padding(5)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        }
                        .opacity(viewModel.taskss.filter{($0.taskType ?? "") == "Place of residence"}.isEmpty ? 0 : 1)

                        VStack {
                            
                            Text("Entertaiment")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.taskss.filter{($0.taskType ?? "") == "Entertaiment"}, id: \.self) { index in
                                
                                HStack {
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color("prim2"))
                                        .frame(maxHeight: .infinity)
                                        .frame(width: 3)
                                    
                                    VStack(alignment: .leading, spacing: 14) {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                
                                                Text(index.taskName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                                
                                                Text(index.taskDescr ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedTaskss = index
                                                    
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
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                                .foregroundColor(Color("prim2"))
                                            
                                            Text("\((index.taskDate ?? Date()).convertDate(format: "dd MMMM yyyy")), \((index.taskTime ?? Date()).convertDate(format: "HH:MM"))")
                                                .foregroundColor(Color.gray)
                                                .font(.system(size: 12, weight: .medium))
                                        }
                                        
                                    }
                                    
                                }
                                .padding(5)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        }
                        .opacity(viewModel.taskss.filter{($0.taskType ?? "") == "Entertaiment"}.isEmpty ? 0 : 1)

                        VStack {
                            
                            Text("Other")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.taskss.filter{($0.taskType ?? "") == "Other"}, id: \.self) { index in
                                
                                HStack {
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color("prim2"))
                                        .frame(maxHeight: .infinity)
                                        .frame(width: 3)
                                    
                                    VStack(alignment: .leading, spacing: 14) {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                
                                                Text(index.taskName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                                
                                                Text(index.taskDescr ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedTaskss = index
                                                    
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
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                                .foregroundColor(Color("prim2"))
                                            
                                            Text("\((index.taskDate ?? Date()).convertDate(format: "dd MMMM yyyy")), \((index.taskTime ?? Date()).convertDate(format: "HH:MM"))")
                                                .foregroundColor(Color.gray)
                                                .font(.system(size: 12, weight: .medium))
                                        }
                                        
                                    }
                                    
                                }
                                .padding(5)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        }
                        .opacity(viewModel.taskss.filter{($0.taskType ?? "") == "Other"}.isEmpty ? 0 : 1)

                    }
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddTask, content: {
            
            AddTask(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchTaskss()
        }
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
            
                        CoreDataStack.shared.deleteTask(withTaskName: viewModel.selectedTaskss?.taskName ?? "", completion: {
                            
                            viewModel.fetchTaskss()
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
    TravelDetail(viewModel: TravellingViewModel())
}
