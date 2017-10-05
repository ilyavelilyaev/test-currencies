import Vapor
import Foundation

extension Droplet {
    func setupRoutes() throws {
        get("rates") { req in
            var json = JSON()
            try json.set("base", "EUR")
            try json.set("rates", generateRates())
            return json
        }
    }
}

func generateRates() -> [String: Double] {
    var rates = ["AUD":1.4986,"BGN":1.9558,"BRL":3.6929,"CAD":1.4678,"CHF":1.1456,"CNY":7.8163,"CZK":25.886,"DKK":7.4427,"GBP":0.88768,"HKD":9.2007,"HRK":7.5051,"HUF":311.2,"IDR":15858.0,"ILS":4.1378,"INR":76.641,"JPY":132.47,"KRW":1342.7,"MXN":21.387,"MYR":4.983,"NOK":9.3533,"NZD":1.6403,"PHP":60.071,"PLN":4.2971,"RON":4.5808,"RUB":67.818,"SEK":9.5425,"SGD":1.6023,"THB":39.274,"TRY":4.2016,"USD":1.1787,"ZAR":15.983]
    
    for (key, value) in rates {
        let random = 1.05 - Double(arc4random() % 100) / 1000
        rates[key] = value * random
    }

    return rates
}
