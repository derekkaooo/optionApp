//
//  ViewController.swift
//  optionApp
//
//  Created by Derek on 2018/7/28.
//  Copyright © 2018年 Derek. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

struct Qna{
    var question:String
    var answer:[String]
    var correctAnwer:Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myQuestion: UILabel!
    @IBOutlet weak var myQuestionNumber: UILabel!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet var selectedButton: [UIButton]!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var mynextButton: UIButton!
    
    @IBOutlet weak var restartbutton: UIButton!
    
    @IBOutlet weak var firstImage: UILabel!
    
    @IBOutlet weak var tangImage: UIImageView!
 
    var audioPlayer:AVAudioPlayer?
    
    //題數
    var topicNumber = 0
    //正確答案
    var correctAnswerNumber = 0
    //分數
    var score = 0
    //不超過總題數
    var waringNumber = 0
    
    var questionArray = [Qna(question: "下列何者非唐朝人普遍對父親的稱呼？", answer: ["1. 耶耶","3. 大人","2. 哥哥","4. 爸爸"], correctAnwer: 4),Qna(question: "下列何者非唐代女性的自稱語？", answer: ["1. 兒","3. 僕","2. 奴","4. 妾"], correctAnwer: 3),Qna(question: "在唐代，家裡早餐一般吃的是餺飥或粥。所謂的餺飥也就是麵片湯。請問餺飥又稱為什麼？", answer: ["1. 胡餅","3. 蒸餅","2. 索餅","4. 煎餅"], correctAnwer: 2),Qna(question: "從《唐律卷十五·廄庫》：「主自殺馬牛者，徒一年。」可知唐代是禁止殺死馬及牛的。請問唐朝人最常吃的肉類為？", answer: ["1. 羊肉","3. 牛肉","2. 鴨肉","4. 雞肉"], correctAnwer: 1),Qna(question: "唐朝時，許多國家喜歡進貢鸚鵡至長安。玄宗年間，李隆基曾養過一隻聰慧的白色鸚鵡，不但見棋局不妙時能幫陛下「賴棋」，楊貴妃還教會牠念經。請問這隻白色鸚鵡叫什麼名字呢？", answer: ["1. 白雪球","3. 白衣使者","2. 雪衣娘","4. 雪東青"], correctAnwer: 2),Qna(question: "驪山多溫泉，「驪山晚照」更為長安八景之一。請問下列何者不是唐朝時對驪山行宮的命名？", answer: ["1. 湯泉宮","3. 華清宮","2. 溫泉宮","4. 驪山宮"], correctAnwer: 4)]
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {

        myQuestion.isHidden = false
        mynextButton.setTitle("next", for: .normal)
        myQuestion.text = questionArray[waringNumber].question
        correctAnswerNumber = questionArray[waringNumber].correctAnwer
   
        //用迴圈把答案選項放入按鈕,selectedButton是一個outlet collection
        for i in 0 ..< selectedButton.count{
selectedButton[i].setTitle(questionArray[waringNumber].answer[i], for: .normal)
        }
        
        waringNumber += 1
        topicNumber += 1
        myQuestionNumber.text = "第\(topicNumber)題"
        
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        myQuestionNumber.isHidden = false
        firstImage.isHidden = true
    }
    
    
    
    @IBAction func selectedButton1(_ sender: UIButton) {
        
        if correctAnswerNumber == 1{
            score += 10
            myScore.text = "分數： \(score)"
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
        }
        //總共六題，到第六題選項按下去就跳出總分視窗
        if waringNumber == 6{
            waringNumber = 0
            warning()
        }
    }
    
    
    @IBAction func selectedButton2(_ sender: UIButton) {
        
        if correctAnswerNumber == 2{
            score += 10
            myScore.text = "分數： \(score)"
            button1.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
            
        }
        //總共六題，到第六題選項按下去就跳出總分視窗
        if waringNumber == 6{
            waringNumber = 0
            warning()
        }
       
    }
    
    @IBAction func selectedButton3(_ sender: UIButton) {
        if correctAnswerNumber == 3{
            score += 10
            myScore.text = "分數： \(score)"
            button1.isHidden = true
            button2.isHidden = true
            button4.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
        }
        //總共六題，到第六題選項按下去就跳出總分視窗
        if waringNumber == 6{
            waringNumber = 0
            warning()
        }
        
    }
    
    @IBAction func selectedButton4(_ sender: UIButton) {
        if correctAnswerNumber == 4{
            score += 10
            myScore.text = "分數： \(score)"
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
            
        }
     //總共六題，到第六題選項按下去就跳出總分視窗
        if waringNumber == 6{
            waringNumber = 0
            warning()
        }
    }
    
    
    //重玩
    func reStart(){
        
        myQuestion.isHidden = true
        myQuestionNumber.isHidden = true
        firstImage.isHidden = false
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        topicNumber = 0
        score = 0
        myScore.text = "分數： ---"
        
        
    }
    
    //加入警告控制器
    func warning () {
        var myScore = ""
        if  score <= 30{
            myScore = "歷史有點爛，再多練練吧！"
        }else if score >= 40{
            myScore = "你是歷史小達人！"
        }
        let alert =  UIAlertController(title: myScore, message: "\(score)分", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.reStart()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //畫面讀入時取亂數(不會重複題目)
        questionArray.shuffle()
        
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        
        guard let newpath = Bundle.main.path(forResource: "軒轅劍參 - 音樂故事集雲和山的彼端CD1-40.大唐帝國", ofType: "mp3") else {
            print("no such path")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: newpath))
        }catch{
            print(error.localizedDescription)
            
        }
        audioPlayer?.play()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

