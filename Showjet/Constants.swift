//
//  Constants.swift
//  Showjet
//
//  Created by Necrosoft on 11/04/2019.
//  Copyright © 2019 Necrosoft. All rights reserved.
//

import Foundation
import UIKit

enum Offsets: CGFloat {
    
    /* Оффсет рассчитан по формуле рассчета катетов прямоугольного треугольника, зная один катет (ширину экрана) и угол (6 градусов) находим второй катет
     
     func degreesToRadians(degrees: Double) -> CGFloat {
     return CGFloat(Double.pi * (degrees / 180.0))
     }
     
     UIScreen.main.bounds.size.width * tan(degreesToRadians(degrees: 6.0)) = 43.51315339999005
     */
    
    case verticalOffsetOfAngleOfSixDegreesTriangle = 43.513153
    case verticalOffsetOfAngleOfSixDegreesTriangleHalved = 21.7565765
    var value: CGFloat {
        return self.rawValue
    }
}

class Constants {
    static let statusBarHeight = CGFloat(20.0)
    static let angle: CGFloat = 6.0
    static let tanOfSixDegrees: CGFloat = 0.10510424
    static let arctanOfSixDegrees: CGFloat = 80.5376777920
    static let fullHeight = UIScreen.main.bounds.size.height + 2 /* Без добавления 2 в полноразмерном режиме внизу остается пустое место в 2 поинта */
    static let defaultHeight = UIScreen.main.bounds.size.height * 0.667
    static let twoPixels = (1.0 / UIScreen.main.scale) * 2
}
