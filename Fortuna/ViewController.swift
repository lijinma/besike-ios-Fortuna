//
//  ViewController.swift
//  Fortuna
//
//  Created by Li JinMa on 14-10-17.
//  Copyright (c) 2014年 Li JinMa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quotationTextView: UITextView!

    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayRandomQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayRandomQuote() {
        var delegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        // quotes = radomly choose positiveQuotations or negativeQuotations
        // quote = randomly choose an element from quotes
        var quotesSet = [delegate.positiveQuotes, delegate.negativeQuotes]
        var quotes = quotesSet[getRandomIndex(quotesSet.count)]
        var quote = quotes[getRandomIndex(quotes.count)];

        quotationTextView.text = quote
        quotationTextView.editable = false
        quotationTextView.selectable = false
    }
    
    func getRandomIndex (count: Int) ->Int{
        return Int(arc4random_uniform(UInt32(count)))
    }

}

