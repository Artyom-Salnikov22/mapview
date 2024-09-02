//
//  MapViewController.swift
//  mapview
//
//  Created by Артём Сальников on 22.08.2024.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var places = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let restPlaces = CLLocationCoordinate2D(latitude: places.latitude, longitude: places.longitude)
        // Do any additional setup after loading the view.
                mapView.delegate = self
                locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
        
        // Проверяем статус разрешения
                if CLLocationManager.locationServicesEnabled() {
                    mapView.showsUserLocation = true
                    locationManager.startUpdatingLocation()
                } else {
                    // Обработка случая, когда услуги определения местоположения отключены
                    print("Location services are not enabled")
                }
        
        // Устанавливаем область отображения карты
               let region = MKCoordinateRegion(center: restPlaces, latitudinalMeters: 1000, longitudinalMeters: 1000)
               mapView.setRegion(region, animated: true)
               
               // Создаем аннотацию
               let annotation = MKPointAnnotation()
               annotation.coordinate = restPlaces
               annotation.title = places.name
               
               // Добавляем аннотацию на карту
               mapView.addAnnotation(annotation)
           }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let restPlaces = CLLocationCoordinate2D(latitude: places.latitude, longitude: places.longitude)
        // Получаем текущее местоположение пользователя
               if let userLocation = locations.last {
                   // Обновляем область карты с учетом местоположения пользователя
                   let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                   mapView.setRegion(region, animated: true)
                   
                   drawRoute(from: userLocation.coordinate, to: restPlaces)
               }
    }
    
    func drawRoute(from sourceCoordinate: CLLocationCoordinate2D, to destinationCoordinate: CLLocationCoordinate2D) {
            let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
            let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
            
            let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
            
            let directionsRequest = MKDirections.Request()
            directionsRequest.source = sourceMapItem
            directionsRequest.destination = destinationMapItem
            directionsRequest.transportType = .walking
            
            let directions = MKDirections(request: directionsRequest)
            directions.calculate { [weak self] response, error in
                guard let self = self else { return }
                guard let response = response else {
                    if let error = error {
                        print("Error calculating directions: \(error.localizedDescription)")
                    }
                    return
                }
                
                // Удаляем старые маршруты
                self.mapView.removeOverlays(self.mapView.overlays)
                
                // Получаем маршрут и добавляем его на карту
                for route in response.routes {
                    self.mapView.addOverlay(route.polyline)
                    
                    // Устанавливаем область отображения карты, чтобы был виден маршрут
                    let rect = route.polyline.boundingMapRect
                    self.mapView.setVisibleMapRect(rect, animated: true)
                }
            }
        }

        // MARK: - MKMapViewDelegate

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor.red
                renderer.lineWidth = 5.0
                return renderer
            }
            return MKOverlayRenderer()
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
