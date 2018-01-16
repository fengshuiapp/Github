class ResultDisplayController < UIViewController
 	#attr_accessor :input_field

#require "./LunarSolarConverter.rb"
#Number
$earthStar=0
$facingStar=0
$mountainStar=0
#yin movement --> 1
#yang movement --> 0
$facingMovement=0
$mountainMovementMovement=0
#Chinese Direction
$facingDirection=0
$mountainDirection=0
#Degree
$facingDegree=0
$mountainDegree=0

$starNum=[1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8]

#The two types of movement sequence, the middle box is 4
$forwardMovement=Array[4,8,5,6,1,7,2,3,0]
$backwardMovement=Array[4,0,3,2,7,1,6,5,8]

#九宫格的array
$chartArray=Array.new(9){Array.new(3)}

#fill circle  = 1 --> yin  movement
#empty circle = 0 --> yang movement
#The 9 circular Chart to determine the facing star and mountain star
$circularPlate1=
{
  "JEN"    => [6,1],
  "TZU"    => [6,0],
  "KUEI"   => [6,0],
  "CH\'OU" => [4,1],
  "KEN"    => [4,0],
  "YIN"    => [4,0],
  "CHIA"   => [8,1],
  "MAO"    => [8,0],
  "I"      => [8,0],
  "CH\'EN" => [9,0],
  "SUN"    => [9,1],
  "SSU"    => [9,1],
  "PING"   => [5,0],
  "WU"     => [5,1],
  "TING"   => [5,1],
  "WEI"    => [7,0],
  "K\'UN"  => [7,1],
  "SHEN"   => [7,1],
  "KENG"   => [3,0],
  "YU"     => [3,1],
  "HSIN"   => [3,1],
  "HSU"    => [2,1],
  "CH'IEN" => [2,0],
  "HAI"    => [2,0],
}

$circularPlate2=
{
  "JEN"    => [7,0],
  "TZU"    => [7,1],
  "KUEI"   => [7,1],
  "CH\'OU" => [5,1],
  "KEN"    => [5,0],
  "YIN"    => [5,0],
  "CHIA"   => [9,0],
  "MAO"    => [9,1],
  "I"      => [9,1],
  "CH\'EN" => [1,0],
  "SUN"    => [1,1],
  "SSU"    => [1,1],
  "PING"   => [6,1],
  "WU"     => [6,0],
  "TING"   => [6,0],
  "WEI"    => [8,1],
  "K\'UN"  => [8,0],
  "SHEN"   => [8,0],
  "KENG"   => [4,1],
  "YU"     => [4,0],
  "HSIN"   => [4,0],
  "HSU"    => [3,0],
  "CH'IEN" => [3,1],
  "HAI"    => [3,1],
}

$circularPlate3=
{
  "JEN"    => [8,1],
  "TZU"    => [8,0],
  "KUEI"   => [8,0],
  "CH\'OU" => [6,1],
  "KEN"    => [6,0],
  "YIN"    => [6,0],
  "CHIA"   => [1,0],
  "MAO"    => [1,1],
  "I"      => [1,1],
  "CH\'EN" => [2,1],
  "SUN"    => [2,0],
  "SSU"    => [2,0],
  "PING"   => [7,0],
  "WU"     => [7,1],
  "TING"   => [7,1],
  "WEI"    => [9,0],
  "K\'UN"  => [9,1],
  "SHEN"   => [9,1],
  "KENG"   => [5,0],
  "YU"     => [5,1],
  "HSIN"   => [5,1],
  "HSU"    => [4,1],
  "CH'IEN" => [4,0],
  "HAI"    => [4,0],
}

