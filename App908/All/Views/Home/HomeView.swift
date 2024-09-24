//
//  HomeView.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistic")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isData = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .padding(9)
                                .background(Circle().fill(Color.white.opacity(0.1)))
                        })
                    }
                    
                    ZStack {
                        
                        VStack {
                            
                            Text("\(viewModel.ta)")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 36, weight: .bold))

                                Text("out of \(viewModel.tt)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                        }
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(viewModel.calculatePercentage() / 100))
                            .stroke(Color("prim"), lineWidth: 34)
                            .frame(width: 180, height: 180)
                            .rotationEffect(.degrees(-90))
                        
                        Circle()
                            .stroke(Color.white.opacity(0.1), lineWidth: 34)
                            .frame(width: 180, height: 180)

                    }
                    .padding(.bottom)
                    
                    HStack {
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 25)
                        
                        Text(" - Tasks accomplished")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 25)
                        
                        Text(" - Total tasks")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                
                HStack {
                    
                    Text("Categories")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("+")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 26, weight: .regular))
                    })
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.categories.isEmpty {
                        
                        VStack {
                            
                            Text("You don't have categories")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Add categories of your tasks add track your progress")
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
                        .padding()
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.categories, id: \.self) { index in
                                    
                                    VStack(spacing: 15) {
                                        
                                        HStack {
                                            
                                            Text(index.catName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedCategory = index
                                                    
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
                                            
                                            ZStack {
                                                
                                                Circle()
                                                    .trim(from: 0, to: CGFloat(Double(index.catTA) / Double(index.catTT)))
                                                    .stroke(Color("prim2"), lineWidth: 9)
                                                    .frame(width: 50, height: 50)
                                                    .rotationEffect(.degrees(-90))
                                                
                                                Circle()
                                                    .stroke(Color.white.opacity(0.1), lineWidth: 6)
                                                    .frame(width: 50, height: 50)
                                                
                                            }
                                            .padding(.trailing, 9)
                                            
                                            Text("\(index.catTA)")
                                                .foregroundColor(Color("prim2"))
                                                .font(.system(size: 24, weight: .semibold))
                                            
                                            Text("out of \(index.catTT) tasks completed")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Spacer()
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isData ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isData = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isData = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Data modification")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    Text("Tasks accomplished")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addTA.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addTA)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)
                    
                    Text("Total tasks")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addTT.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addTT)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)

                        Button(action: {
                            
                            viewModel.tt = Int(viewModel.addTT) ?? 1
                            viewModel.ta = Int(viewModel.addTA) ?? 0
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isData = false
                            }
                            
                        }, label: {
                            
                            Text("Edit")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            
                        })
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isData ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Create category")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    Text("Category name")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.catName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.catName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)
                    
                    Text("Tasks accomplished")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.catTA.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.catTA)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)
                    
                    Text("Total tasks")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.catTT.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.catTT)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)

                        Button(action: {
                            
                            viewModel.addCategory()
                            
                            viewModel.catName = ""
                            viewModel.catTA = ""
                            viewModel.catTT = ""
                            
                            viewModel.fetchCategories()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Edit")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            
                        })
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchCategories()
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
            
                        CoreDataStack.shared.deleteCategory(withCatName: viewModel.selectedCategory?.catName ?? "", completion: {
                            
                            viewModel.fetchCategories()
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
    HomeView()
}
