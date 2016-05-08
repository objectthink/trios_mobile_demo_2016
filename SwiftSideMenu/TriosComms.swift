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
   var _instrument:JSON!
   var _delegate:TriosDelegate!
   
   var delegate:TriosDelegate
   {
      set
      {
         _delegate = newValue
      }
      get
      {
         return _delegate
      }
   }
   
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
   
   var instrument:JSON
   {
      set
      {
         _instrument = newValue
      }
      get
      {
         return _instrument
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
      
      if(_success)
      {
         _isConnected = true
         
         let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
         dispatch_async(queue)
         {
            let (success, errmsg) = self._client.send(str:"MobileUpdates" )
            
            self._errorMessage = errmsg
            
            print(self._errorMessage)
            
            //var first:Bool = true
            if success
            {
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
                        
                        guard let json = JSON(string: str) else
                        {
                           continue
                        }
                        
                        if let instrument = json["Instrument"]
                        {
                           self._instrument = instrument
                           self._delegate.instrumentInformation(instrument)
                        }
                        
//                        if first
//                        {
//                           first = false
//                           continue
//                        }
                        
                        guard let signals = json["Signals"] else
                        {
                           continue
                        }
                        
                        if self._delegate != nil
                        {
                           self._delegate.signals(signals)
                        }
                        
//                        if json == nil
//                        {
//                           continue
//                        }
                        
//                        if let instrument = json!["Instrument"]
//                        {
//                           self._instrument = instrument
//                           
//                           print(instrument["InstrumentTypeName"])
//                        }
//
//                        if first
//                        {
//                           first = false
//                           continue
//                        }
//                        
//                        if let signals = json!["Signals"]
//                        {
//                           if self._delegate != nil
//                           {
//                              self._delegate.signals(signals)
//                           }
//                           
//                        }
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