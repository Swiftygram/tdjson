//
//  InterfaceController.swift
//  Test watchOS Extension
//
//  Created by KY1VSTAR on 7/28/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

import WatchKit
import Foundation
import tdjson

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        td_json_client_create()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
