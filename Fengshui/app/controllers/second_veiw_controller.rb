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
      @labelView.frame = [[40,250],[100,100]]
      @labelView.text = "A"
      @labelView.textColor = UIColor.redColor
      @labelView.textAlignment = NSTextAlignmentCenter
      @labelView.layer.borderColor = UIColor.blackColor.CGColor
      @labelView.layer.borderWidth = 1.0

      @labelView2 = UILabel.alloc.init
      @labelView2.frame = [[140,250],[100,100]]
      @labelView2.text = "A"
      @labelView2.textColor = UIColor.redColor
      @labelView2.textAlignment = NSTextAlignmentCenter
      @labelView2.layer.borderColor = UIColor.blackColor.CGColor
      @labelView2.layer.borderWidth = 1.0

      @labelView3 = UILabel.alloc.init
      @labelView3.frame = [[240,250],[100,100]]
      @labelView3.text = "A"
      @labelView3.textColor = UIColor.redColor
      @labelView3.textAlignment = NSTextAlignmentCenter
      @labelView3.layer.borderColor = UIColor.blackColor.CGColor
      @labelView3.layer.borderWidth = 1.0

      @labelView4 = UILabel.alloc.init
      @labelView4.frame = [[40,350],[100,100]]
      @labelView4.text = "A"
      @labelView4.textColor = UIColor.redColor
      @labelView4.textAlignment = NSTextAlignmentCenter
      @labelView4.layer.borderColor = UIColor.blackColor.CGColor
      @labelView4.layer.borderWidth = 1.0

      @labelView5 = UILabel.alloc.init
      @labelView5.frame = [[140,350],[100,100]]
      @labelView5.text = "A"
      @labelView5.textColor = UIColor.redColor
      @labelView5.textAlignment = NSTextAlignmentCenter
      @labelView5.layer.borderColor = UIColor.blackColor.CGColor
      @labelView5.layer.borderWidth = 1.0

      @labelView6 = UILabel.alloc.init
      @labelView6.frame = [[240,350],[100,100]]
      @labelView6.text = "A"
      @labelView6.textColor = UIColor.redColor
      @labelView6.textAlignment = NSTextAlignmentCenter
      @labelView6.layer.borderColor = UIColor.blackColor.CGColor
      @labelView6.layer.borderWidth = 1.0

      @labelView7 = UILabel.alloc.init
      @labelView7.frame = [[40,450],[100,100]]
      @labelView7.text = "A"
      @labelView7.textColor = UIColor.redColor
      @labelView7.textAlignment = NSTextAlignmentCenter
      @labelView7.layer.borderColor = UIColor.blackColor.CGColor
      @labelView7.layer.borderWidth = 1.0

      @labelView8 = UILabel.alloc.init
      @labelView8.frame = [[140,450],[100,100]]
      @labelView8.text = "A"
      @labelView8.textColor = UIColor.redColor
      @labelView8.textAlignment = NSTextAlignmentCenter
      @labelView8.layer.borderColor = UIColor.blackColor.CGColor
      @labelView8.layer.borderWidth = 1.0

      @labelView9 = UILabel.alloc.init
      @labelView9.frame = [[240,450],[100,100]]
      @labelView9.text = "A"
      @labelView9.textColor = UIColor.redColor
      @labelView9.textAlignment = NSTextAlignmentCenter
      @labelView9.layer.borderColor = UIColor.blackColor.CGColor
      @labelView9.layer.borderWidth = 1.0



      view.addSubview(@labelView)
      view.addSubview(@labelView2)
      view.addSubview(@labelView3)
      view.addSubview(@labelView4)
      view.addSubview(@labelView5)
      view.addSubview(@labelView6)
      view.addSubview(@labelView7)
      view.addSubview(@labelView8)
      view.addSubview(@labelView9)


      @scrollView.addSubview(@imageView)

      view.addSubview(@scrollView)
      view.bringSubviewToFront(@labelView)
      view.bringSubviewToFront(@labelView2)
      view.bringSubviewToFront(@labelView3)
      view.bringSubviewToFront(@labelView4)
      view.bringSubviewToFront(@labelView5)
      view.bringSubviewToFront(@labelView6)
      view.bringSubviewToFront(@labelView7)
      view.bringSubviewToFront(@labelView8)
      view.bringSubviewToFront(@labelView9)
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