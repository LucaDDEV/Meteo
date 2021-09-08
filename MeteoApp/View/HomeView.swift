//
//  HomeView.swift
//  MeteoApp
//
//  Created by Luc on 30/08/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = MeteoViewModel()
    @State var statoApp: StatoApp = .cittaImpostata
    @State var citta = ""
    var body: some View {
        ZStack(alignment: .topTrailing) {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3418391347, green: 0.6088328958, blue: 0.9702715278, alpha: 1)), Color(#colorLiteral(red: 0.3367980719, green: 0.4281384945, blue: 0.9512441754, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                statoApp = .cittaDaImpostare
            }) {
                Text("Cambia Città")
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.white)
            }
            .opacity(statoApp == .cittaImpostata ? 1 : 0)
            
            VStack{
                switch statoApp {
                case .cittaImpostata:
                    CittaImpostataView(viewModel: viewModel)
                case .cittaDaImpostare:
                    InserisciCittaView(viewModel: viewModel, citta: $citta, statoApp: $statoApp)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
