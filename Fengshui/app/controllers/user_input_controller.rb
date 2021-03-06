class UserInputController < UIViewController

  def viewDidLoad

      view.backgroundColor = UIColor.underPageBackgroundColor
      loadinput
      
  end
  
  def loadinput

      view.backgroundColor = UIColor.underPageBackgroundColor
      #date picker initialize
      @date_picker = UIDatePicker.alloc.init
      @date_picker.datePickerMode = UIDatePickerModeDate
      #lower bound of calender
      @comp = NSDateComponents.alloc.init
      @comp.Month = 01
      @comp.Day = 01
      @comp.Year = 1864
      @myCal = NSCalendar.alloc.initWithCalendarIdentifier(NSGregorianCalendar)
      @minDate = @myCal.dateFromComponents(@comp)
      #upper bound of calender
      @comp2 = NSDateComponents.alloc.init
      @comp2.Month = 12
      @comp2.Day = 31
      @comp2.Year = 2043
      @myCal2 = NSCalendar.alloc.initWithCalendarIdentifier(NSGregorianCalendar)
      @maxDate = @myCal2.dateFromComponents(@comp2)
      #set the lower bound and upper bound
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
      @label_field.text = "Please pick the built Date:"
      view.addSubview(@label_field)

      @label_field3 = UILabel.alloc.initWithFrame([[30,350],[350,20]])
      @label_field3.textColor = UIColor.blackColor
      @label_field3.backgroundColor = UIColor.clearColor
      @label_field3.text = "Please Enter the Facing Direction:"
      view.addSubview(@label_field3)

      @input_field = UITextField.alloc.initWithFrame([[30, 400], [100, 20]])
      @input_field.textColor = UIColor.blackColor
      @input_field.backgroundColor = UIColor.whiteColor
      @input_field.setBorderStyle UITextBorderStyleRoundedRect
      @input_field.placeholder = "0-360"
      view.addSubview(@input_field) 

  end



  def algorithm_controller
      
      @date_string = NSString.alloc.init
      @format = NSDateFormatter.alloc.init
      @format.DateFormat = "yyyy-MM-dd"
      @date_string = @format.stringFromDate(@date_picker.date)
      @algorithmview = AlgorithmController.new
      @algorithmview.input_field_text = @date_string.substringToIndex(4)
      @algorithmview.input_field3_text = @date_string.substringWithRange(NSMakeRange(5,2))
      @algorithmview.input_field4_text = @date_string.substringWithRange(NSMakeRange(8,2))
      @algorithmview.input_field2_text = @input_field.text
      navigationController.pushViewController(@algorithmview,animated: true)

  end

end