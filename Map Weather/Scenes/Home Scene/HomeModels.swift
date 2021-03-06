//
//  HomeModels.swift
//  Map Weather
//
//  Created by Artashes Noknok on 7/25/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Home
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
        var lat: String
        var lon: String
        
    }
    struct Response
    {
        var weatherModel:WeatherModel
    }
    struct ViewModel
    {
        var weattherDispModel:WeatherDispModel
        
    }
  }
}
