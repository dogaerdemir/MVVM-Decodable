import Foundation

struct CryptoListViewModelStruct
{
    let cryptoCurrencyList : [CryptoCurrencyStruct]
    
    func numberOfRowsInSection() -> Int
    {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(index : Int) -> CryptoViewModelStruct
    {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModelStruct(cryptoCurrency: crypto)
    }
}

struct CryptoViewModelStruct
{
    let cryptoCurrency : CryptoCurrencyStruct
    
    var name : String
    {
        return self.cryptoCurrency.currency
    }
    
    var price : String
    {
        return self.cryptoCurrency.price
    }
}
