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
        let task = session.dataTask(with: url!) { data, _, error in
            if error != nil {
                print("Error")
            } else if data == nil {
                print("Data null")
            } else {
                print(data!)

                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    if let title = (jsonResponse as AnyObject)["title"]! as? String {
                        print(title)
                    }
                } catch {
                    print("Json Error")
                }
            }
        }
        task.resume()
    }
}
