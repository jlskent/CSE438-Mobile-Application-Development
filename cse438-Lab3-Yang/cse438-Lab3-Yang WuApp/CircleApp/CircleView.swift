//
//  CircleView.swift
//  CircleApp
//
//  Created by Todd Sproull on 9/20/17.
//  Copyright © 2017 Todd Sproull. All rights reserved.
//


import UIKit

class CircleView: UIView {
    
    
    var theCircle = Circle(center: [CGPoint.zero], radius: 3.0, color: UIColor.black, fillSwitch: false) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    var lines:[Circle] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    var theDot = Circle(center: [CGPoint.zero], radius: 3.0, color: UIColor.black, fillSwitch: false) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    var dots:[Circle] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
//        if (theCircle == nil) {
//        return
//        }
//        print(lines.count)
        for line in lines {
            drawCircle(line)
        }
        for dot in dots {
            drawDot(dot)
        }
        drawCircle(theCircle)
        drawDot(theDot)

    }
    
    func drawCircle(_ line: Circle) {
        
        if line.fillSwitch == false{
            let lineWeight = line.radius
            let color = line.color
            let path = createQuadPath(points: (line.center))
            path.lineWidth = lineWeight
            color.setStroke()
            path.stroke()
//            print(line.fillSwitch)

        }

        else {
            let lineWeight = line.radius
            let color = line.color
            let path = createQuadPath(points: (line.center))
            path.lineWidth = lineWeight
           color.setFill()
           path.fill()
//            print(line.fillSwitch)

        }
    }
    
  

    
    func drawDot(_ dot: Circle) {
        if dot.fillSwitch == true {
        return
        }
        let lineWeight = dot.radius
        let color = dot.color
        let path = theDotPoint(location: (dot.center[0]))
//        color.setStroke()
        color.setFill()
        path.addArc(withCenter: dot.center[0], radius: lineWeight/2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        path.fill()
//        path.stroke()
    }
    
    
    
    
    
//
    
    func theDotPoint(location: CGPoint) -> UIBezierPath{
//        let dotPoint = location[0]
//        UIColor.green.setFill()
        let path = UIBezierPath()
//        print(path)
//        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
//        path.fill()
//        UIColor.black.setStroke()
//        path.stroke()
    return path
    }
    
    

    
//    this is the code for beizer the first is helping the second
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let x = (first.x + second.x) / 2
        let y = (first.y + second.y) / 2
        return CGPoint(x: x, y: y)
        // implement this function here
    }

    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
//            calling midpoint func
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }
    
    
}

