//
//  MainProfileSettingsVC.swift
//  ProfileSettings
//
//  Created by Appinventiv on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainProfileSettingsVC: UIViewController {

    
    
    
   //MARK: view life cycle
    @IBOutlet weak var profileSettings: UITableView!
   // data dictionary that is to be inserted
    var dataDict : [[String:String]] = [["title" : "FULLNAME", "values" : "John Smith"],
                                        ["title" : "EMAIL", "values" : "johnsmith@address.com"],
                                        ["title" : "PASSWORD", "values" : "12345"],
                                        ["title" : "BIRTHDAY", "values" : "August 26, 1989"],
                                        ["title" : "GENDER", "values" : "Male"],
                                        ["title" : "HEIGHT", "values" : "6'0\""],
                                        ["title" : "WEIGHT", "values" : "155 lbs"]]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // tap gesture to remove keyboard
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapgesture.cancelsTouchesInView = true
        profileSettings.addGestureRecognizer(tapgesture)
    
        //assigning delegates and datasource to profileSettings
        self.profileSettings.delegate = self
        self.profileSettings.dataSource = self
        let nib = UINib(nibName: "ReuseCell", bundle: nil)
        profileSettings.register(nib, forCellReuseIdentifier: "ReuseCellID")
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    //MARK: private method
   @objc private func hideKeyboard()
    {
        profileSettings.endEditing(true)
    }
}
    //MARK: datasource and delegates
    extension MainProfileSettingsVC : UITableViewDataSource, UITableViewDelegate{
    //assigning number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataDict.count + 2
    }
    
    //assigning cells to specific rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //for 1st section
        if indexPath.row == 0
      {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCellID" , for: indexPath) as! DisplayCell
          return cell
        
      }
        
           //for last section
        else if indexPath.row == dataDict.count + 1
      {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: "ChangesCellID", for: indexPath) as! ChangesCell
          return cell
            
      }
        
        //for middle section
        else
      {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCellID", for: indexPath) as! ReuseCell
         cell.basicDetailsLabel.text = dataDict[indexPath.row-1]["title"]
         cell.informationTF.text = dataDict[indexPath.row-1]["values"]
         return cell
        
      }

    }
    
    //assigning height to differetnt cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
            //for 1st section
            if indexPath.row == 0
            {
                return self.view.bounds.height*275/667
            }
        
            //for last section
            else if indexPath.row == dataDict.count+1
            {
                return 158
            }
                
            //for 1st field of data dictionary
            else if indexPath.row == 1
            {
                return 90
            }
                
             // for rest of the sections
            else
            {
                return 71
            }
        
    }
        
        // data persistent function
        func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)  {
            if indexPath.row != 0 && indexPath.row != dataDict.count+1 {
                
                let cell = tableView.cellForRow(at: indexPath) as! ReuseCell
                dataDict[indexPath.row-1]["values"] = cell.informationTF.text
                
            }

        }
    
        
    }

//MARK: heading cell
class DisplayCell  : UITableViewCell
{
    //outlet of addition button
    @IBOutlet weak var additionOutlet: UIButton!
    
    //outlet of image view
    @IBOutlet weak var profilePicture: UIImageView!
    
    
    override func awakeFromNib()
    {
        profilePicture.layer.masksToBounds = true                               //so that image is always round
        profilePicture.layer.cornerRadius = profilePicture.layer.bounds.width/2 //circling the profile picture
        additionOutlet.layer.cornerRadius = additionOutlet.layer.bounds.width/2 //circling the addition button
        profilePicture.layer.borderWidth = 1                                    //adding border to profile picture
        profilePicture.layer.borderColor = UIColor.white.cgColor                //adding border color
    }
    //MARK: IB action
    @IBAction func additionButton(_ sender: UIButton)
    {
    }
}

// MARK: information cell
//class InformationCell : UITableViewCell{}

//MARK: save changes cell
class ChangesCell : UITableViewCell
{
    override func awakeFromNib()
    {
        saveChangesOutlet.layer.cornerRadius = saveChangesOutlet.layer.bounds.height/2 //rounding the corners of button
    }
    
    //outlet for button
    @IBOutlet weak var saveChangesOutlet: UIButton!
    //MARK: IB action
    @IBAction func saveChangesButton(_ sender: UIButton)
    {
    }
    
}
