//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by neo on 2020/6/25.
//  Copyright © 2020 Next-Skip. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
     @ObservedObject var viewModel :EmojiMemoryGame
    
    var body: some View {
        VStack{
            Grid(viewModel.cards){
                card in CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration:1)){
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut(duration:1)){
                    self.viewModel.resetGame()
                }
            }, label:{ Text("New Game !")})
        }
    }
}

struct CardView:View{
    var card:MemoryGame<String>.Card
    var body:some View{
        GeometryReader {
            geometry in
            self.body(for:geometry.size)
        }
    }
    @ViewBuilder
    private func body(for size:CGSize)->some View{
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusTimeRemaining*360-90),clockWise: true).padding(5).opacity(0.5)
                Text(card.content).font(Font.system(size:fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }.cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
                
        }
    }
    private let cornerRadius:CGFloat=10.0
    private let edgeLineWidth:CGFloat=3
//    let fontScaleFactor:CGFloat=0.75
    
    private func fontSize(for size:CGSize) -> CGFloat {
        min(size.width, size.height*0.7)
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel:EmojiMemoryGame())
    }
}
