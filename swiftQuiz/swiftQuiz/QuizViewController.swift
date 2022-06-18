//
//  QuizViewController.swift
//  swiftQuiz
//
//  Created by Mariana Eri Massaki on 17/06/22.
//

import UIKit

class QuizViewController: UIViewController {

    
    @IBOutlet weak var viewTimer: UIView!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet var buttonAnswers: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear) {
            self.viewTimer.frame.size.width = 0
        } completion: { (success) in
            self.showResults()
        }
        
        getNewQuiz()
        
    }
    
    func getNewQuiz() {
        
        quizManager.refreshQuiz()
        labelQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count{
            let option = quizManager.options[i]
            let button = buttonAnswers[i]
            button.setTitle(option, for: .normal)
        }
        
    }
    
    func showResults() {
        
        performSegue(withIdentifier: "resultSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController = segue.destination as! ResultViewController
        
        resultViewController.totalAnswer = quizManager.totalAnswer
        resultViewController.totalCorrectAnswer = quizManager.totalCorrectAnswer
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        
        let index = buttonAnswers.index(of: sender)!
        quizManager.validadeAnswer(index: index)
        getNewQuiz()
    }
    
}