$circularPlate4=
{
  "JEN"    => [9,0],
  "TZU"    => [9,1],
  "KUEI"   => [9,1],
  "CH\'OU" => [7,0],
  "KEN"    => [7,1],
  "YIN"    => [7,1],
  "CHIA"   => [2,1],
  "MAO"    => [2,0],
  "I"      => [2,0],
  "CH\'EN" => [3,0],
  "SUN"    => [3,1],
  "SSU"    => [3,1],
  "PING"   => [8,1],
  "WU"     => [8,0],
  "TING"   => [8,0],
  "WEI"    => [1,0],
  "K\'UN"  => [1,1],
  "SHEN"   => [1,1],
  "KENG"   => [6,1],
  "YU"     => [6,0],
  "HSIN"   => [6,0],
  "HSU"    => [5,1],
  "CH'IEN" => [5,0],
  "HAI"    => [5,0],
}

$circularPlate5=
{
  "JEN"    => [1,0],
  "TZU"    => [1,1],
  "KUEI"   => [1,1],
  "CH\'OU" => [8,1],
  "KEN"    => [8,0],
  "YIN"    => [8,0],
  "CHIA"   => [3,0],
  "MAO"    => [3,1],
  "I"      => [3,1],
  "CH\'EN" => [4,1],
  "SUN"    => [4,0],
  "SSU"    => [4,0],
  "PING"   => [9,0],
  "WU"     => [9,1],
  "TING"   => [9,1],
  "WEI"    => [2,1],
  "K\'UN"  => [2,0],
  "SHEN"   => [2,0],
  "KENG"   => [7,0],
  "YU"     => [7,1],
  "HSIN"   => [7,1],
  "HSU"    => [6,1],
  "CH'IEN" => [6,0],
  "HAI"    => [6,0],
}

$circularPlate6=
{
  "JEN"    => [2,1],
  "TZU"    => [2,0],
  "KUEI"   => [2,0],
  "CH\'OU" => [9,0],
  "KEN"    => [9,1],
  "YIN"    => [9,1],
  "CHIA"   => [4,1],
  "MAO"    => [4,0],
  "I"      => [4,0],
  "CH\'EN" => [5,1],
  "SUN"    => [5,0],
  "SSU"    => [5,0],
  "PING"   => [1,0],
  "WU"     => [1,1],
  "TING"   => [1,1],
  "WEI"    => [3,0],
  "K\'UN"  => [3,1],
  "SHEN"   => [3,1],
  "KENG"   => [8,1],
  "YU"     => [8,0],
  "HSIN"   => [8,0],
  "HSU"    => [7,0],
  "CH'IEN" => [7,1],
  "HAI"    => [7,1],
}

$circularPlate7=
{
  "JEN"    => [3,0],
  "TZU"    => [3,1],
  "KUEI"   => [3,1],
  "CH\'OU" => [1,0],
  "KEN"    => [1,1],
  "YIN"    => [1,1],
  "CHIA"   => [5,0],
  "MAO"    => [5,1],
  "I"      => [5,1],
  "CH\'EN" => [6,1],
  "SUN"    => [6,0],
  "SSU"    => [6,0],
  "PING"   => [2,1],
  "WU"     => [2,0],
  "TING"   => [2,0],
  "WEI"    => [4,1],
  "K\'UN"  => [4,0],
  "SHEN"   => [4,0],
  "KENG"   => [9,0],
  "YU"     => [9,1],
  "HSIN"   => [9,1],
  "HSU"    => [8,1],
  "CH'IEN" => [8,0],
  "HAI"    => [8,0],
}

$circularPlate8=
{
  "JEN"    => [4,1],
  "TZU"    => [4,0],
  "KUEI"   => [4,0],
  "CH\'OU" => [2,1],
  "KEN"    => [2,0],
  "YIN"    => [2,0],
  "CHIA"   => [6,1],
  "MAO"    => [6,0],
  "I"      => [6,0],
  "CH\'EN" => [7,0],
  "SUN"    => [7,1],
  "SSU"    => [7,1],
  "PING"   => [3,0],
  "WU"     => [3,1],
  "TING"   => [3,1],
  "WEI"    => [5,1],
  "K\'UN"  => [5,0],
  "SHEN"   => [5,0],
  "KENG"   => [1,0],
  "YU"     => [1,1],
  "HSIN"   => [1,1],
  "HSU"    => [9,0],
  "CH'IEN" => [9,1],
  "HAI"    => [9,1],
}

