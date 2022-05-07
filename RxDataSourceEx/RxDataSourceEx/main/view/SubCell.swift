//
//  SubCell.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import UIKit
import SnapKit

class SubCell: UITableViewCell, MainCellDataProtocol {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "sub"
        label.textColor = .purple
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func apply(item: MainCellData) {
        guard case let .sub(title) = item else { return }
        titleLabel.text = title
    }
    
    static func cellHeight(item: MainCellData) -> CGFloat {
        return 50
    }
}
