//
//  TabBarController.swift
//  TaxAppeal
//
//  Created by Ryan on 31/01/2020.
//  Copyright © 2020 BRS. All rights reserved.
//

import UIKit
import CBFlashyTabBarController
import KeychainAccess

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tb1 = BATabBarItem(image: UIImage(named: "houses")!, selectedImage: UIImage(named: "houses-selected")!)
//        let baTabBarController = BATabBarController()
//        baTabBarController.viewControllers = [vc1]
//        baTabBarController.tabBarItems = [tb1]
//        baTabBarController.delegate = self
//        print("hello")
//        self.view.addSubview(baTabBarController.view)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let neighborhood = HouseViewController()
        neighborhood.tabBarItem = UITabBarItem()
        neighborhood.tabBarItem.title = "Neighborhood"
        neighborhood.tabBarItem.image = UIImage(named: "houses") as UIImage?
        let myHome = MyHomeViewController()
        myHome.tabBarItem = UITabBarItem()
        myHome.tabBarItem.title = "My Home"
        myHome.tabBarItem.image = UIImage(systemName: "person.circle")
//        myHome.tabBarItem.image = UIImage(named: "my-house") as UIImage?
        let action = ActionController()
        action.tabBarItem = UITabBarItem()
        action.tabBarItem.title = "Take Action"
        action.tabBarItem.image = UIImage(systemName: "wrench")
        let tbc = CBFlashyTabBarController()
        tbc.viewControllers = [neighborhood, myHome, action]
        tbc.modalPresentationStyle = .fullScreen
        let keychain = Keychain(service: "com.brs.TaxAppeal")
        let address = try? keychain.get("address")
        self.present(tbc, animated: false, completion: nil)
//        print(address)
        if(address == nil || address == "" ){
            let evc = WelcomeAddressController()
            tbc.present(evc, animated: true, completion: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