$circularPlate9=
{
  "JEN"    => [5,0],
  "TZU"    => [5,1],
  "KUEI"   => [5,1],
  "CH\'OU" => [3,0],
  "KEN"    => [3,1],
  "YIN"    => [3,1],
  "CHIA"   => [7,0],
  "MAO"    => [7,1],
  "I"      => [7,1],
  "CH\'EN" => [8,1],
  "SUN"    => [8,0],
  "SSU"    => [8,0],
  "PING"   => [4,1],
  "WU"     => [4,0],
  "TING"   => [4,0],
  "WEI"    => [6,1],
  "K\'UN"  => [6,0],
  "SHEN"   => [6,0],
  "KENG"   => [2,1],
  "YU"     => [2,0],
  "HSIN"   => [2,0],
  "HSU"    => [1,0],
  "CH'IEN" => [1,1],
  "HAI"    => [1,1],
}

$circularPlate=
  [
    $circularPlate1,
    $circularPlate2,
    $circularPlate3,
    $circularPlate4,
    $circularPlate5,
    $circularPlate6,
    $circularPlate7,
    $circularPlate8,
    $circularPlate9
  ]




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
    @submit_button.frame = [[50,300],[200,260]]
    @submit_button.setTitle("Submit",forState:UIControlStateNormal)
    @submit_button.addTarget(self,action: :Results_display, forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(@submit_button)
	end


	def Results_display
	   
	     result_algrythem
       alert = UIAlertView.new
       alert.addButtonWithTitle("OK")
       alert.message = @result_final
       alert.show    
    end
    

    def result_algrythem
      yearToCycle
      #get the global variable $earthStar

      insertEarth($earthStar)
      #insert the Earth Star in the 0th element of each small array

      insertFacing
      #get the global variable $facingDegree, $facingDirection, $facingStar, $facingMovement
      #insert the Facing Star in the 1st element of each small array

      insertMountain
      #get the global variable $mountainDegree, $mountainDirection, $mountainStar, $mountainMovement
      #insert the Mountain Star in the 2st element of each small array

      typeOfChart
    	 
    end

    def yearToCycle #need to use the solarToLunar link_to_function

  #puts "Please enter year when the house is completed:"
  #converter = LunarSolarConverter.new
      $year=@input_field.text.to_i
    case $year
    when 1864..1883
      $earthStar=1
    when 1884..1903
      $earthStar=2
    when 1904..1923
      $earthStar=3
    when 1924..1943
      $earthStar=4
    when 1944..1963
      $earthStar=5
    when 1964..1983
      $earthStar=6
    when 1984..2003
      $earthStar=7
    when 2004..2023
      $earthStar=8
    when 2024..2043
      $earthStar=9
    else
      @result_final= "You gave me #{year} -- Error"
      
  end
  
end

def insertEarth(i)
  j=$starNum.index(i)
  $forwardMovement.each do |box|
    $chartArray[box][0]=$starNum[j]
    j+=1
  end
   #@result_final = j.to_s
end

def insertFacing

#九宫格的array
#$chartArray=Array.new(9){Array.new(3)}

  
  #puts "Please enter the Facing of the household:"
  $facingDegree=@input_field2.text.to_f
  
  $facingDirection = luopanConvertor($facingDegree)
  #puts "The Facing direction is #{$facingDirection}"
  
  #get the correct circular plate depending on the year cycle
  plate=$circularPlate[$earthStar-1]
  #Retrieve the facing star from the circular plate
  $facingStar = plate[$facingDirection][0]
  $facingMovement = plate[$facingDirection][1]
  
  # the case is to determine whether it's Yang movement or Yin movement
  case $facingMovement
   when 0
      path=$forwardMovement
    when 1
      path=$backwardMovement
  end
  
  j = $starNum.index($facingStar)
  
  path.each do |box|
    $chartArray[box][1] = $starNum[j]
    j+=1
  end
   #@result_final = j.to_s
end

def insertMountain
  #The direction of the mounatin is opposite of the facing
  if $facingDegree < 180
    $mountainDegree = $facingDegree+180
  else
    $facingDegree >= 180
    $mountainDegree = $facingDegree-180
  end
  
  $MountainDirection = luopanConvertor($mountainDegree)
  
  #puts "The Mountain direction is #{$MountainDirection}"
  
  #get the correct circular plate depending on the year cycle
  plate=$circularPlate[$earthStar-1]
  #Retrieve the facing star from the circular plate
  $mountainStar = plate[$MountainDirection][0]
  $mountainMovement = plate[$MountainDirection][1]
  
  # the case is to determine whether it's Yang movement or Yin movement
  case $mountainMovement
    when 0
      path=$forwardMovement
    when 1
     path=$backwardMovement
  end
  
  j = $starNum.index($mountainStar)
  
  path.each do |box|
    $chartArray[box][2] = $starNum[j]
   j+=1
  end
  #@result_final = j.to_s
end

def typeOfChart
  if ($mountainMovement==0 and $facingMovement==1)
    #Forward mountain and backward facing
    @result_final =  "Descending Water Condition. \rThe fortunes of a house with this combination will be enhanced if there is water in front."
  elsif ($mountainMovement==1 and $facingMovement==0)
    #Backward mountain and forward facing
    @result_final ="Ascending Mountain Condition. \rThe fortunes of such a house will be enhanced if there is a mountain at the back."
  
  elsif ($mountainMovement==0 and $facingMovement==0)
    #Forward mountain and forward facing
    @result_final = "Descending Water Condition.\rThe fortunes of this house will be enhanced if water lies in front and mountains are at the back."
  
  elsif ($mountainMovement==1 and $facingMovement==1)
    #Backward mountain and backward facing
    @result_final = "Reverse Mountain and Reverse Water Condition. \rA house with this combination will have good fortune regardless of its position relative to mountains and water."
  end
end

def luopanConvertor(degree) #find the direction in Chinese
  
  case degree
    when 0..7.5
      return "TZU"
    when 7.5..22.5
      return "KUEI"
    when 22.5..37.5
      return "CH\'OU"
    when 37.5..52.5
      return "KEN"
    when 52.5..67.5
      return "YIN"
    when 67.5..82.5
      return "CHIA"
    when 82.5..97.5
      return "MAO"
    when 97.5..112.5
      return "I"
    when 112.5..127.5
      return "CH'EN"
    when 127.5..142.5
      return "SUN"
    when 142.5..157.5
      return "SSU"
    when 157.5..172.5
      return "PING"
    when 172.5..187.5
      return "WU"
    when 187.5..202.5
      return "TING"
    when 202.5..217.5
      return "WEI"
    when 217.5..232.5
      return "K'UN"
    when 232.5..247.5
      return "SHEN"
    when 247.5..262.5
      return "KENG"
    when 262.5..277.5
      return "YU"
    when 277.5..292.5
      return "HSIN"
    when 292.5..307.5
      return "HSU"
    when 307.5..322.5
      return "CH'IEN"
    when 322.5..337.5
      return "HAI"
    when 337.5..352.5
      return "JEN"
    when 352.5..360
      return "TZU"
    else
      @result_final = "You gave me #{degree} -- Error"
  end
  
end


def dump(obj)
  puts "["
  obj.instance_variables.map{|var| puts [var, obj.instance_variable_get(var)].join(":")}
  puts "]"
end




end