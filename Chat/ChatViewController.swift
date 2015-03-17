//
//  ChatViewController.swift
//  Chat
//
//  Created by Michelle Venetucci Harvey on 3/16/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    
    var messages: [PFObject]! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.delegate = self
        chatTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didPressSendButton(sender: AnyObject) {
        var message = PFObject(className: "Message")
        message["text"] = chatTextField.text
        message["user"] = PFUser.currentUser()
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            println("Saved Message")
            self.getMessages()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellforRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var message = messages[indexPath.row]
        
        var cell = tableView.dequeueReusableCellWithIdentifier("chatTableViewCell") as ChatTableViewCell
        cell.messageLabel.text = message["text"] as String!
        return cell
    }
    
    func getMessages{} {
        var query = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            self.messages = objects as [PFObject]
            self.chatTableView.reloadData()
            }
        }
}
