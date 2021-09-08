//
//  InserisciCittaView.swift
//  MeteoApp
//
//  Created by Luc on 30/08/21.
//

import SwiftUI

struct InserisciCittaView: View {
    @ObservedObject var viewModel: MeteoViewModel
    @Binding var citta: String
    @Binding var statoApp: StatoApp
    
    var body: some View {
        VStack {
            Spacer()
            TextField("", text: $citta, onCommit: {
                viewModel.title = citta
                viewModel.fetchWeather()
                statoApp = .cittaImpostata
            })
            .placeholder(when: citta.isEmpty){
                Text("Inserisci Citta..").foregroundColor(.white).opacity(0.4)
            }
            .padding(.bottom, 25)
            .font(.system(size: 40, weight: .black, design: .default))
            .foregroundColor(.white)
            .disableAutocorrection(true)
            .underlineTextField()
            Spacer()
        }
    }
}


struct InserisciCittaView_Previews: PreviewProvider {
    static var previews: some View {
        InserisciCittaView(viewModel: MeteoViewModel(), citta: .constant(""), statoApp: .constant(.cittaDaImpostare))
    }
}
