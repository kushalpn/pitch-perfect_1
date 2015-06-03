//
//  RecordedAudio.swift
//  VoiceTwist
//
//  Created by kushal on 21/05/15.
//  Copyright (c) 2015 Voice Twist Ltd. All rights reserved.
//

import Foundation

class RecordedAudio {
    
    var filePathUrl: NSURL!
    var title : String!
    
    /// This initializer/Constructor is to initialize the values of filePathUrl and title 

    init(filePathUrl:NSURL,title:String){   
        self.filePathUrl = filePathUrl
        self.title = title
    }
}