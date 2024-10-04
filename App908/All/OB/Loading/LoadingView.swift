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
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("nlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 290)
            }
            
            VStack {
                
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
