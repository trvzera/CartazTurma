//
//  ContentView.swift
//  cartazTurma
//
//  Created by COTEMIG on 03/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var nome = ""
    @State private var recado = ""
    @State private var mensagemNome = "Use nome e sobrenome, sem números"
    @State private var mensagemRecado = ""
    @State private var publicado = false
    @State private var publicacoes = 0
    @State private var fechamentos = 0
    
    func verificaNome(_ nome: String) {
        let partes = nome.split(separator: " ").filter { !$0.isEmpty }
        if partes.count >= 2 && nome.contains(where: { "0"..."9" ~= $0 }) == false {
            mensagemNome = ""
        } else {
            mensagemNome = "Use nome e sobrenome, sem números"
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Publicados: \(publicacoes)")
                Spacer()
                Text("Fechamentos: \(fechamentos)")
            }
            .padding(30)
            SeloView()
                .padding(15)
            FigurinhaView()
            TextField("Seu Nome", text: $nome)
                .onChange(of: nome) { oldValue, newValue in
                    verificaNome(newValue)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(mensagemNome)
                .font(Font.subheadline)
                .foregroundStyle(Color.gray)
                .padding(.bottom, 10)
            TextField("Recado", text: $recado)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(mensagemRecado)
                .font(Font.subheadline)
                .foregroundStyle(Color.gray)
                .padding(.bottom, 10)
        }
        .padding(30)
        
    }
}

#Preview {
    ContentView()
}
