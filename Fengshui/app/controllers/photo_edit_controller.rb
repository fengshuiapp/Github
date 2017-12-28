class PhotoEditController < UIViewController
 	#attr_accessor :input_field
    def viewDidLoad
      view.backgroundColor = UIColor.underPageBackgroundColor
      editphotos
    end

    def editphotos



    	next_button =
		UIBarButtonItem.alloc.initWithTitle('Next', style:
		UIBarButtonItemStyleDone, target: self, action: :resultdisplay)
 		# Add the Bar Button Item to the Navigation Bar
 		self.navigationItem.rightBarButtonItem = next_button

	

        

	end
	def resultdisplay

		navigationController.pushViewController(ResultDisplayController.new, animated: true)
	end

	




end