//
//  Alert.swift
//  PrimeiroAppMVVM
//
//  Created by user218997 on 27/12/22.
//

import UIKit

class Alert {
    
    private let controller: UIViewController

    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
    
}
