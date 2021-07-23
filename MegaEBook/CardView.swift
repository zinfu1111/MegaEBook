//
//  CardView.swift
//  MegaEBook
//
//  Created by 連振甫 on 2021/7/23.
//

import UIKit

class CardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
       super.layoutSubviews()
       let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.height * 0.1))
       path.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.2))
       path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
       path.addLine(to: CGPoint(x: 0, y: bounds.height))
       path.close()
       let shapeLayer = CAShapeLayer()
       shapeLayer.path = path.cgPath
       layer.mask = shapeLayer
    }

}
