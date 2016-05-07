//
//  StatusViewController.swift
//  SwiftSideMenu
//
//  Created by stephen eshelman on 5/4/16.
//  Copyright © 2016 Evgeny Nazarov. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController
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
      
      _instrumentNameLabel.text = "Connecting...!"
      
   }

      // Do any additional setup after loading the view.
   
   override func viewDidAppear(animated: Bool)
   {
//      let client:TCPClient = TCPClient(addr: "10.52.53.26", port: 50007)
//      let (success, errmsg) = client.connect(timeout: 10)
//      if success
//      {
//         //_instrumentNameLabel.text = "Connected!"
//         
//         let (success, errmsg) = client.send(str:"MobileUpdates" )
//         if success
//         {
//            var data = client.read(1024*10)
//            if let d = data
//            {
//               if let str = String(bytes: d, encoding: NSUTF8StringEncoding)
//               {
//                  print(str)
//                  
//                  dispatch_async(dispatch_get_main_queue(),
//                  { () -> Void in
//                     let json = JSON(string: str)
//                     let instrument = json!["Instrument"]
//                                    
//                     let serialNumber = instrument!["SerialNumber"]?.string
//                     let runState = instrument!["RunState"]?.string
//                     let name = instrument!["Name"]?.string
//                                    
//                     self._serialNumberLabel.text = "Serial Number: " + serialNumber!
//                     self._runStateLabel.text = "Status: " + runState!
//                     self._instrumentNameLabel.text = "Name: " + name!
//                     self._instrumentType.text = "Instrument Type: " + (instrument!["InstrumentTypeName"]?.string)!
//                     
//                     client.close()
//                  })
//               }
//            }
//            
////            while true
////            {
////               data = client.read(1024*10)
////               if let d = data
////               {
////                  if let str = String(bytes: d, encoding: NSUTF8StringEncoding)
////                  {
////                     print(str)
////                  }
////               }
////               
////            }
//         }
//         else
//         {
//            _instrumentNameLabel.text = errmsg;
//         }
//      }
//      else
//      {
//         _instrumentNameLabel.text = errmsg;
//      }
   }
   
   override func viewDidDisappear(animated: Bool)
   {
      
   }
   
   override func didReceiveMemoryWarning()
   {
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
   
}
