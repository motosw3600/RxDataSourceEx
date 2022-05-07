//
//  MainCellData.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import UIKit

enum MainCellData {
    case main(title: String, isFocus: Bool)
    case sub(title: String)
    
    var cellType: MainCellDataProtocol.Type {
        switch self {
        case .main: return MainCell.self
        case .sub: return SubCell.self
        }
    }
}

protocol MainCellDataProtocol: AnyObject {
    func apply(item: MainCellData)
    static func cellHeight(item: MainCellData) -> CGFloat
}
