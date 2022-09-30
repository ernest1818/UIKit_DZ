//
//  Shared.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 28.09.2022.
//

import Foundation
import UIKit

/// класс для создания шаринка в фБ, в общем что то не получилось у меня 
class SharedFaceBook: UIActivity {
    var aactivityTitle: String
    var aactivityImage: UIImage?
    var activityItems: [Any] = []
    var action: ([Any]) -> Void
    
    init(title: String, image: UIImage?, performAction: @escaping ([Any]) -> Void) {
        aactivityTitle = title
        aactivityImage = image
        action = performAction
        super.init()
    }
    
    override var activityTitle: String? {
        return aactivityTitle
    }
    
    override var activityImage: UIImage? {
        return aactivityImage
    }
    
    override var activityType: UIActivity.ActivityType {
        return UIActivity.ActivityType(rawValue: "com.facebook.www")
    }

    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    override func perform() {
        action(activityItems)
        activityDidFinish(true)
    }
}
