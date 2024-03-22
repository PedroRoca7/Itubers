//
//  PixViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/03/24.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class PixViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
//    lazy var viewScreen: PixView = {
//        let view = PixView()
//        view.backgroundColor = .azulClaro
//        return view
//    }()
    
    private var viewModel: PixViewModeling
    
    // MARK: Inits
    
    init(viewModel: PixViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func loadView() {
//        self.view = viewScreen
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        tappedButtonMakePix()
    }
}

private extension PixViewController {
    func tappedButtonMakePix() {
//        viewScreen.makePixButton.rx.tap.bind {
//            guard let name = self.viewScreen.nameReceivePixTextField.text, !name.isEmpty,
//                  let value = self.viewScreen.valuePixTextField.text, !value.isEmpty,
//                  let description = self.viewScreen.descriptionTextField.text, !description.isEmpty
//            else {  self.showBasicAlert(title: "Erro", message: "Preencha todos os campos.", viewController: self) {}
//                return }
//            let valueNegative = Double(value)
//            self.viewModel.makePix(modelInformations: ExtractModel(id: 0, type: 1, about: description, amount: -(valueNegative ?? 0.0)))
//        }.disposed(by: disposeBag)
    }
}

extension PixViewController: PixViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.showBasicAlert(title: "Sucesso", message: "Pix realizado com sucesso", viewController: self) {
                
            }
        }
    }
    
    func failure() {
        DispatchQueue.main.async {
            self.showActionSheet(title: "Erro", message: "Erro ao realizar Pix", viewController: self) { result in
                if result == false {
                    
                }
            }
        }
    }
}
extension PixViewController: AlertProtocol {}

