//
//  RCCircularProgressBar.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 05/04/2024.
//

import UIKit

class RCCircularProgressBar: UIView {

    private var backgroundLayer: CAShapeLayer!
    private var progressLayer: CAShapeLayer!
    private var progress: CGFloat = 0
    let moonPhaseView = RCTitleLabel(textAlignment: .center, fontSize: 30)
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            moonPhaseView.text = "🌚"
            setupLayers()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
           setupLayers()
        }
        
    func setupLayers() {
        // Add the moon phase emoji
        addSubview(moonPhaseView)
        
        // Enable Auto Layout for the moon phase emoji
        moonPhaseView.translatesAutoresizingMaskIntoConstraints = false
        
        // Center the moon phase emoji horizontally and vertically within its superview
        NSLayoutConstraint.activate([
            moonPhaseView.centerXAnchor.constraint(equalTo: centerXAnchor),
            moonPhaseView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            heightAnchor.constraint(equalToConstant: 30)
        ])
        
//        // Create and add the background layer
//        backgroundLayer = createCircleLayer(strokeColor: UIColor.lightGray.cgColor, fillColor: UIColor.clear.cgColor)
//        layer.addSublayer(backgroundLayer)
//        
//        // Create and add the progress layer
//        progressLayer = createCircleLayer(strokeColor: UIColor.blue.cgColor, fillColor: UIColor.clear.cgColor)
//        layer.addSublayer(progressLayer)
//        
//        // Update the progress layer
//        updateProgressLayer()
    }


    
    private func createCircleLayer(strokeColor: CGColor, fillColor: CGColor) -> CAShapeLayer{
        let layer = CAShapeLayer()
        // Increase the radius of the circular path
        let radius = frame.size.width / 2 + 20 // Add 10 (or any desired value) to increase the size
            
        
        let circularPath = UIBezierPath(arcCenter: CGPoint( x: bounds.width/2,
                                                            y: bounds.height/2),
                                                   radius: radius / 2,
                                                   startAngle: -CGFloat.pi / 2,
                                                   endAngle: 2 * CGFloat.pi,
                                                   clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor
        layer.lineWidth = 4 // Adjust this value as needed
        layer.fillColor = fillColor
        layer.lineCap = .round // This makes the stroke's corners round
        return layer
    }
    
    private func updateProgressLayer() {
          progressLayer.strokeEnd = progress
      }
    
    func setProgress(to newProgress: CGFloat, animated: Bool = false) {
            progress = newProgress
            if animated {
                let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.duration = 0.5 // Animation duration
                animation.fromValue = progressLayer.strokeEnd
                animation.toValue = progress
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                progressLayer.add(animation, forKey: "progress")
            }
            updateProgressLayer()
        }
}
