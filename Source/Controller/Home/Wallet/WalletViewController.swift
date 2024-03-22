//
//  WalletViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit
import RxSwift
import RxCocoa

final class WalletViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    lazy var viewScreen: WalletView = {
        let element = WalletView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var coordinator: WalletCoordinator
    
    init(coordinator: WalletCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertMoneyButtonTapped()
    }
    
    private func insertMoneyButtonTapped() {
        viewScreen.insertMoneyButton.button.rx.tap.bind {
            self.coordinator.showInsertMoneyScreen()
        }.disposed(by: disposeBag)
    }
    
}
