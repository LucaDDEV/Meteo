//
//  CittaImpostataView.swift
//  MeteoApp
//
//  Created by Luc on 30/08/21.
//

import SwiftUI

struct CittaImpostataView: View {
    @ObservedObject var viewModel: MeteoViewModel
    var body: some View {
        VStack{
            Spacer()
            // CityBox
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .foregroundColor(.white)
                    
                    Text(viewModel.temp)
                        .font(.system(size: 90, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text(viewModel.descriptionText)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.90, alignment: .center)
            
            Spacer()
            
            //Info Box
            VStack(spacing: 0) {
                HStack {
                    VStack{
                        Text("Vento")
                        Image(systemName: "wind")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text("\(viewModel.velocitaVento) ") + Text(viewModel.direzioneVento)
                    }
                    
                    VStack{
                        Text("Umidità")
                        Image(systemName: "drop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text(viewModel.umidita)
                    }
                    
                    VStack{
                        Text("Temp Max")
                        Image(systemName: "thermometer.sun")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text(viewModel.tempMax)
                    }
                    
                    VStack{
                        Text("Temp Min")
                        Image(systemName: "thermometer.snowflake")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text(viewModel.tempMin)
                    }
                }
                .fixedSize()
                .padding(.top)
                .padding(.bottom)
                
                DividerCustom()
                
                HStack(alignment: .center) {
                    VStack{
                        Text("Temp perc.")
                        Image(systemName: "thermometer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text(viewModel.tempPercepita)
                    }
                    
                    VStack{
                        Text("Alba")
                        Image(systemName: "sunrise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text(viewModel.alba)
                    }
                    
                    VStack{
                        Text("Tramonto")
                        Image(systemName: "sunset")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipped()
                        Text(viewModel.tramonto)
                    }
                }
                .fixedSize()
                .padding([.top, .bottom])
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.90, alignment: .center)
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.1697510481, green: 0.2524770796, blue: 0.4629386067, alpha: 1)))
            .cornerRadius(25)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct CittaImpostataView_Previews: PreviewProvider {
    static var previews: some View {
        CittaImpostataView(viewModel: MeteoViewModel())
    }
}
