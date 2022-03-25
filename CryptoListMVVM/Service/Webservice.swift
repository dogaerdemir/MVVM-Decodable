import Foundation

class Webservice
{
    // bize gelecek veri cryptocurrency verisi (array halinde bir sürü)
    func downloadCurrencies(url: URL, completion: @escaping([CryptoCurrencyStruct]?) -> ())
    {
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error
            {
                print(error.localizedDescription)
                completion(nil) //hata varsa bir şey yok
            }
            else if let data = data
            {
                //
                let cryptoList = try? JSONDecoder().decode([CryptoCurrencyStruct].self, from: data)
                
                if let cryptoList = cryptoList
                {
                    completion(cryptoList)
                }
            }
        }.resume() //aslında resume değil start ??
    }
}
