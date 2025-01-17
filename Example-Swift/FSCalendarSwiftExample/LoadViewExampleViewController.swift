//
//  LoadViewExampleViewController.swift
//  FSCalendarSwiftExample
//
//  Created by dingwenchao on 10/17/16.
//  Copyright © 2016 wenchao. All rights reserved.
//

import UIKit

class LoadViewExampleViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    private weak var calendar: FSCalendar!
    
    override func loadView() {
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.groupTableViewBackground
        self.view = view
        
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 800
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: self.view.bounds.width, height: height))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scrollDirection = .vertical
        calendar.pagingEnabled = false
        
        calendar.today = nil
        calendar.clipsToBounds = true
        calendar.appearance.weekdayTextColor = UIColor.lightGray
        calendar.appearance.selectionColor = UIColor.purple
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.placeholderType = .none;
        calendar.backgroundColor = UIColor.white
        
        
        self.view.addSubview(calendar)
        self.calendar = calendar
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FSCalendar"
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }

}
