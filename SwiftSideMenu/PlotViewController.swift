//
//  PlotViewController.swift
//  TriosMobileDemo2016
//
//  Created by stephen eshelman on 5/8/16.
//  Copyright © 2016 objectthink.com. All rights reserved.
//

import UIKit

class PlotViewController: UIViewController, BEMSimpleLineGraphDataSource, BEMSimpleLineGraphDelegate, TriosDelegate
{
   @IBOutlet var _graph: BEMSimpleLineGraphView!
   
   var _point:CGFloat!
   var _tick:Int = 0
   var _values:Array<CGFloat>!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
      //let graph = BEMSimpleLineGraphView(frame: CGRect(x: 40, y: 40, width: 100, height: 100))
      
      //graph.dataSource = self
      //graph.delegate = self
      
      //view.addSubview(graph)
      
      _values = Array<CGFloat>()
      
      _graph.enableYAxisLabel = true
      _graph.enableXAxisLabel = true
   }

   func instrumentInformation(instrumentInformation:JSON)
   {
   }
   
   func signals(signals:JSON)
   {
      dispatch_async(dispatch_get_main_queue(),
      { () -> Void in
         
         if let n = NSNumberFormatter().numberFromString((signals["Temperature"]?.string)!)
         {
            let f = CGFloat(n)

            self._point = f
            
            self._values.append(f)
            
            self._tick = self._tick + 1
            
            if self._tick % 10 == 0
            {
               self._graph.reloadGraph()
            }
         }
         
      })
   }
   
   override func viewWillAppear(animated: Bool)
   {
      (tabBarController as! TabBarController).trios._delegate = self
   }
   
   func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView) -> Int
   {
      return _values.count
   }
   
   func lineGraph(graph: BEMSimpleLineGraphView, valueForPointAtIndex index: Int) -> CGFloat
   {
      if _point != nil
      {
         return _values[index]
      }
      else
      {
         return 0.0
      }
   }
   
   func numberOfYAxisLabelsOnLineGraph(graph: BEMSimpleLineGraphView) -> Int
   {
      return 5
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
