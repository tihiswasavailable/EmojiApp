//
//  DrawerView.swift
//  EmojiApp
//
//  Created by Stefan Jovic on 10.06.24.
//

import SwiftUI

struct DrawerView: View {
    @State private var isSelected = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                isSelected.toggle()
            }) {
                NavigationLink(destination: EmojiLoversMapView()) {
                    Text(NSLocalizedString("Find more Emoji Lovers", comment: ""))
                        .font(.headline)
                        .foregroundColor(isSelected ? .blue : .black)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray)
        .cornerRadius(10)
    }
}
