//
//  ViewController.swift
//  Lista Spesa
//
//  Created by Fabio Luccon on 24/01/15.
//  Copyright (c) 2015 Kennedy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var countField : UITextField!
    @IBOutlet var myTableView : UITableView!
    
    var items : [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func deleteAll()
    {
        let alert = UIAlertController(title: "Attenzione", message: "Sei sicuro di voler cancellare tutti gli elementi?", preferredStyle: UIAlertControllerStyle.Alert)
        
        var action = UIAlertAction(title: "Cancella", style: UIAlertActionStyle.Destructive) { (action : UIAlertAction!) -> Void in
            self.items.removeAll(keepCapacity : false)
            self.myTableView.reloadData()
        }
        
        var dismissAction = UIAlertAction(title: "Annulla", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        alert.addAction(dismissAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addNewItem()
    {
        var name : String = self.nameField.text
        var count : Int? = self.countField.text.toInt()
        if let val = count
        {
            //countfield ha un valore valido
            var newItem = Item(name: name, count: val)
            self.items.append(newItem)
            
            self.nameField.resignFirstResponder()
            self.countField.resignFirstResponder()
            
            self.myTableView.reloadData()
        }
        /*
        else
        {
            //il valore dentro a countfield non è valido quindi avvisa l'utente
        }
        */
        
    }
    
    // MARK - qui i protocolli
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    let identifier = "tableCell"
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.identifier) as UITableViewCell!
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: self.identifier)
        }
        
        cell.textLabel!.text = self.items[indexPath.row].name
        cell.detailTextLabel!.text = "\(self.items[indexPath.row].count)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        self.items.removeAtIndex(indexPath.row)
        self.myTableView.reloadData()
    }
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

