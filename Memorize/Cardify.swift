//
//  Cardify.swift
//  Memorize
//
//  Created by neo on 2020/7/2.
//  Copyright © 2020 Next-Skip. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation :Double
    init(isFaceUp:Bool) {
        rotation = isFaceUp ? 0: 180
    }
    
    var animatableData: Double {
        get{
            return rotation
        }
        set{
            rotation=newValue
        }
    }
    
    
    var isFaceUp :Bool{
        rotation < 90
    }
    func body(content: Content) -> some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1:0)
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? 0:1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    private let cornerRadius:CGFloat = 10.0
    private let edgeLineWidth:CGFloat = 3
}
extension View {
    func cardify(isFaceUp:Bool) -> some View {
        self.modifier(Cardify(isFaceUp:isFaceUp))
    }
}

