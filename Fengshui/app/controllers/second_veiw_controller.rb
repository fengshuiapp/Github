class SecondViewController < UIViewController

    def viewDidLoad
      view.backgroundColor = UIColor.underPageBackgroundColor
      loadButtons
    end

    def loadButtons
      @camera_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @camera_button.frame  = [[50, 150], [200, 50]]
      @camera_button.setTitle("Click from camera", forState:UIControlStateNormal)
      @camera_button.addTarget(self, action: :start_camera, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@camera_button)

      @gallery_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      @gallery_button.frame  = [[50, 100], [200, 50]]
      @gallery_button.setTitle("Chose from Gallery", forState:UIControlStateNormal)
      @gallery_button.addTarget(self, action: :open_gallery, forControlEvents:UIControlEventTouchUpInside)
      view.addSubview(@gallery_button)

      next_button =
      UIBarButtonItem.alloc.initWithTitle('Next', style:
      UIBarButtonItemStyleDone, target: self, action: :resultdisplay)
      # Add the Bar Button Item to the Navigation Bar
      self.navigationItem.rightBarButtonItem = next_button

      @image_picker = UIImagePickerController.alloc.init
      @image_picker.delegate = self
    end

    #Tells the delegate that the user picked a still image or movie.
    def imagePickerController(picker, didFinishPickingImage:image, editingInfo:info)
      self.dismissModalViewControllerAnimated(true)
      @scrollView.removeFromSuperview if @scrollView
      @scrollView = UIScrollView.alloc.init
      @scrollView.frame = [[40,250 ], [300, 300]]
      
      @scrollView.scrollEnabled = false
      @scrollView.clipsToBounds = true
      @scrollView.contentSize = image.size
      @scrollView.minimumZoomScale = 1.0
      @scrollView.maximumZoomScale = 4.0
      @scrollView.zoomScale = 0.3
      @scrollView.delegate = self


      @imageView = UIImageView.alloc.initWithImage(image)
      @imageView.contentMode = UIViewContentModeScaleAspectFit
      @imageView.userInteractionEnabled = true
      @imageView.frame = @scrollView.bounds


      @labelView = UILabel.alloc.init
      @labelView.frame = [[60,300],[10,10]]
      @labelView.backgroundColor = UIColor.clearColor
      @labelView.text = "A"
      @labelView.layer.borderColor = UIColor.blackColor
      @labelView.layer.borderWidth = 2.0


      view.addSubview(@labelView)


      @scrollView.addSubview(@imageView)

      view.addSubview(@scrollView)
      view.bringSubviewToFront(@labelView)
      view.sendSubviewToBack(@imageView)

     
    end

    def start_camera
      if camera_present
        @image_picker.sourceType = UIImagePickerControllerSourceTypeCamera
        @image_picker.allowsEditing = false
        @image_picker.showsCameraControls = true
        presentModalViewController(@image_picker, animated:true)
      else
        show_alert
      end
    end

    def open_gallery
      @image_picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary
      presentModalViewController(@image_picker, animated:true)
    end

    def show_alert
      alert = UIAlertView.new
      alert.message = 'No Camera in device'
      alert.show
    end

    #Check Camera available or not
    def camera_present
      UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceTypeCamera)
    end

    def viewForZoomingInScrollView(scrollView)
      scrollView.subviews.first
    end

    def scrollViewDidZoom(scrollView)
      if scrollView.zoomScale != 1.0
        scrollView.scrollEnabled = true
      else
        scrollView.scrollEnabled = false
      end
    end


    def resultdisplay

    navigationController.pushViewController(ResultDisplayController.new, animated: true)
    end
    

end