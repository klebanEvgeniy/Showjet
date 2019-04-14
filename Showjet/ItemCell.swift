//
//  ItemCell.swift
//  Showjet
//
//  Created by Necrosoft on 11/04/2019.
//  Copyright © 2019 Necrosoft. All rights reserved.
//

import Foundation
import UIKit

class ItemCell: UICollectionViewCell {
    
    /* Оффсет рассчитан по формуле рассчета катетов прямоугольного треугольника, зная один катет (ширину экрана) и угол (6 градусов) находим второй катет
 
     func degreesToRadians(degrees: Double) -> CGFloat {
     return CGFloat(Double.pi * (degrees / 180.0))
     }
 
    UIScreen.main.bounds.size.width * tan(degreesToRadians(degrees: 6.0)) = 43.51315339999005
    */
    
    private let offset: CGFloat = 43.51315339999005
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
 
    private let botLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func bind(_ model: CellModel){
        if model.isEnlarged {
            updateConstraintsToEnlarged()
        }   else {
            updateConstraintsToDefault()
        }
        imageView.image = model.image
    }
    
    override func awakeFromNib() {
        addSubview(botLine)
        botLine.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        botLine.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        botLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        botLine.heightAnchor.constraint(equalToConstant: Constants.twoPixels).isActive = true
        imageView.transform = Helper.affineTransformMakeShear(xShear: 0.0,
                                                              yShear: Constants.tanOfSixDegrees)
        
        /* Тест с добавлением текстового лейбла чтобы лейбл не был скошен (Если понадобится добавить текст к изображению. Данная реализация будет работать, но я бы сделал в виде контейнеров:
         - Перекошенный налево контейнер (внешний)
         - Перекошенный вправо контейнер (внутренний)
         - Изображение во внутреннем контейнере
         - Лейбл во внутреннем контейнере
 
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        imageView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        */
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        updateConstraintsToDefault()
    }
    
    func updateConstraintsToEnlarged(){
        topConstraint.constant = 0
        bottomConstraint.constant = 0
        botLine.isHidden = true
        imageView.transform = Helper.affineTransformMakeShear(xShear: 0.0,
                                                              yShear: 0.0)
        setNeedsLayout()
    }
    
    func updateConstraintsToDefault(){
        topConstraint.constant = -offset
        bottomConstraint.constant = -offset
        botLine.isHidden = false
        imageView.transform = Helper.affineTransformMakeShear(xShear: 0.0,
                                                              yShear: Constants.tanOfSixDegrees)
        setNeedsLayout()
    }
}
