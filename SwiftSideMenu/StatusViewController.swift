//
//  StatusViewController.swift
//  SwiftSideMenu
//
//  Created by stephen eshelman on 5/4/16.
//  Copyright © 2016 Evgeny Nazarov. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, TriosDelegate
{
   @IBOutlet var _instrumentNameLabel: UILabel!
   @IBOutlet var _serialNumberLabel: UILabel!
   @IBOutlet var _runStateLabel: UILabel!
   @IBOutlet var _instrumentType: UILabel!
   
   var _client:TCPClient!
   var _success:Bool!
   var _errmsg:String!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
   }

   func instrumentInformation(instrumentInformation:JSON)
   {
   }
   
   func signals(signalsJSON:JSON)
   {
      print("signals:statusviewcontroller")
      
      let temperature = signalsJSON["Temperature"]?.string
      
      //_instrumentNameLabel.text = temperature
      dispatch_async(dispatch_get_main_queue(),
      { () -> Void in
         self._instrumentNameLabel.text = temperature
      })
   }
   
   override func viewWillAppear(animated: Bool)
   {
      (tabBarController as! TabBarController).trios._delegate = self
   }
   
   override func didReceiveMemoryWarning()
   {
      super.didReceiveMemoryWarning()
   }
}
