//
//  mainViewModel.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainViewModelProtocol {
    var sections: Observable<[SectionOfMain]> { get }
}

struct MainViewModel: MainViewModelProtocol {
    var sections: Observable<[SectionOfMain]>
    
    init() {
        sections = .just([
            SectionOfMain(items: [
                .main(title: "main1", isFocus: true),
                .main(title: "main2", isFocus: false),
                .sub(title: "sub1"),
                .sub(title: "sub2"),
                .sub(title: "sub3")
            ])
        ])
    }
}
