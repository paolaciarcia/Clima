

import Foundation

struct WeatherManager {
    //Networking
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e87980a7ca46a859b7faad8734c24120&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        //1.Create a URL
        if let url = URL(string: urlString) {
            //2.Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3.Give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print("houve um erro: \(error!)")
                    return
                }
                
                if let safeData = data {
                    self.parseJason(weatherData: safeData)
                    print("o objeto data é nulo")
                }
            }
            //4.Start the task
            task.resume()
        }
    }
    
    func parseJason(weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            let weather = decodedData.weather[0].description
            
            print(weather)
        } catch { 
            print(error)
        }
    }
}
