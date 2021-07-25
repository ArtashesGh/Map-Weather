//
//  UIView+Ext.swift
//  Map Weather
//
//  Created by Artashes Noknok on 7/25/21.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - Loader view

let spinner = UIStoryboard.main.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
let loadingView = spinner.view
extension UIView {
    func showLoader() {
        let currentWindow: UIWindow? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        currentWindow?.addSubview(loadingView!)
    }

    func removeLoader() {
        loadingView!.removeFromSuperview()
    }

    func animate(show: Bool, duration: TimeInterval, completion: @escaping ((Bool) -> Void) = {_ in }) {
        if show {
            alpha = 0.0
            isHidden = false
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1.0
            }, completion: { (finished) in
                completion(finished)
            })
            return
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: { (finished) in
            self.isHidden = true
            completion(finished)
        })
    }
}
