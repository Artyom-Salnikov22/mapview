//
//  TableViewController.swift
//  mapview
//
//  Created by Артём Сальников on 13.08.2024.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayRest = [Restaurant(imagename: "Merey", name: "Мерей", type: "Банкетный зал", mark: """
                                ⭐⭐⭐⭐ 4.7 - 61 оценка
                                
                                Залы под любое мероприятие, еда, закуски и напитки
                                """, desc: """
                                Ресторан “Мерей” Астана
                                ДОБРО ПОЖАЛОВАТЬ!!
                                💒 Банкетный зал от 60 до 150 персон
                                👨‍🍳Вкусная кухня
                                🏠 Отдельно стоящее здание
                                🚗Удобная парковка
                                📱 +77758480061
                                Проспект Абылай хана, 43/2
                                """, latitude: 51.15472, longitude: 71.49324),
                     Restaurant(imagename: "Lane", name: "Lane", type: "Ресторан", mark: """
⭐⭐⭐⭐ 4.5 - 136 оценок

Кофе к каждому завтраку до 12: 00, 3 пиццы + 1 \"Маргатрита\" в подарок
""", desc: """
Lane, европейская кухня
🔺Yandex.eda & Wolt
🔺Кофе к каждому завтраку до 12:00
▪️Каждый день: 9:00-23:00
Turkestan 28, Astana, Kazakhstan
""", latitude: 51.10194, longitude: 71.42385),
                     Restaurant(imagename: "Brunello", name: "Brunello", type: "Ресторан", mark: """
⭐⭐⭐⭐ 4 - 286 оценок

Летняя терраса - работаем 24/7,  Live vocal - каждый день
""", desc: """
                                BRUNELLO LOUNGE | РЕСТОРАН | ASTANA
                                атмосферный lounge🍸
                                • LIVE VOCAL - каждый день
                                • Работаем 17:00-07:00
                                • -15% на все мероприятия
                                21+ | DC
                                Проспект Мангилик Ел, 47, Akmola, Astana, Kazakhstan 010000
                                """, latitude: 51.09759, longitude: 71.42686),
                     Restaurant(imagename: "Meatador", name: "MeATADOR", type: "Стейк-хаус", mark: """
                                ⭐⭐⭐⭐⭐ 4.8 - 574 оценок
                                
                                MeATADOR -  первый мангал-бар в столице! Живая музыка, караоке
                                """, desc: """
СТЕЙКХАУС | МАНГАЛ-БАР | КАРАОКЕ | АСТАНА
Ресторан барбекю
Стейки, зажженные испанским огнем: где встречаются страсть и пламя
• Мангальные столы
• Караоке VIP-комната
• Вск-ср 13:00-01:00, чт-сб 13:00-02:00
Turan 60, Akmola, Astana, Kazakhstan
""", latitude: 51.10059, longitude: 71.39607)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayRest.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let imageview = cell.viewWithTag(100) as! UIImageView
        imageview.image = UIImage(named: arrayRest[indexPath.row].imagename)
        
        let label = cell.viewWithTag(101) as! UILabel
        label.text = arrayRest[indexPath.row].name
        
        let labelType = cell.viewWithTag(102) as! UILabel
        labelType.text = arrayRest[indexPath.row].type
        
        let labelMark = cell.viewWithTag(103) as! UILabel
        labelMark.text = arrayRest[indexPath.row].mark

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 451
    }
    
    override func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.rest = arrayRest[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
