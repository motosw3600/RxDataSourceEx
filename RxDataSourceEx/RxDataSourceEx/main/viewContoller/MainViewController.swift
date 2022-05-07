//
//  MainViewController.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
