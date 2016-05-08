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
   @IBOutlet var _isBusy: UILabel!
   @IBOutlet var _instrumentTypeName: UILabel!
   @IBOutlet var _canRun: UILabel!
   @IBOutlet var _isRunning: UILabel!
   @IBOutlet var _isOnline: UILabel!
   
   var _client:TCPClient!
   var _success:Bool!
   var _errmsg:String!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
   }

   func instrumentInformation(instrumentInformation:JSON)
   {
      print("instrumentinformation:statusviewcontroller")
      
      guard let name = instrumentInformation["Name"]?.string else
      {
         return
      }
      
      //_instrumentNameLabel.text = temperature
      dispatch_async(dispatch_get_main_queue(),
      { () -> Void in
         self._instrumentNameLabel.text = name
      })}
   
   func signals(signalsJSON:JSON)
   {

   }
   
   override func viewWillAppear(animated: Bool)
   {
      (tabBarController as! TabBarController).trios._delegate = self
      
      let trios:TriosComms = (tabBarController as! TabBarController).trios
      
      _instrumentNameLabel.text = trios.instrument["Name"]?.string
      _serialNumberLabel.text = trios.instrument["SerialNumber"]?.string
      _runStateLabel.text = trios.instrument["RunState"]?.string
      _instrumentType.text = trios.instrument["InstrumentTypeName"]?.string
      
      _instrumentTypeName.text = trios.instrument["InstrumentTypeName"]?.string
      _isBusy.text = trios.instrument["IsBusy"]?.string
      _isRunning.text = trios.instrument["IsRunning"]?.string
      _isOnline.text = trios.instrument["IsOnline"]?.string
      _canRun.text = trios.instrument["CanRun"]?.string
      
   }
   
   override func didReceiveMemoryWarning()
   {
      super.didReceiveMemoryWarning()
   }
}
