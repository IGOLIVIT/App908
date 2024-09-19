//
//  AddCategory.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct AddCategory: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                
            }
            .padding()
        }
    }
}

#Preview {
    AddCategory(viewModel: HomeViewModel())
}
