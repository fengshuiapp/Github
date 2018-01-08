class ResultDisplayController < UIViewController
 	#attr_accessor :input_field
    def viewDidLoad
      view.backgroundColor = UIColor.underPageBackgroundColor
      loadInputs
    end

    def loadInputs

		@input_field = UITextField.alloc.initWithFrame([[50, 100], [250, 40]])
		@input_field.textColor = UIColor.blackColor
		@input_field.backgroundColor = UIColor.whiteColor
		@input_field.setBorderStyle UITextBorderStyleRoundedRect
		@input_field.placeholder = "Enter the built year"
		view.addSubview(@input_field) 

		@input_field2 = UITextField.alloc.initWithFrame([[50, 150], [250, 40]])
		@input_field2.textColor = UIColor.blackColor
		@input_field2.backgroundColor = UIColor.whiteColor
		@input_field2.setBorderStyle UITextBorderStyleRoundedRect
		@input_field2.placeholder = "Enter the facing direction"
		view.addSubview(@input_field2) 

		@submit_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
        @submit_button.frame = [[50,150],[200,260]]
        @submit_button.setTitle("Submit",forState:UIControlStateNormal)
        @submit_button.addTarget(self,action: :Results_display, forControlEvents:UIControlEventTouchUpInside)
        view.addSubview(@submit_button)
        #self.navigationItem.rightBarButtonItem = submit_button_item

        

	end

	def Results_display
	   
	   result_algrythem
       alert = UIAlertView.new
       alert.addButtonWithTitle("OK")
       alert.message = @result_final
       alert.show
       
    end

    def result_algrythem
    	@result_final = @input_field.text
    end




end