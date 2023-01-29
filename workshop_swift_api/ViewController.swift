//
//  ViewController.swift
//  workshop_swift_api
//
//  Created by Levent Kantaroğlu on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func getData() {
        let urlText = "https://jsonplaceholder.typicode.com/todos/1"
        let url = URL(string: urlText)
        let session = URLSession.shared
        var task = session.dataTask(with: url!) { data, _, error in
            if error != nil {
                print("Error")
            } else if data == nil {
                print("Data null")
            } else {
                print(data!)
            }
        }
        task.resume()
    }
}
