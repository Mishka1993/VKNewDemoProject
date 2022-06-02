//
//  test.swift
//  VKNewGB
//
//  Created by Михаил Киржнер on 02.06.2022.
//

import Foundation
import UIKit

class RenderingView: UIView {
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rendering Bug"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        backgroundColor = .clear
        backgroundView.backgroundColor = .yellow
        layer.borderWidth = 0
        setupLayout()
    }
    private func setupLayout() {
        [shadowView, backgroundView, textLabel].forEach(addSubview)
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        shadowView.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10).isActive = true
        textLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10).isActive = true
    }
    override func draw(_ rect: CGRect) {
        shapeBackground()
    }
    private func shapeBackground() {
        let tailLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: backgroundView.bounds.minX,
                                                          y: backgroundView.bounds.minY,
                                                          width: backgroundView.bounds.width,
                                                          height: backgroundView.bounds.height - 12),
                                      cornerRadius: 8)
        let shadowBezierPath = UIBezierPath(roundedRect: CGRect(x: backgroundView.bounds.minX + 5,
                                                                y: backgroundView.bounds.minY + 10,
                                                                width: backgroundView.bounds.width - 10,
                                                                height: backgroundView.bounds.height - 12 - 10),
                                            cornerRadius: 8)
        [bezierPath, shadowBezierPath].forEach {
            $0.move(to: CGPoint(x: backgroundView.bounds.midX - 12, y: backgroundView.bounds.maxY - 12))
            $0.addLine(to: CGPoint(x: backgroundView.bounds.midX, y: backgroundView.bounds.maxY))
            $0.addLine(to: CGPoint(x: backgroundView.bounds.midX + 12, y: backgroundView.bounds.maxY - 12))
            $0.fill()
            $0.close()
        }
        tailLayer.path = bezierPath.cgPath
        tailLayer.fillColor = UIColor.white.cgColor
        shadowView.layer.shadowPath = shadowBezierPath.cgPath
        shadowView.layer.cornerRadius = 8
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.mask = tailLayer
    }
}
