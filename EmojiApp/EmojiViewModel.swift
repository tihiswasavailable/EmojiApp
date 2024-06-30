//
//  EmojiViewModel.swift
//  EmojiApp
//
//  Created by Stefan Jovic on 10.06.24.
//

import Foundation
import SwiftUI

class EmojiViewModel: ObservableObject{
    @Published var selection: Emoji
    
    init(){
        self.selection = EmojiViewModel.loadSavedEmoji()
    }
    
    func saveSelectedEmoji(_ emoji: Emoji){
        UserDefaults.standard.setValue(emoji.rawValue, forKey: "selectedEmoji")
    }
    
    static func loadSavedEmoji()->Emoji{
        if let savedEmoji = UserDefaults.standard.string(forKey: "selectedEmoji"),
           let emoji = Emoji(rawValue: savedEmoji) {
            return emoji
        }
        return .🙉
    }
}
