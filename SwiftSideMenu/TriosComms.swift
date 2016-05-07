//
//  TriosComms.swift
//  TriosMobileDemo2016
//
//  Created by stephen eshelman on 5/7/16.
//  Copyright © 2016 objectthink.com. All rights reserved.
//

import Foundation

class TriosComms
{
   var _ipAddress:String!
   var _client:TCPClient!
   var _isConnected:Bool = false
   var _errorMessage:String!
   var _success:Bool = false
   var _quit:Bool = false
   
   var ipAddress:String
   {
      set
      {
         _ipAddress = newValue
      }
      get
      {
         return _ipAddress
      }
   }
   
   init(ipAddress:String)
   {
      self.ipAddress = ipAddress
      
      self._client = TCPClient(addr: ipAddress, port: 50007)
      
      let (success, errmsg) = self._client.connect(timeout: 10)
      
      _success = success
      
      _errorMessage = errmsg
      
      print(_errorMessage)
      
      let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
      dispatch_async(queue)
      {
         //self._client = TCPClient(addr: ipAddress, port: 50007)
         
         //let (success, errmsg) = self._client.connect(timeout: 10)
         
         //self._errorMessage = errmsg
         
         if self._success
         {
            self._isConnected = true
            
            let (success, errmsg) = self._client.send(str:"MobileUpdates" )
   
            self._errorMessage = errmsg
            
            print(self._errorMessage)
            
            if success
            {
//               var data = client.read(1024*10)
//               if let d = data
//               {
//                  if let str = String(bytes: d, encoding: NSUTF8StringEncoding)
//                  {
//                     print(str)
//                     
//                     dispatch_async(dispatch_get_main_queue(),
//                     { () -> Void in
//                        let json = JSON(string: str)
//                        let instrument = json!["Instrument"]
//                                       
//                        let serialNumber = instrument!["SerialNumber"]?.string
//                        let runState = instrument!["RunState"]?.string
//                        let name = instrument!["Name"]?.string
//                                       
//                        //self._serialNumberLabel.text = "Serial Number: " + serialNumber!
//                        //self._runStateLabel.text = "Status: " + runState!
//                        //self._instrumentNameLabel.text = "Name: " + name!
//                        //self._instrumentType.text = "Instrument Type: " + (instrument!["InstrumentTypeName"]?.string)!
//                                       
//                        //client.close()
//                     })
//                  }
//               }
               
               while true
               {
                  if self._quit
                  {
                     break
                  }
                  
                  let data = self._client.read(1024*10)
                  if let d = data
                  {
                     if let str = String(bytes: d, encoding: NSUTF8StringEncoding)
                     {
                        print(str)
                     }
                  }
                  
               }
               
            }
         }
      }
   }
   
   func close()
   {
      _quit = false
      _client.close()
   }
}