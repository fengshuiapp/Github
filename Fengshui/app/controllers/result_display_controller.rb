class ResultDisplayController < UIViewController

      attr_accessor :result_final
      attr_accessor :plate_display
      attr_accessor :facingdirection

      $button=0

      def viewDidLoad

          view.backgroundColor = UIColor.underPageBackgroundColor
          loadButtons

      end

      def loadButtons

          @label_field = UILabel.alloc.initWithFrame([[50,100],[300,200]])
          @label_field.numberOfLines = 5
          @label_field.textColor = UIColor.blackColor
          @label_field.backgroundColor = UIColor.clearColor
          @label_field.text = @result_final
          view.addSubview(@label_field)

          @button1 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button1.frame  = [[100, 350], [50, 50]]
          @button1.layer.borderColor = UIColor.blackColor.CGColor
          @button1.layer.borderWidth = 1.0
          @button1.setTitle(@plate_display[0][0].to_s, forState:UIControlStateNormal)
          @button1.addTarget(self, action: :result_display1, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button1)

          @button2 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button2.frame  = [[150, 350], [50, 50]]
          @button2.layer.borderColor = UIColor.blackColor.CGColor
          @button2.layer.borderWidth = 1.0
          @button2.setTitle(@plate_display[1][0].to_s, forState:UIControlStateNormal)
          @button2.addTarget(self, action: :result_display2, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button2)

          @button3 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button3.frame  = [[200, 350], [50, 50]]
          @button3.layer.borderColor = UIColor.blackColor.CGColor
          @button3.layer.borderWidth = 1.0
          @button3.setTitle(@plate_display[2][0].to_s, forState:UIControlStateNormal)
          @button3.addTarget(self, action: :result_display3, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button3)

          @button4 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button4.frame  = [[100, 400], [50, 50]]
          @button4.layer.borderColor = UIColor.blackColor.CGColor
          @button4.layer.borderWidth = 1.0
          @button4.setTitle(@plate_display[3][0].to_s, forState:UIControlStateNormal)
          @button4.addTarget(self, action: :result_display4, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button4)

          @button5 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button5.frame  = [[150, 400], [50, 50]]
          @button5.layer.borderColor = UIColor.blackColor.CGColor
          @button5.layer.borderWidth = 1.0
          @button5.setTitle(@plate_display[4][0].to_s, forState:UIControlStateNormal)
          @button5.addTarget(self, action: :result_display5, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button5)

          @button6 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button6.frame  = [[200, 400], [50, 50]]
          @button6.layer.borderColor = UIColor.blackColor.CGColor
          @button6.layer.borderWidth = 1.0
          @button6.setTitle(@plate_display[5][0].to_s, forState:UIControlStateNormal)
          @button6.addTarget(self, action: :result_display6, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button6)

          @button7 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button7.frame  = [[100, 450], [50, 50]]
          @button7.layer.borderColor = UIColor.blackColor.CGColor
          @button7.layer.borderWidth = 1.0
          @button7.setTitle(@plate_display[6][0].to_s, forState:UIControlStateNormal)
          @button7.addTarget(self, action: :result_display7, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button7)

          @button8 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button8.frame  = [[150, 450], [50, 50]]
          @button8.layer.borderColor = UIColor.blackColor.CGColor
          @button8.layer.borderWidth = 1.0
          @button8.setTitle(@plate_display[7][0].to_s, forState:UIControlStateNormal)
          @button8.addTarget(self, action: :result_display8, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button8)

          @button9 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
          @button9.frame  = [[200, 450], [50, 50]]
          @button9.layer.borderColor = UIColor.blackColor.CGColor
          @button9.layer.borderWidth = 1.0
          @button9.setTitle(@plate_display[8][0].to_s, forState:UIControlStateNormal)
          @button9.addTarget(self, action: :result_display9, forControlEvents:UIControlEventTouchUpInside)
          view.addSubview(@button9)

      end

      def result_display1

          $button =0
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display2

          consitional_interactions
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display3

          $button =2
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display4

          $button =3
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display5

          $button =4
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display6

          $button =5
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display7

          $button =6
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display8

          $button =7
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def result_display9

          $button =8
          result_calculate($button)
          alert = UIAlertView.new
          alert.addButtonWithTitle("OK")
          alert.message = @result_room
          alert.show 

      end

      def consitional_interactions


          if ((@plate_display[1][0]==1 and @plate_display[1][1]==6)or(@plate_display[1][0]==6 and @plate_display[1][1]==1))

             if @facingdirection == "CHIA"or"MAO"or"I"or"CH'EN"or"SUN"or"SSU"or"JEN"or"TZU"or"KUEI"

                @result_room = "Higher priority: Successful scholarly pursuits. Children will be intelligent and talented."

             elsif @facingdirection == "PING"or"WU"or"TING"

                   @result_room = "Higher priority: The head of the family will be injured in accidents. Children may be uncaring toward
                   their parents, and descendants may become thieves and vring harm to family members"

             else

                   @result_room = "Higher priority: No conditional and unconditional interactions."

             end

          elsif ((@plate_display[1][0]==2 and @plate_display[1][1]==7)or(@plate_display[1][0]==7 and @plate_display[1][1]==2))

                if @facingdirection == "WEI"or"K'UN"or"SHEN"or"CH'OU"or"KEN"or"YIN"or"PING"or"WU"or"TING"

                   @result_room = "Higher priority: Finalcial success, but seedy connections may be involved."

                elsif @facingdirection == "HUS"or"CH'IEN"or"HAI"or"KENG"or"YU"or"HSIN"

                      @result_room = "Higher priority: Infant death, illness and accidents."
                else
                      @result_room ="Higher priority: No conditional and unconditional interactions."
                end

          elsif ((@plate_display[1][0]==3 and @plate_display[1][1]==8)or(@plate_display[1][0]==8 and @plate_display[1][1]==3))

                if @facingdirection == "PING"or"WU"or"TING"or"CHIA"or"MAO"or"I"or"CH'EN"or"SUN"or"SSU"

                   @result_room ="Higher priority: Success in politics or in producing caring and responsible Children."

                elsif @facingdirection == "WEI"or"K'UN"or"SHEN"

                      @result_room = "Higher priority: Suicide. Children may die young."
                else
                      @result_room="Higher priority: No conditional and unconditional interactions."
                end

          elsif ((@plate_display[1][0]==4 and @plate_display[1][1]==9)or(@plate_display[1][0]==9 and @plate_display[1][1]==4))

                if @facingdirection == "JEN"or"TZU"or"KUEI"or"KENG"or"YU"or"HSIN"or"HUS"or"CH'IEN"or"HAI"

                   @result_room="Higher priority: Tremendous success in business through ethical means."

                elsif @facingdirection == "CHIA"or"MAO"or"I"

                      @result_room="Higher priority: Injury or death in war. Children will become orphans."
                else
                      @result_room ="Higher priority: No conditional and unconditional interactions."
                end
      
          else
                result_calculate(1)
          end

      end

      def result_calculate(i)
     
          if ((@plate_display[i][0]==1 and @plate_display[i][1]==4)or(@plate_display[i][0]==4 and @plate_display[i][1]==1))

             @result_room="Success in scholarly pursuits."

             if (i==4)
                @result_room="Apply to all rooms:"+@result_room
             end

          elsif @plate_display[i][0]==6 and @plate_display[i][1]==8

                @result_room ="Success in business or the military arts."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==8 and @plate_display[i][1]==6

                @result_room = "Success in scholarly or artistic endeavors."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==4 and @plate_display[i][1]==6

                @result_room="Brings talent and fame."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==8 and @plate_display[i][1]==9

                @result_room="Many happy occasions in family life."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==9 and @plate_display[i][1]==8

                @result_room="Enhances fame."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==2 and @plate_display[i][1]==8

                if @facingdirection == "HSII"or"CH'EN"or"HAI"

                   @result_room="Great wealth."

                   if (i==4)
                      @result_room="Apply to all rooms:"+@result_room
                   end

                else
                   @result_room="No conditional and unconditional interactions."

                   if (i==4)
                      @result_room="Apply to all rooms:"+@result_room
                   end

                end

          elsif @plate_display[i][0]==3 and @plate_display[i][1]==1

                if @facingdirection == "KENG"or"YU"or"BSIN"

                   @result_room="Many descendants."

                   if (i==4)
                      @result_room="Apply to all rooms:"+@result_room
                   end

                else

                   @result_room="No conditional and unconditional interactions."

                   if (i==4)
                      @result_room="Apply to all rooms:"+@result_room
                   end

                end

          elsif @plate_display[i][0]==7 and @plate_display[i][1]==9

                @result_room="Problems associated with politics."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif ((@plate_display[i][0]==2 and @plate_display[i][1]==5)or(@plate_display[i][0]==5 and @plate_display[i][1]==2))

                @result_room="Severe illness."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==9 and @plate_display[i][1]==7

                @result_room="fire caused by human activity."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==2 and @plate_display[i][1]==7

                @result_room="File caused by natural circumstances."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==5 and @plate_display[i][1]==5

                @result_room="Severe illness or death."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif ((@plate_display[i][0]==5 and @plate_display[i][1]==9)or(@plate_display[i][0]==9 and @plate_display[i][1]==5))

                @result_room="Signify accidents that lead to injury or death."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif ((@plate_display[i][0]==7 and @plate_display[i][1]==6)or(@plate_display[i][0]==6 and @plate_display[i][1]==7))

                @result_room="Armed robbery and loss of fortunes.There is also the prossiblity of injuries."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif ((@plate_display[i][0]==3 and @plate_display[i][1]==2)or(@plate_display[i][0]==2 and @plate_display[i][1]==3))

                @result_room="Quarrels and disharmony in relationships. If this combination is located in the kitchen, it signifies
                having too many mouths to feed, that is, financial hard times for the family."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==7 and @plate_display[i][1]==3

                @result_room="Unexpected fains in business, but these gains will invite robbery and trickery."

                if (i==4)
                @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==3 and @plate_display[i][1]==7

                @result_room="Illness associated with worries and anxieties. There is also the prossiblity of being victimized by 
                politics or being embroiled in legal disputes."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==6 and @plate_display[i][1]==9

                @result_room="Illness involving the failure of internal organs. The eldest member of the family has the highest risk."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==7 and @plate_display[i][1]==9 and @plate_display[i][2]==5

                @result_room="Terminal illness."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==8 and @plate_display[i][1]==4

                @result_room="Children will be unhealthy."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==2 and @plate_display[i][1]==9

                @result_room="Obstacels in business ventures."

                if (i==4)
                   @result_room="Apply to all rooms:"+@result_room
                end

          elsif @plate_display[i][0]==3 and @plate_display[i][1]==8

                @result_room="Illness in Children."

                if (i==4)
                @result_room="Apply to all rooms:"+@result_room
                end

          else 
            
                case  @plate_display[i][0]

                      when 1,4,6,8
                           @temp = 1.5

                      when 3, 7
                           @temp = 0

                      when 2, 5
                           @temp = -1.5

                      when 9
                           @temp = 0

                end

                case  @plate_display[i][1]

                      when 1,4,6,8
                           @temp = @temp+2

                      when 3, 7
                           @temp = @temp + 0

                      when 2, 5
                           @temp = @temp -2 

                      when 9
                           @temp = 0

                end

                case  @plate_display[i][2]

                      when 1,4,6,8
                           @temp = @temp+0.5

                      when 3, 7
                           @temp = @temp + 0

                      when 2, 5
                           @temp = @temp -0.5

                      when 9
                           @temp = 0

                end
                if  @temp<0

                    @result_room = "Bad Fengshui."

                elsif  

                    @temp == 0
                    @result_room = "Neutral."

                elsif

                    @temp >0 
                    @result_room = "Good Fengshui."

                end

                        
          end


     end


end
