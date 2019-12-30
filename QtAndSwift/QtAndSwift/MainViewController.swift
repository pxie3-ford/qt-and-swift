//
//  MainViewController.swift
//  QtAndSwift
//
//  Created by Xie, Peng (P.) on 12/27/19.
//  Copyright © 2019 Qt Project. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var qtContainerView: NSView!

    var isQtViewLoaded: Bool = false
    var qtView: NSView?

    override func viewDidLoad() {
        super.viewDidLoad()

        qtContainerView.wantsLayer = true
        qtContainerView.layer?.backgroundColor = .white
    }
    
    @IBAction func loadDestroyButtonDidPushed(_ sender: Any) {
        if let qtView = qtView {
            destroyQtApplicationView(qtView)
            self.qtView = nil
        } else {
            qtView = createQtApplicationView()
            guard let qtView = qtView else { return }
            qtContainerView.addSubview(qtView)
            qtView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                qtView.leadingAnchor.constraint(equalTo: qtContainerView.leadingAnchor),
                qtView.topAnchor.constraint(equalTo: qtContainerView.topAnchor),
                qtView.rightAnchor.constraint(equalTo: qtContainerView.rightAnchor),
                qtView.bottomAnchor.constraint(equalTo: qtContainerView.bottomAnchor)
            ])
        }
    }
}
