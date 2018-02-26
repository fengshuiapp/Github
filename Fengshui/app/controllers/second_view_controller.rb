class SecondViewController < UIViewController

 def viewDidLoad
      view.backgroundColor = UIColor.underPageBackgroundColor
      loadinput
      
  end
  
 def loadinput
      view.backgroundColor = UIColor.underPageBackgroundColor
      @date_picker = UIDatePicker.alloc.init
      @date_picker.datePickerMode = UIDatePickerModeDate


      @comp = NSDateComponents.alloc.init
      @comp.Month = 01
      @comp.Day = 01
      @comp.Year = 1864
      @myCal = NSCalendar.alloc.initWithCalendarIdentifier(NSGregorianCalendar)
      @minDate = @myCal.dateFromComponents(@comp)
      
      @comp2 = NSDateComponents.alloc.init
      @comp2.Month = 12
      @comp2.Day = 31
      @comp2.Year = 2043
      @myCal2 = NSCalendar.alloc.initWithCalendarIdentifier(NSGregorianCalendar)
      @maxDate = @myCal2.dateFromComponents(@comp2)


      @date_picker.minimumDate = @minDate
      @date_picker.maximumDate = @maxDate

      view.addSubview(@date_picker)

      next_button =
      UIBarButtonItem.alloc.initWithTitle('Next', style:
      UIBarButtonItemStyleDone, target: self, action: :algorithm_controller)
      # Add the Bar Button Item to the Navigation Bar
      self.navigationItem.rightBarButtonItem = next_button

      @label_field = UILabel.alloc.initWithFrame([[30,300],[250,20]])
      @label_field.textColor = UIColor.blackColor
      @label_field.backgroundColor = UIColor.clearColor
      @label_field.text = "Please pick the built:"
      view.addSubview(@label_field)


 end



    def algorithm_controller
      @date_string = NSString.alloc.init
      
      @format = NSDateFormatter.alloc.init
      @format.DateFormat = "yyyy-MM-dd"
      @date_string = @format.stringFromDate(@date_picker.date)
    
      @algorithmview = AlgorithmController.new

      @algorithmview.input_field_text = @date_string.substringToIndex(4)
      @algorithmview.input_field3_text = @date_string.substringWithRange(NSMakeRange(5,2))
      @algorithmview.input_field4_text =  @date_string.substringWithRange(NSMakeRange(8,2))
      navigationController.pushViewController(@algorithmview,animated: true)
    end

end