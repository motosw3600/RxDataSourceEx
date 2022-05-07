//
//  SectionOfMain.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import RxDataSources

struct SectionOfMain {
    var items: [Item]
}

extension SectionOfMain: SectionModelType {
    typealias Item = MainCellData
    
    init(original: Self, items: [Item]) {
        self = original
        self.items = items
    }
}
