//
//  CityLocatorUITests.swift
//  CityLocatorUITests
//
//  Created by Ivan Alexander Valero on 08/08/2024.
//

import XCTest

final class CityLocatorUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let cityNavigationBar = app.navigationBars["Ciudades"]
        let citySearchField = cityNavigationBar.searchFields["Buscar ciudades..."]
        let cityButton = app.buttons["city-row-\("Lichtenrade")"]
        let moreInfoButton = app.buttons["more-info"]
        
        citySearchField.tap()
        citySearchField.typeText("Lichtenrade")
        cityButton.tap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"VKPointFeature").element.swipeRight()/*[[".maps.containing(.other, identifier:\"Roter Dudel\").element",".swipeUp()",".swipeRight()",".maps.containing(.other, identifier:\"Waldblick\").element",".maps.containing(.other, identifier:\"Nachtbucht\").element",".maps.containing(.other, identifier:\"Lichtenrade\").element",".maps.containing(.other, identifier:\"Buckow\").element",".maps.containing(.other, identifier:\"dm\").element",".maps.containing(.other, identifier:\"VKPointFeature\").element"],[[[-1,8,1],[-1,7,1],[-1,6,1],[-1,5,1],[-1,4,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.buttons["Mas info sobre Lichtenrade"].tap()
        app.navigationBars["Detalles de la Ciudad"]/*@START_MENU_TOKEN@*/.buttons["Close"]/*[[".otherElements[\"Close\"].buttons[\"Close\"]",".buttons[\"Close\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testFlowApp() throws {
        let app = XCUIApplication()
        app.launch()
        
        let cityNavigationBar = app.navigationBars["Ciudades"]
        let citySearchField = cityNavigationBar.searchFields["Buscar ciudades..."]
        
        citySearchField.tap()
        citySearchField.typeText("Za")
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Zavety Il’icha, RU"]/*[[".buttons[\"Zavety Il’icha, RU, Lon:  37,849998, Lat:  56,049999\"].staticTexts[\"Zavety Il’icha, RU\"]",".buttons[\"city-row-Zavety Il’icha\"].staticTexts[\"Zavety Il’icha, RU\"]",".staticTexts[\"Zavety Il’icha, RU\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"VKPointFeature").element/*[[".maps.containing(.other, identifier:\"Rp Pravdinskiy\").element",".maps.containing(.other, identifier:\"VKPointFeature\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        app.buttons["Mas info sobre Zavety Il’icha"].tap()
        app.navigationBars["Detalles de la Ciudad"]/*@START_MENU_TOKEN@*/.buttons["Close"]/*[[".otherElements[\"Close\"].buttons[\"Close\"]",".buttons[\"Close\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
}
