//
//  ResultViewController.swift
//  swiftQuiz
//
//  Created by Mariana Eri Massaki on 17/06/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var labelAnswered: UILabel!
    @IBOutlet weak var labelCorrect: UILabel!
    @IBOutlet weak var labelWrong: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    var totalCorrectAnswer: Int = 0
    var totalAnswer: Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelAnswered.text = "Perguntas respondidas: \(totalAnswer)"
        labelCorrect.text = "Perguntas corretas: \(totalCorrectAnswer)"
        labelWrong.text = "Perguntas erradas: \(totalAnswer - totalCorrectAnswer)"
        
        let score = totalCorrectAnswer*100/totalAnswer
        labelScore.text = "\(score)%"

    }

    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
