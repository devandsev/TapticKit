//
//  TapticKit.swift
//  Andrey Sevrikov
//
//  Created by Andrey Sevrikov on 27/03/2018.
//  Copyright © 2018 Andrey Sevrikov. All rights reserved.
//

import UIKit

public enum Feedback {
    
    public enum Notification {
        case error
        case success
        case warning
    }
    
    public enum Impact {
        case light
        case medium
        case heavy
    }
    
    case notification(Notification)
    case selection
    case impact(Impact)
}

public enum SupportLevel {
    case none
    case simple
    case haptic
}

class TapticKit {
    
    static var preparedGenerator: AnyObject?
    static var preparedFeedbackType: Feedback?
    
    // TODO: Retrieve support level based on hardware platfrom and iOS version
    static public var supportLevel: SupportLevel = {
        if #available(iOS 10.0, *) {
            return .haptic
        } else {
            return .simple
        }
    }()
    
    static public func prepare(for feedback: Feedback) {
        guard supportLevel == .haptic else {
            return
        }
        
        if #available(iOS 10.0, *) {
            
            let g: UIFeedbackGenerator
            
            switch feedback {
                
            case .notification(_):
                g = UINotificationFeedbackGenerator()
                
            case .selection:
                g = UISelectionFeedbackGenerator()
                
            case .impact(let style):
                
                switch style {
                case .light:
                    g = UIImpactFeedbackGenerator(style: .light)
                    
                case .medium:
                    g = UIImpactFeedbackGenerator(style: .medium)
                    
                case .heavy:
                    g = UIImpactFeedbackGenerator(style: .heavy)
                }
            }
            
            g.prepare()
            preparedGenerator = g
            
            preparedFeedbackType = feedback
        }
    }
    
    static public func trigger(_ feedback: Feedback) {
        switch supportLevel {
            
        case .haptic:
            if #available(iOS 10.0, *) {
                triggerHaptic(feedback)
            }
            
        case .simple:
            triggerSimple(feedback)
            
        // TODO: Use vibration
        case .none:
            break
        }
    }
    
    @available(iOS 10.0, *)
    static func triggerHaptic(_ feedback: Feedback) {
        switch feedback {
            
        case .notification(let style):
            let g: UINotificationFeedbackGenerator
            
            if let preparedGenerator = self.preparedGenerator as? UINotificationFeedbackGenerator {
                g = preparedGenerator
            } else {
                g = UINotificationFeedbackGenerator()
            }
            
            switch style {
                
            case .error:
                g.notificationOccurred(.error)
                
            case .success:
                g.notificationOccurred(.success)
                
            case .warning:
                g.notificationOccurred(.warning)
            }
            
        case .selection:
            let g: UISelectionFeedbackGenerator
            
            if let preparedGenerator = self.preparedGenerator as? UISelectionFeedbackGenerator {
                g = preparedGenerator
            } else {
                g = UISelectionFeedbackGenerator()
            }
            
            g.selectionChanged()
            
        case .impact(let style):
            let g: UIImpactFeedbackGenerator
            
            if let preparedGenerator = self.preparedGenerator as? UIImpactFeedbackGenerator,
            let preparedFeedbackType = self.preparedFeedbackType,
            case .notification = preparedFeedbackType {
                g = preparedGenerator
            } else {
                switch style {
                    
                case .light:
                    g = UIImpactFeedbackGenerator(style: .light)
                    
                case .medium:
                    g = UIImpactFeedbackGenerator(style: .medium)
                    
                case .heavy:
                    g = UIImpactFeedbackGenerator(style: .heavy)
                }
            }
            
            g.impactOccurred()
        }
    }
    
    // TODO: Implement
    static func triggerSimple(_ feedback: Feedback) {
    }
    
    static public func release() {
        preparedGenerator = nil
        preparedFeedbackType = nil
    }
}
