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
        XCTAssertFalse(cities.isEmpty, "La lista no deberia ser vacia")
        XCTAssertTrue(cities.count > 0)
    }

    func testFetchCitiesMockSuccess() async throws {
        // Configurar mock para no devolver error
        cityServiceMock.shouldReturnError = false
        
        // Llamada al servicio mock
        let cities = try await cityServiceMock.fetchCities()

        // Asegurarse de que los datos del mock se recibieron correctamente
        XCTAssertFalse(cities.isEmpty, "La lista no deberia ser vacia")
        XCTAssertEqual(cities.first?.name, "Lichtenrade", "El nombre de la primera ciudad deberia ser igual a esta.")
    }
    
    func testFetchCitiesMockFailure() async throws {
        cityServiceMock.shouldReturnError = true
        
        do {
            _ = try await cityServiceMock.fetchCities()
            XCTFail("Se esperaba un fracaso pero se consiguió el éxito")
        } catch {
            XCTAssertTrue(error is CityServiceMock.MockError, "Erros simulado")
        }
    }
    
    func testCityServiceErrorHandling() async {
        let mockService = CityServiceMock()
        mockService.shouldReturnError = true
        
        let viewModel = CityViewModel(cityService: mockService)
        
        await viewModel.loadCities()
        
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "A ocurrido un error")
  
        let view = await CityListView(viewModel: viewModel)
        XCTAssert(viewModel.isLoading == false)
        
    }
}
