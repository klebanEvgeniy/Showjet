//
//  CustomLayout.swift
//  Showjet
//
//  Created by Necrosoft on 11/04/2019.
//  Copyright © 2019 Necrosoft. All rights reserved.
//

import Foundation
import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    var isSheared: Bool = false
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superArray = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let attributes = NSArray(array: superArray, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
        
        if !isSheared {
            attributes.forEach{ attribute in
                attribute.transform = Helper.affineTransformMakeShear(xShear: 0.0,
                                                                      yShear: -Constants.tanOfSixDegrees)
            }
            return attributes
        }   else {
            attributes.forEach{ attribute in
                attribute.transform = Helper.affineTransformMakeShear(xShear: 0.0,
                                                                      yShear: 0)
            }
            return attributes
        }
    }
}
