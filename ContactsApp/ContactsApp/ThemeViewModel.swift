//
//  ThemeViewModel.swift
//  ContactsApp
//
//  Created by Mohammad Sabbagh on 18/06/2025.
//

import Foundation
import SwiftUI

class ThemeViewModel: ObservableObject
{
    @Published var selectedTheme: String = "System"
    
    var currentColorScheme: ColorScheme?
    {
        switch selectedTheme
        {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
                return nil
        }
    }
}
