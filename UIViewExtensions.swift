//
//  UIViewExtensions.swift
//  NotesScreen
//
//  Created by Lancy on 12/06/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import UIKit

let nibCache = NSCache()

extension NSObject {
    class func className() -> String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
}

extension UIView {
    
    class func instance(var nibName: String?,var bundle: NSBundle?, owner: AnyObject?) -> AnyObject? {
        
        nibName = nibName ?? self.className()
        bundle = bundle ?? NSBundle.mainBundle()
        
        let path = String(format: "%@.%@", bundle!.bundleIdentifier!, nibName!)
        var nib: UINib?  = nibCache.objectForKey(path) as? UINib
        
        if nib == nil {
            let resource = bundle!.pathForResource(nibName, ofType: "nib")
            if resource != nil {
                nib = UINib(nibName: nibName!, bundle: bundle)
                nibCache.setObject(nib!, forKey: path)
            }
        }
        
        if nib != nil {
            let viewObjects = nib!.instantiateWithOwner(owner, options: nil)
            if viewObjects.count > 0 {
                return viewObjects.first
            }
        }
        
        return nil;
    }
    
    var left: CGFloat {
        
        get {
            return frame.minX
        }
        
        set(leftValue) {
            frame.origin.x = leftValue
        }
    }
    
    var right: CGFloat {
        
        get {
            return frame.maxX
        }
        
        set(rightValue) {
            frame.origin.x = rightValue - frame.width
        }
    }
    
    var top: CGFloat {
        
        get {
            return frame.minY
        }
        
        set(topValue) {
            frame.origin.y = topValue
        }
    }
    
    var bottom: CGFloat {
        
        get {
            return frame.maxY
        }
        
        set(bottomValue) {
            frame.origin.y = bottomValue - frame.height
        }
    }
    
    
}
