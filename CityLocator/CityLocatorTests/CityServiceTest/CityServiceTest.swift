//
//  CityServiceTest.swift
//  CityLocatorTests
//
//  Created by Ivan Alexander Valero on 08/08/2024.
//

import XCTest
@testable import CityLocator

final class CityServiceTests: XCTestCase {
    var cityService: CityService!
    var cityServiceMock: CityServiceMock!

    override func setUp() {
        super.setUp()
        cityService = CityService()
        cityServiceMock = CityServiceMock()
    }

    override func tearDown() {
        cityService = nil
        cityServiceMock = nil
        super.tearDown()
    }

    func testFetchCitiesSuccess() async throws {
        // Llamada al servicio real
        let cities = try await cityService.fetchCities()
        
        // Asegurarse de que los datos se recibieron correctamente
        XCTAssertFalse(cities.isEmpty, "The list should not be empty")
        XCTAssertTrue(cities.count > 0)
    }

    func testFetchCitiesMockSuccess() async throws {
        // Configurar mock para no devolver error
        cityServiceMock.shouldReturnError = false
        
        // Llamada al servicio mock
        let cities = try await cityServiceMock.fetchCities()

        // Asegurarse de que los datos del mock se recibieron correctamente
        XCTAssertFalse(cities.isEmpty, "The list should not be empty")
        XCTAssertEqual(cities.first?.name, "Lichtenrade", "The name of the first city should be the same as this one.")
    }
    
    func testFetchCitiesMockFailure() async throws {
        cityServiceMock.shouldReturnError = true
        
        do {
            _ = try await cityServiceMock.fetchCities()
            XCTFail("Se esperaba un fracaso pero se consiguió el éxito")
        } catch {
            XCTAssertTrue(error is CityServiceMock.MockError, "Simulated error")
        }
    }
    
    func testCityServiceErrorHandling() async {
        let mockService = CityServiceMock()
        mockService.shouldReturnError = true
        
        let viewModel = CityViewModel(cityService: mockService)
        
        await viewModel.loadCities()
        
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "An error occurred")

        let view = await CityListView(viewModel: viewModel)
        XCTAssert(viewModel.isLoading == false)
        
    }
}
