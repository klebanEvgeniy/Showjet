//
//  Helper.swift
//  Showjet
//
//  Created by Necrosoft on 11/04/2019.
//  Copyright © 2019 Necrosoft. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static func affineTransformMakeShear(xShear: CGFloat, yShear: CGFloat ) -> CGAffineTransform {
        return __CGAffineTransformMake(1, yShear, xShear, 1, 0, 0)
    }
}
