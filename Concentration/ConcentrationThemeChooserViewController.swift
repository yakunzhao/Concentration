//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Yakun on 2020/3/15.
//  Copyright © 2020 Yakun. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sport":"⚽️🏀🏈🎾⛸⛷🏄‍♂️🏂🧘🏻‍♂️",
        "Food":"🍤🍕🍙🌮🍩🍪🍍🍗",
        "Party":"🦖🐙🦑🦞🐍🐢🦋🦄🐘🐌"
    ]

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
                
            }
        }
    }
    

}
