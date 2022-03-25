import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModelStruct : CryptoListViewModelStruct!
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData()
    {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos
            {
                self.cryptoListViewModelStruct = CryptoListViewModelStruct(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.cryptoListViewModelStruct == nil ? 0 : self.cryptoListViewModelStruct.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! TableViewCell
        
        
        let crypto = self.cryptoListViewModelStruct.cryptoAtIndex(index: indexPath.row)
        cell.priceText.text = crypto.price
        cell.currencyText.text = crypto.name
        
        return cell
    }

}

