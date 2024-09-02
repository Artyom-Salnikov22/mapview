//
//  ViewController.swift
//  mapview
//
//  Created by Артём Сальников on 13.08.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelMark: UILabel!
    @IBOutlet weak var descName: UILabel!
    
    var rest = Restaurant()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        
        imageView.image = UIImage(named: rest.imagename)
        labelName.text = rest.name
        labelMark.text = rest.mark
        descName.text = rest.desc
        
        let locations = CLLocationCoordinate2D(latitude: rest.latitude, longitude: rest.longitude)
        // Устанавливаем область отображения карты
               let region = MKCoordinateRegion(center: locations, latitudinalMeters: 1000, longitudinalMeters: 1000)
               mapView.setRegion(region, animated: true)
               
               // Создаем аннотацию
               let annotation = MKPointAnnotation()
               annotation.coordinate = locations
               annotation.title = rest.name
               
               // Добавляем аннотацию на карту
               mapView.addAnnotation(annotation)
           }
    
    @IBAction func openMapBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapv = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        mapv.places = rest
        
        navigationController?.show(mapv, sender: self)
    }
            
        
    }
    




