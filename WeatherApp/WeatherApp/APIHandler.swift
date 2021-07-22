//
//  APIHandler.swift
//  WeatherApp
//
//  Created by MacBook Pro on 22/07/21.
//

import Foundation
class APIHandler {
    static let shared = APIHandler()
    func search_weather(with name:String) -> [WeatherDetails] { //Surat
        if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=35172208ce424ecb90750709212207&q=\(name)&aqi=no"){
            do { let data = try Data(contentsOf: url)
             
                let decoder = JSONDecoder()
                do{ let jsonWeather = try decoder.decode(WeatherDetails.self, from: data)
                    print(jsonWeather.current.condition.icon)
                    return  [jsonWeather]
                }catch {
                    print(error)
                }
                
            } catch {
                print(error)
            }
        }
        
        return [WeatherDetails]()
    }
}
