//
//  File.swift
//  
//
//  Created by Boobalan on 7/12/23.
//

import Foundation

extension String {
    public func fromLocalization(bundle:Bundle)->String {
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
