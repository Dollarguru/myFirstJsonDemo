//
//  ContactViewController.swift
//  jsonDemo
//
//  Created by mayur on 1/15/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ContactViewController: UIViewController {

    var contactList = [Contacts]()
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = AF.request("https://api.androidhive.info/contacts/")
        request.responseJSON { (response) in
            
            let json = try! JSON(data: response.data!)
            if let contacts = json["contacts"].array
            {
                for element in contacts{
                    
                    let id = element["id"].string ?? " - "
                    let name = element["name"].string ?? " - "
                    let email = element["email"].string ?? " - "
                    let address = element["address"].string ?? " - "
                    let gender = element["gender"].string ?? " - "
                    let phoneMobile = element["phone"]["mobile"].string ?? " - "
                    let phoneHome = element["phone"]["home"].string ?? " - "
                    let phoneOffice = element["phone"]["office"].string ?? " - "

                    let contact = Contacts(id: id, name: name, email: email, address: address, gender: gender, mobile: phoneMobile, home: phoneHome, office: phoneOffice)
                    
                    self.contactList.append(contact)
                    

                }
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
            
            
        }
    }
    
}


extension ContactViewController : UITableViewDelegate,UITableViewDataSource {
    
    //MARK: - TableViewDelegate , DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        let element = contactList[indexPath.row]
        
        cell.lblContactDetail.text = """
                                       
                                    id - \(element.id)\n
                                    name - \(element.name)\n
                                    email - \(element.email)
                                    """
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
