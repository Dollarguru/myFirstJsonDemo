//
//  ViewController.swift
//  jsonDemo
//
//  Created by mayur on 1/14/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var list = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let request = AF.request("https://jsonplaceholder.typicode.com/users")
        request.responseJSON { (response) in
            
            let json = try! JSON(data: response.data!)
            
            for element in json.array!
            {
                let id = element["id"].int ?? 0
                let name = element["name"].string ?? " - "
                let username = element["username"].string ?? " - "
                let email = element["email"].string ?? " - "
                let street = element["address"]["street"].string ?? " - "
                let suite = element["address"]["suite"].string ?? " - "
                let city = element["address"]["city"].string ?? " - "
                let zipcode = element["address"]["zipcode"].string ?? " - "
                let latitude = element["address"]["geo"]["lat"].string ?? " - "
                let longitude = element["address"]["geo"]["lng"].string ?? " - "
                let phone = element["phone"].string ?? " - "
                let website = element["website"].string ?? " - "
                let companyName = element["company"]["name"].string ?? " - "
                let companycatchPhrase = element["company"]["catchPhrase"].string ?? " - "
                let companybs = element["company"]["bs"].string ?? " - "
                let model = Model(id: id, name: name, username: username, email: email, street: street, suite: suite, city: city, zipcode: zipcode, latitude: latitude, longitude: longitude, phone: phone, website: website, company_name: companyName, company_catchPhrase: companycatchPhrase, company_bs:companybs)
                
                self.list.append(model)
            }
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
        
        
    }
}
extension ViewController : UITableViewDataSource ,UITableViewDelegate
{
    //MARK: - Tableview delegate , datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
//    let model = Model(id: id, name: name, username: username, email: email, street: street, suite: suite, city: city, zipcode: zipcode, latitude: latitude, longitude: longitude, phone: phone, website: website, company_name: companyName, company_catchPhrase: companycatchPhrase, company_bs:companybs)
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let element = list[indexPath.row]
        cell.lblUserDetail.text = """
                                    id - \(element.id)\n
                                    name - \(element.name)\n
                                    username - \(element.username)\n
                                    email - \(element.email)\n
                                    street - \(element.street)\n
                                    suite - \(element.suite)\n
                                    city - \(element.city)\n
                                    zipcode - \(element.zipcode)\n
                                    latitude - \(element.latitude)\n
                                    longitude - \(element.longitude)\n
                                    phone - \(element.phone)\n
                                    website - \(element.website)\n
                                    company_name - \(element.company_name)\n
                                    company_catchPhrase - \(element.company_catchPhrase)\n
                                    company_bs - \(element.company_bs)

                                  """
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

