//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by тигренок  on 11/28/15.
//  Copyright (c) 2015 Midori.s. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
        }()
    
    lazy var blockBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedblockBehavior = UIDynamicItemBehavior()
        lazilyCreatedblockBehavior.allowsRotation = true
        lazilyCreatedblockBehavior.elasticity = CGFloat(NSUserDefaults.standardUserDefaults().doubleForKey(Constants.ElasticityKey))
        lazilyCreatedblockBehavior.friction = 0
        lazilyCreatedblockBehavior.resistance = 0
        NSNotificationCenter.defaultCenter().addObserverForName(NSUserDefaultsDidChangeNotification, object: nil, queue: nil) { (notification) -> Void in
            lazilyCreatedblockBehavior.elasticity = CGFloat(NSUserDefaults.standardUserDefaults().doubleForKey(Constants.ElasticityKey))
        }
        return lazilyCreatedblockBehavior
        
        }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView) {
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        block.removeFromSuperview()
    }
    
    struct Constants {
        static let ElasticityKey = "BouncerBehavior.Elasticity"
    }

   
}
