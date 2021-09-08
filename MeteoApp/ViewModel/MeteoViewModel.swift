//
//  MeteoViewModel.swift
//  MeteoApp
//
//  Created by Luc on 30/08/21.
//

import Foundation

class MeteoViewModel: ObservableObject {
    // @Published aggiorna la UI quando modificati
    @Published var title: String = "--"
    @Published var descriptionText: String = "--"
    @Published var temp: String = "--"
    @Published var country: String = "--"
    @Published var tempMax: String = "--"
    @Published var tempMin: String = "--"
    @Published var tempPercepita: String = "--"
    @Published var umidita: String = "--"
    @Published var velocitaVento: String = "--"
    @Published var direzioneVento: String = "--"
    @Published var alba: String = "--"
    @Published var tramonto: String = "--"
    
    // quando verrà inizializzata richiamera il metodo fetchWeather che aggiornerà le proprietà
    init() {
        title = "London"
        fetchWeather()
    }
    
    // metodo che recupera i dati dall' API
    func fetchWeather() {
        var componentsURL = URLComponents()
        componentsURL.scheme = "http"
        componentsURL.host = "api.openweathermap.org"
        componentsURL.path = "/data/2.5/weather"
        
        let queryItemQuery = URLQueryItem(name: "q", value: title)
        let unitItemQuery = URLQueryItem(name: "units", value: "metric")
        let queryItemToken = URLQueryItem(name: "appid", value: "62e6dd49794ff177d31e48cfe165e4ae")
        let langItemQuery = URLQueryItem(name: "lang", value: "it")
        componentsURL.queryItems = [queryItemQuery, unitItemQuery, queryItemToken, langItemQuery]
        
        print("\(String(describing: componentsURL.url))")
        
        guard let url = componentsURL.url else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(MeteoModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.name
                    // dato che è un array, accedo a first
                    self.descriptionText = model.weather.first?.weatherDescription ?? "no data"
                    self.temp = "\(Int(model.main.temp))°"
                    self.country = model.sys.country
                    self.tempMax = "\(Int(model.main.tempMax))°"
                    self.tempMin = "\(Int(model.main.tempMin))°"
                    self.tempPercepita = "\(Int(model.main.feelsLike))°"
                    self.umidita = "\(model.main.humidity)%"
                    self.velocitaVento = "\(model.wind.speed)m/s"
                    self.direzioneVento = "\(self.windDirection(gradi: Double(model.wind.deg)))".uppercased()
                    self.alba = self.dataConversione(timeInt: model.sys.sunrise)
                    self.tramonto = self.dataConversione(timeInt: model.sys.sunset)
                }
            } catch {
                print("JSON non caricato...")
            }
        }
        task.resume()
        
    }
    
    func dataConversione(timeInt: Int) -> String{
        let timeInterval = TimeInterval(timeInt)
        let date = Date(timeIntervalSince1970: timeInterval)
        return date.getFormattedDate(format: "HH:mm:ss a")
    }
    
    func windDirection(gradi: Double) -> String {
        return gradi.direction.rawValue
    }
}
