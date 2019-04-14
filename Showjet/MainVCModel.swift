//
//  MainVCModel.swift
//  Showjet
//
//  Created by Necrosoft on 11/04/2019.
//  Copyright © 2019 Necrosoft. All rights reserved.
//

import Foundation
import UIKit

class MainVCModel {
    let models = [
        CellModel.init(UIImage.init(named: "1.jpg")!),
        CellModel.init(UIImage.init(named: "2.jpg")!),
        CellModel.init(UIImage.init(named: "3.jpg")!),
        CellModel.init(UIImage.init(named: "4.jpg")!),
        CellModel.init(UIImage.init(named: "5.jpg")!),
        CellModel.init(UIImage.init(named: "6.jpg")!),
        CellModel.init(UIImage.init(named: "7.jpg")!),
        CellModel.init(UIImage.init(named: "8.jpg")!),
        CellModel.init(UIImage.init(named: "9.jpg")!),
    ]
}

class CellModel {
    var isEnlarged: Bool = false
    var image: UIImage
    init(_ image: UIImage){
        self.image = image
    }
}
