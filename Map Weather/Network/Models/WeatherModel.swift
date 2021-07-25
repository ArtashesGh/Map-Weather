//
//  WeatherModel.swift
//  Map Weather
//
//  Created by Artashes Noknok on 7/25/21.
//

import Foundation

// MARK: - Response
struct WeatherModel: Codable {
    let rh: Double?
    let pod: String?
    let lon: Double?
    let pres: Double?
    let timezone, obTime, countryCode: String?
    let clouds, ts: Double?
    let solarRAD: Double?
    let stateCode, cityName: String?
    let windSpd: Double?
    let windCdirFull, windCdir: String?
    let slp: Double?
    let vis: Double?
    let  hAngle: Double?
    let sunset: String?
    let dni, dewpt: Double?
    let snow: Double?
    let uv: Double?
    let precip, windDir: Double?
    let sunrise: String?
    let ghi, dhi: Double?
    let aqi: Double?
    let lat: Double?
    let weather: Weather?
    let datetime: String?
    let temp: Double?
    let station: String?
    let elevAngle, appTemp: Double?

    enum CodingKeys: String, CodingKey {
        case rh, pod, lon, pres, timezone
        case obTime = "ob_time"
        case countryCode = "country_code"
        case clouds, ts
        case solarRAD = "solar_rad"
        case stateCode = "state_code"
        case cityName = "city_name"
        case windSpd = "wind_spd"
        case windCdirFull = "wind_cdir_full"
        case windCdir = "wind_cdir"
        case slp, vis
        case hAngle = "h_angle"
        case sunset, dni, dewpt, snow, uv, precip
        case windDir = "wind_dir"
        case sunrise, ghi, dhi, aqi, lat, weather, datetime, temp, station
        case elevAngle = "elev_angle"
        case appTemp = "app_temp"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let icon: String?
    let code: Int?
    let weatherDescription: String?

    enum CodingKeys: String, CodingKey {
        case icon, code
        case weatherDescription = "description"
    }
}

struct WeatherDispModel: Codable {

    let sunset: String
    let countryCode: String
    let temp: Double
    let cityName: String
    let windSpd: Double
}
