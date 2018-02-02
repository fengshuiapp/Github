class ResultDisplayController < UIViewController
    attr_accessor :result_final
    attr_accessor :plate_display



    def viewDidLoad
      view.backgroundColor = UIColor.underPageBackgroundColor
      loadButtons
    end

    def loadButtons

      @label_field = UILabel.alloc.initWithFrame([[50,100],[300,200]])
      @label_field.numberOfLines = 5
      @label_field.textColor = UIColor.blackColor
      @label_field.backgroundColor = UIColor.clearColor
      #@label_field.lineBreakMode = NSLineBreakByWordWrapping
      #@label_field.text = @plate_display[0][0].to_s
      @label_field.text = @result_final
      view.addSubview(@label_field)



      @button1 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button1.frame  = [[100, 350], [50, 50]]
      @button1.layer.borderColor = UIColor.blackColor.CGColor
      @button1.layer.borderWidth = 1.0
      @button1.setTitle(@plate_display[0][0].to_s, forState:UIControlStateNormal)
      @button1.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button1)

      @button2 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button2.frame  = [[150, 350], [50, 50]]
      @button2.layer.borderColor = UIColor.blackColor.CGColor
      @button2.layer.borderWidth = 1.0
      @button2.setTitle(@plate_display[1][0].to_s, forState:UIControlStateNormal)
      @button2.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button2)

      @button3 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button3.frame  = [[200, 350], [50, 50]]
      @button3.layer.borderColor = UIColor.blackColor.CGColor
      @button3.layer.borderWidth = 1.0
      @button3.setTitle(@plate_display[2][0].to_s, forState:UIControlStateNormal)
      @button3.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button3)

      @button4 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button4.frame  = [[100, 400], [50, 50]]
      @button4.layer.borderColor = UIColor.blackColor.CGColor
      @button4.layer.borderWidth = 1.0
      @button4.setTitle(@plate_display[3][0].to_s, forState:UIControlStateNormal)
      @button4.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button4)

      @button5 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button5.frame  = [[150, 400], [50, 50]]
      @button5.layer.borderColor = UIColor.blackColor.CGColor
      @button5.layer.borderWidth = 1.0
      @button5.setTitle(@plate_display[4][0].to_s, forState:UIControlStateNormal)
      @button5.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button5)

      @button6 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button6.frame  = [[200, 400], [50, 50]]
      @button6.layer.borderColor = UIColor.blackColor.CGColor
      @button6.layer.borderWidth = 1.0
      @button6.setTitle(@plate_display[5][0].to_s, forState:UIControlStateNormal)
      @button6.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button6)

      @button7 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button7.frame  = [[100, 450], [50, 50]]
      @button7.layer.borderColor = UIColor.blackColor.CGColor
      @button7.layer.borderWidth = 1.0
      @button7.setTitle(@plate_display[6][0].to_s, forState:UIControlStateNormal)
      @button7.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button7)

      @button1 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button1.frame  = [[150, 450], [50, 50]]
      @button1.layer.borderColor = UIColor.blackColor.CGColor
      @button1.layer.borderWidth = 1.0
      @button1.setTitle(@plate_display[7][0].to_s, forState:UIControlStateNormal)
      @button1.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button1)

      @button8 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @button8.frame  = [[200, 450], [50, 50]]
      @button8.layer.borderColor = UIColor.blackColor.CGColor
      @button8.layer.borderWidth = 1.0
      @button8.setTitle(@plate_display[8][0].to_s, forState:UIControlStateNormal)
      @button8.addTarget(self, action: :result_display, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@button8)


    end

   def result_display
      result_calculate
      alert = UIAlertView.new
       alert.addButtonWithTitle("OK")
       alert.message = @result_room
       alert.show 
     end
     def result_calculate
      @result_room = "test"
     end


end
