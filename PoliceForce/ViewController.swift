import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forcePhoneLabel: UILabel!
    
    @IBOutlet weak var forceNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://data.police.uk/api/forces/cheshire"
        
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            //turn the json into useful data
            
            if (response as? HTTPURLResponse) != nil {
                
                if let data = data {
                   
                    let force = try! JSONDecoder().decode(Force.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.forceNameLabel.text = force.name
                        self.forcePhoneLabel.text = force.telephone
                        
                        for item in force.engagementMethods {
                            print(item.title ?? "Unknown")
                        }
                    }
                    
                }
                else {
                    //data is nil?
                }
            }
        }
        task.resume()
    }


}

