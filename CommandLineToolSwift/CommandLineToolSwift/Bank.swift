//
//  Bank.swift
//  CommandLineToolSwift
//
//  Created by Mateus Campos on 11/04/16.
//  Copyright © 2016 Mateus Campos. All rights reserved.
//

import Foundation


class Bank {
    func manage(accounts:[Account], transactions:[Transaction]) -> [Account] {
        
        for acc in accounts {
            for transaction in transactions {
                if acc.account == transaction.account {
                    acc.ammount = acc.ammount!+transaction.transaction!
                }
            }
        }
        
        return accounts
    }
}