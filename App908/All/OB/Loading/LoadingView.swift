//
//  LoadingView.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 190)
                
                Spacer()
                
                ProgressView()
                    
            }
            .padding(.vertical, 130)
        }
    }
}

#Preview {
    LoadingView()
}
