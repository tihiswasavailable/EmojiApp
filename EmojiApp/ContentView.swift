//
//  ContentView.swift
//  EmojiApp
//
//  Created by Stefan Jovic on 05.06.24.
//

import SwiftUI
import MapKit

enum Emoji: String, CaseIterable {
    case 🐭, 🐱, 🐶, 🙉
}

struct ContentView: View {
    @StateObject private var viewModel = EmojiViewModel()
    @State private var isDrawerOpen = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Text(viewModel.selection.rawValue)
                        .font(.system(size: 150))
                    
                    Picker(NSLocalizedString("Select Emoji", comment: ""), selection: $viewModel.selection){
                        ForEach(Emoji.allCases, id:\.self){emoji in
                            Text(emoji.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: viewModel.selection){
                        newSelection in
                        withAnimation{
                            viewModel.saveSelectedEmoji(newSelection)
                        }
                    }
                    Spacer()
                }
                .navigationTitle(NSLocalizedString("Emoji Lovers!", comment: ""))
                .padding()
                
                HStack{
                    if isDrawerOpen {
                        DrawerView()
                            .frame(width: 250)
                            .transition(.move(edge: .leading))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            isDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: isDrawerOpen ? "xmark" : "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}
    
                
#Preview {
    ContentView()
}

