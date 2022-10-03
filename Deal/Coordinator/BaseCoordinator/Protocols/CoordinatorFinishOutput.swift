//
//  CoordinatorFinishOutput.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

import Foundation

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}
