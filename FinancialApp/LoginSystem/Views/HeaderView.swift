//
//  HeaderView.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.green)
                VStack {
                    Text("Financial App")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .bold()
                    Text("Stay Organized and track your finances!")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(y: -100)
        }
    }
}

#Preview {
    HeaderView()
}
