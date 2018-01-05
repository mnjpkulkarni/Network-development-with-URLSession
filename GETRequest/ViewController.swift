//
//  ViewController.swift
//  GETRequest
//
//  Created by Manoj Kulkarni on 1/3/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchUrl(url: "https://rmala.org/wp-content/uploads/2017/12/punisher.jpg")
    }

    func fetchUrl(url : String){
        if let urlToServer = URL.init(string: url){
            let task = URLSession.shared.downloadTask(with: urlToServer, completionHandler: { (fileUrl, response, error) in
                ////URLSession.shared.dataTask -> For JSON response
                if error != nil || fileUrl == nil {
                    //Error Handling
                }
                
                else if let data = try? Data.init(contentsOf: fileUrl!){
                    //Task 1: Print the contents
//                    if let responseString = String.init(data: data!, encoding: .ascii){
//                        print(responseString)
//                    }
                    
                    //Task 2: Parse the data as JSON instead
                    
//                    if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments){
//                        if jsonObj is [Any] {
//                            print("Array:\(jsonObj)")
//                        }
//                        if jsonObj is [String:Any]{
//                            print("Dict:\(jsonObj)")
//                        }
//                    }
                    
                    //Task 3: Download the image by changing the URL
                    
                    let imageFromServer = UIImage.init(data: data)
                    let imageView = UIImageView.init(frame: self.view.frame)
                    imageView.image = imageFromServer
                    imageView.contentMode = .scaleAspectFill
                    DispatchQueue.main.async {             //Async thread to display in the main thread
                        self.view.addSubview(imageView)
                    }
                    
                }
            })
            task.resume()
        }
        
    }
}

