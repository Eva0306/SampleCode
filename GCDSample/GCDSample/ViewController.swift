//
//  ViewController.swift
//  GCDSample
//  GCD Group, GCD Barrier, GCD Timer
//
//  Created by 楊芮瑊 on 2024/8/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    let attributes: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Futura", size: 40)!
    ]
    
    var NStimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NStimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(NStimerFired), userInfo: nil, repeats: true)
    }
    
    @objc func NStimerFired() {
        print("+1")
    }
    
    deinit {
        // 當 ViewController 被釋放時，記得停止定時器以避免內存洩漏!!
        NStimer?.invalidate()
    }
    
// MARK: - GCD Group
    @IBAction func startToRun1() {
        let group: DispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent)
        let queue2 = DispatchQueue(label: "queue2", attributes: .concurrent)
        
        queue1.async(group: group) {
            // 任務A
            for i in 1 ... 10 {
                print("🧡: \(i)")
            }
            print("Mission A => \(Thread.current)")
        }
        
        group.wait()
        
        queue2.async(group: group) {
            // 任務B
            for j in 11 ... 20 {
                print("🩵: \(j)")
            }
            print("Mission B => \(Thread.current)")
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("處理完成任務A和任務B")
        }
    }
    
    @IBAction func startToRun2() {
        let group: DispatchGroup = DispatchGroup()
        let subGroup: DispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent)
        let queue2 = DispatchQueue(label: "queue2", attributes: .concurrent)
        let queue3 = DispatchQueue(label: "queue3", attributes: .concurrent)
        
        group.enter()
        print("任務A開始")
        queue1.async(group: group) {
            // 任務A
            for i in 1 ... 10 {
                print("🧡: \(i)")
            }
            print("Mission A => \(Thread.current)")
            group.leave()
        }
        
        
        group.enter()
        print("任務B開始")
        queue2.async(group: group) {
            // 任務B
            for j in 11 ... 20 {
                print("🩵: \(j)")
            }
            print("Mission B => \(Thread.current)")
            
            subGroup.enter()
            print("子任務B-1開始")
            queue3.async {
                // 任務B-1
                for k in 21 ... 30 {
                    print("💜: \(k)")
                    sleep(1)
                }
                print("完成子任務B-1")
                subGroup.leave()
            }
            
            subGroup.notify(queue: .main) {
                print("任務B完成")
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("處理完成任務A和任務B")
        }
        
    }
    
// MARK: - GCD Barrier
    @IBAction func startToRun3() {
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        var sharedData = [String]()
        
        // 提交多個讀取任務
        for i in 1...5 {
            queue.async {
                readData(tag: i)
            }
        }
        
        // 提交多個寫入任務
        for i in 1...3 {
            queue.async(flags: .barrier) {
                writeData(data: "Data \(i)")
            }
        }
        
        // 提交其他讀取任務
        for i in 6...10 {
            queue.async {
                readData(tag: i)
            }
        }
        
        func readData(tag: Int) {
            // 模擬讀取數據的延遲
            sleep(1)
            print("讀取數據 \(tag): \(sharedData)")
        }
        
        func writeData(data: String) {
            // 模擬寫入數據的延遲
            print("寫入數據: \(data)")
            sleep(1) // 模擬寫入操作需要的時間
            sharedData.append(data)
            print("完成寫入數據: \(data)")
        }
    }
    
    
    //MARK: - GCD Timer
    var timer: DispatchSourceTimer?
    var isRunning = false
    var elapsedTime: Int = 0
    
    @IBAction func startToRun4(_ sender: UIButton) {
        
        if isRunning {
            stopTimer()
            timerButton.setAttributedTitle(
                NSAttributedString(string: "Start", attributes: attributes),
                for: .normal
            )
        } else {
            startTimer()
            timerButton.setAttributedTitle(
                NSAttributedString(string: "Pause", attributes: attributes),
                for: .normal
            )
        }
        isRunning.toggle()
    }
    
    @IBAction func resetTimeLabel(_ sender: Any) {
        stopTimer()
        elapsedTime = 0
        updateTimeLabel()
        isRunning = false
        timerButton.setAttributedTitle(
            NSAttributedString(string: "Start", attributes: attributes),
            for: .normal
        )
    }
    
    func startTimer() {
        
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        
        // 創建 DispatchSourceTimer
        timer = DispatchSource.makeTimerSource(queue: queue)
        
        // 設定定時器
        timer?.schedule(deadline: .now(), repeating: .seconds(1))
        
        // 設定定時器事件處理
        timer?.setEventHandler { [weak self] in
            DispatchQueue.main.async {
                self?.elapsedTime += 1
                self?.updateTimeLabel()
            }
        }
        
        // 開始定時器
        timer?.resume()
    }
    
    func stopTimer() {
        // 停止定時器
        timer?.cancel()
        timer = nil
    }
    
    func updateTimeLabel() {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}






