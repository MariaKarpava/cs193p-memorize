//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maryia Karpava on 02/03/2023.
//
import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private var theme: Theme
    
    static var themes: Array<Theme> = [
        Theme(name: "Animals", colour: "green", emojis: ["πΆ", "π­", "π¦", "π»", "πΌ", "πΈ", "π΅", "π₯", "π¦", "π°", "π·", "π΄", "π¦", "π±", "πΉ", "π»ββοΈ", "π¨", "π€", "π¦", "π", "π¦", "πΊ"], numberOfPairsOfCardsToShow: 13),
        Theme(name: "Vehicles", colour: "red", emojis: ["βοΈ", "π", "π", "π", "π", "π", "π³οΈ", "π²", "π΄"], numberOfPairsOfCardsToShow: 9),
        Theme(name: "House", colour: "blue", emojis: ["π", "ποΈ", "π", "πͺ", "π§Έ", "πΌοΈ", "πͺ", "π½", "ποΈ"], numberOfPairsOfCardsToShow: 9),
        Theme(name: "Body", colour: "yellow", emojis: ["π¦Άπ»", "π¦΅", "π¦·", "π", "π", "π", "π", "ποΈ", "π«"], numberOfPairsOfCardsToShow: 9),
        Theme(name: "Clothes", colour: "brown", emojis: ["π", "π", "π", "π©±", "π", "π ", "π₯Ύ", "π", "π"], numberOfPairsOfCardsToShow: 9),
        Theme(name: "Fruits", colour: "orange", emojis: ["π", "π", "π", "π", "π", "π", "π", "π", "π«"], numberOfPairsOfCardsToShow: 9)
    ]
    
    var themeName: String {
        theme.name
    }
    
    @Published private var model: MemoryGame<String>

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCardsToShow, createCardContent: { pairIndex in
            return theme.emojis[pairIndex]
        })
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
//        objectWillChange.send()
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}



struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
