//
//  LivePageUpcomingView.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 22/2/23.
//

import UIKit

class LivePageUpcomingView: UIViewController {

    @IBOutlet weak var clockTime: UIImageView!
    @IBOutlet weak var liveView: UIView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var localTeamFlag: UIImageView!
    @IBOutlet weak var visitorTeamFlag: UIImageView!
    @IBOutlet weak var countDownTime: UILabel!
    var timer: Timer?
    let gif = UIImage.gifImageWithName("7236-clock-seamless-animation-unscreen")
    override func viewDidLoad() {
        super.viewDidLoad()
        liveView.layer.cornerRadius = 15
        liveView.layer.cornerRadius = 15
        liveView.layer.masksToBounds = true
        setUpBindersForUpcomingData()
        clockTime.image = gif
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getTimer()
    }
    override func viewDidAppear(_ animated: Bool) {
        timer?.invalidate()
    }
    func setUpBindersForUpcomingData(){
        LivePageUpcomingVm.upcomingData.bind(listener: {[weak self] data in
            guard let self = self, let data = data else {return}
            DispatchQueue.main.async {
                let date = TimeConvertion.shared.formatDate(date: data.startingDate)
                let time = TimeConvertion.shared.time(date: data.startingDate)
                self.date.text = date + " : "+time
                self.localTeamFlag.sd_setImage(with: URL(string: data.localTeamFlag ))
                self.visitorTeamFlag.sd_setImage(with: URL(string: data.visitorTeamFlag))
                self.getTimer()
            }
        })
    }
    func getTimer() {
            let inputFormatter = ISO8601DateFormatter()
            inputFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            guard let endDate = inputFormatter.date(from: LivePageUpcomingVm.upcomingData.value?.startingDate ?? "") else { return }
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                let remainingTime = TimeConvertion.shared.timeRemaining(from: Date(), to: endDate)
                let timerString = String(format: "%02dH : %02dM : %02dS", remainingTime.hours, remainingTime.minutes, remainingTime.seconds)
                DispatchQueue.main.async {
                    self.countDownTime.text = timerString
                }
            }
            timer?.tolerance = 0.1
            RunLoop.current.add(timer!, forMode: .common)
        }
    deinit {
            timer?.invalidate()
            timer = nil
    }
}
