//
//  ViewController.swift
//  Test macOS
//
//  Created by KY1VSTAR on 7/28/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

import Cocoa
import tdjson

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        td_json_client_create()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

