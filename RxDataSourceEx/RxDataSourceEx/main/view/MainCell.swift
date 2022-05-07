//
//  mainCell.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import UIKit
import SnapKit

class MainCell: UITableViewCell, MainCellDataProtocol {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "main"
        label.textColor = .purple
        label.font = .systemFont(ofSize: 20)
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
        guard case let .main(title, isFocus) = item else { return }
        titleLabel.text = title
        
        titleLabel.font = isFocus ? .boldSystemFont(ofSize: 20) : .systemFont(ofSize: 20)
    }
    
    static func cellHeight(item: MainCellData) -> CGFloat {
        return 70
    }
}
