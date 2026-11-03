//
//  SeloView.swift
//  cartazTurma
//
//  Created by COTEMIG on 03/11/26.
//

import SwiftUI

struct SeloView: View {
    @State private var escala: CGFloat = 1
    private var cores: [Color] = [.blue, .red, .yellow, .green, .pink, .purple, .orange]
    @State var corAtual: Int = 0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 120, height: 120)
            .foregroundStyle(cores[corAtual])
            .scaleEffect(escala)
            .animation(.easeInOut, value: escala)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    corAtual = Int.random(in: 0..<cores.count)
                }
            }
            .onLongPressGesture(perform:escala == 1 ? { self.escala = 1.3 } : { self.escala = 1 })
    }
    
    
}

