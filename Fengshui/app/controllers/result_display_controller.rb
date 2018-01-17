class ResultDisplayController < UIViewController
 	#attr_accessor :input_field

#require "./LunarSolarConverter.rb"
class Lunar
    attr_accessor :lunarDay, :lunarMonth,:lunarYear,:isleap;
    @isleap = false
    @lunarDay = 0
    @lunarMonth = 0
    @lunarYear = 0
    def initialize(y=0,m=0,d=0,leap=false)
        @lunarYear = y
        @lunarMonth = m
        @lunarDay = d
        @isleap = leap
    end
end

class Solar
    attr_accessor :solarDay, :solarMonth,:solarYear;
    @solarDay = 0
    @solarMonth = 0
    @solarYear = 0
    def initialize(y=0,m=0,d=0)
        @solarYear = y
        @solarMonth = m
        @solarDay = d
    end
end


def GetBitInt(data, length, shift)
    return (data & (((1 << length) - 1) << shift)) >> shift
end

def SolarToInt(y, m, d)
    m = (m + 9) % 12
    y -= m / 10
    return 365 * y + y / 4 - y / 100 + y / 400 + (m * 306 + 5) / 10 + (d - 1)
end

def SolarFromInt(g)
    y = (10000 * g + 14780) / 3652425
    ddd = g - (365 * y + y / 4 - y / 100 + y / 400)
    if ddd < 0
        y -= 1
        ddd = g - (365 * y + y / 4 - y / 100 + y / 400)
    end

    mi = (100 * ddd + 52) / 3060
    mm = (mi + 2) % 12 + 1
    y += (mi + 2) / 12
    dd = ddd - (mi * 306 + 5) / 10 + 1
    solar = Solar.new(y, mm, dd)
    return solar
end

class LunarSolarConverter
    @@lunar_month_days = [1887, 0x1694, 0x16aa, 0x4ad5, 0xab6, 0xc4b7, 0x4ae, 0xa56, 0xb52a,
                        0x1d2a, 0xd54, 0x75aa, 0x156a, 0x1096d, 0x95c, 0x14ae, 0xaa4d, 0x1a4c, 0x1b2a, 0x8d55,
                        0xad4, 0x135a, 0x495d,
                        0x95c, 0xd49b, 0x149a, 0x1a4a, 0xbaa5, 0x16a8, 0x1ad4, 0x52da, 0x12b6, 0xe937, 0x92e,
                        0x1496, 0xb64b, 0xd4a,
                        0xda8, 0x95b5, 0x56c, 0x12ae, 0x492f, 0x92e, 0xcc96, 0x1a94, 0x1d4a, 0xada9, 0xb5a, 0x56c,
                        0x726e, 0x125c,
                        0xf92d, 0x192a, 0x1a94, 0xdb4a, 0x16aa, 0xad4, 0x955b, 0x4ba, 0x125a, 0x592b, 0x152a,
                        0xf695, 0xd94, 0x16aa,
                        0xaab5, 0x9b4, 0x14b6, 0x6a57, 0xa56, 0x1152a, 0x1d2a, 0xd54, 0xd5aa, 0x156a, 0x96c,
                        0x94ae, 0x14ae, 0xa4c,
                        0x7d26, 0x1b2a, 0xeb55, 0xad4, 0x12da, 0xa95d, 0x95a, 0x149a, 0x9a4d, 0x1a4a, 0x11aa5,
                        0x16a8, 0x16d4,
                        0xd2da, 0x12b6, 0x936, 0x9497, 0x1496, 0x1564b, 0xd4a, 0xda8, 0xd5b4, 0x156c, 0x12ae,
                        0xa92f, 0x92e, 0xc96,
                        0x6d4a, 0x1d4a, 0x10d65, 0xb58, 0x156c, 0xb26d, 0x125c, 0x192c, 0x9a95, 0x1a94, 0x1b4a,
                        0x4b55, 0xad4,
                        0xf55b, 0x4ba, 0x125a, 0xb92b, 0x152a, 0x1694, 0x96aa, 0x15aa, 0x12ab5, 0x974, 0x14b6,
                        0xca57, 0xa56, 0x1526,
                        0x8e95, 0xd54, 0x15aa, 0x49b5, 0x96c, 0xd4ae, 0x149c, 0x1a4c, 0xbd26, 0x1aa6, 0xb54,
                        0x6d6a, 0x12da, 0x1695d,
                        0x95a, 0x149a, 0xda4b, 0x1a4a, 0x1aa4, 0xbb54, 0x16b4, 0xada, 0x495b, 0x936, 0xf497,
                        0x1496, 0x154a, 0xb6a5,
                        0xda4, 0x15b4, 0x6ab6, 0x126e, 0x1092f, 0x92e, 0xc96, 0xcd4a, 0x1d4a, 0xd64, 0x956c,
                        0x155c, 0x125c, 0x792e,
                        0x192c, 0xfa95, 0x1a94, 0x1b4a, 0xab55, 0xad4, 0x14da, 0x8a5d, 0xa5a, 0x1152b, 0x152a,
                        0x1694, 0xd6aa,
                        0x15aa, 0xab4, 0x94ba, 0x14b6, 0xa56, 0x7527, 0xd26, 0xee53, 0xd54, 0x15aa, 0xa9b5, 0x96c,
                        0x14ae, 0x8a4e,
                        0x1a4c, 0x11d26, 0x1aa4, 0x1b54, 0xcd6a, 0xada, 0x95c, 0x949d, 0x149a, 0x1a2a, 0x5b25,
                        0x1aa4, 0xfb52,
                        0x16b4, 0xaba, 0xa95b, 0x936, 0x1496, 0x9a4b, 0x154a, 0x136a5, 0xda4, 0x15ac]

    @@solar_1_1 = [1887, 0xec04c, 0xec23f, 0xec435, 0xec649, 0xec83e, 0xeca51, 0xecc46, 0xece3a,
                 0xed04d, 0xed242, 0xed436, 0xed64a, 0xed83f, 0xeda53, 0xedc48, 0xede3d, 0xee050, 0xee244, 0xee439,
                 0xee64d,
                 0xee842, 0xeea36, 0xeec4a, 0xeee3e, 0xef052, 0xef246, 0xef43a, 0xef64e, 0xef843, 0xefa37, 0xefc4b,
                 0xefe41,
                 0xf0054, 0xf0248, 0xf043c, 0xf0650, 0xf0845, 0xf0a38, 0xf0c4d, 0xf0e42, 0xf1037, 0xf124a, 0xf143e,
                 0xf1651,
                 0xf1846, 0xf1a3a, 0xf1c4e, 0xf1e44, 0xf2038, 0xf224b, 0xf243f, 0xf2653, 0xf2848, 0xf2a3b, 0xf2c4f,
                 0xf2e45,
                 0xf3039, 0xf324d, 0xf3442, 0xf3636, 0xf384a, 0xf3a3d, 0xf3c51, 0xf3e46, 0xf403b, 0xf424e, 0xf4443,
                 0xf4638,
                 0xf484c, 0xf4a3f, 0xf4c52, 0xf4e48, 0xf503c, 0xf524f, 0xf5445, 0xf5639, 0xf584d, 0xf5a42, 0xf5c35,
                 0xf5e49,
                 0xf603e, 0xf6251, 0xf6446, 0xf663b, 0xf684f, 0xf6a43, 0xf6c37, 0xf6e4b, 0xf703f, 0xf7252, 0xf7447,
                 0xf763c,
                 0xf7850, 0xf7a45, 0xf7c39, 0xf7e4d, 0xf8042, 0xf8254, 0xf8449, 0xf863d, 0xf8851, 0xf8a46, 0xf8c3b,
                 0xf8e4f,
                 0xf9044, 0xf9237, 0xf944a, 0xf963f, 0xf9853, 0xf9a47, 0xf9c3c, 0xf9e50, 0xfa045, 0xfa238, 0xfa44c,
                 0xfa641,
                 0xfa836, 0xfaa49, 0xfac3d, 0xfae52, 0xfb047, 0xfb23a, 0xfb44e, 0xfb643, 0xfb837, 0xfba4a, 0xfbc3f,
                 0xfbe53,
                 0xfc048, 0xfc23c, 0xfc450, 0xfc645, 0xfc839, 0xfca4c, 0xfcc41, 0xfce36, 0xfd04a, 0xfd23d, 0xfd451,
                 0xfd646,
                 0xfd83a, 0xfda4d, 0xfdc43, 0xfde37, 0xfe04b, 0xfe23f, 0xfe453, 0xfe648, 0xfe83c, 0xfea4f, 0xfec44,
                 0xfee38,
                 0xff04c, 0xff241, 0xff436, 0xff64a, 0xff83e, 0xffa51, 0xffc46, 0xffe3a, 0x10004e, 0x100242,
                 0x100437,
                 0x10064b, 0x100841, 0x100a53, 0x100c48, 0x100e3c, 0x10104f, 0x101244, 0x101438, 0x10164c,
                 0x101842, 0x101a35,
                 0x101c49, 0x101e3d, 0x102051, 0x102245, 0x10243a, 0x10264e, 0x102843, 0x102a37, 0x102c4b,
                 0x102e3f, 0x103053,
                 0x103247, 0x10343b, 0x10364f, 0x103845, 0x103a38, 0x103c4c, 0x103e42, 0x104036, 0x104249,
                 0x10443d, 0x104651,
                 0x104846, 0x104a3a, 0x104c4e, 0x104e43, 0x105038, 0x10524a, 0x10543e, 0x105652, 0x105847,
                 0x105a3b, 0x105c4f,
                 0x105e45, 0x106039, 0x10624c, 0x106441, 0x106635, 0x106849, 0x106a3d, 0x106c51, 0x106e47,
                 0x10703c, 0x10724f,
                 0x107444, 0x107638, 0x10784c, 0x107a3f, 0x107c53, 0x107e48]

    def LunarToSolar(lunar)
        days = @@lunar_month_days[lunar.lunarYear - @@lunar_month_days[0]]
        leap = GetBitInt(days, 4, 13)
        offset = 0
        loopend = leap
        if not lunar.isleap
            if lunar.lunarMonth <= leap or leap == 0
                loopend = lunar.lunarMonth - 1
            else
                loopend = lunar.lunarMonth
            end
        end

        for i in 0..loopend-1
            offset += GetBitInt(days, 1, 12 - i) == 1 ? 30 : 29
        end

        offset += lunar.lunarDay

        solar11 = @@solar_1_1[lunar.lunarYear - @@solar_1_1[0]]

        y = GetBitInt(solar11, 12, 9)
        m = GetBitInt(solar11, 4, 5)
        d = GetBitInt(solar11, 5, 0)

        return SolarFromInt(SolarToInt(y, m, d) + offset - 1)
    end

    def SolarToLunar(solar)

        lunar = Lunar.new(0, 0, 0, false)
        index = solar.solarYear - @@solar_1_1[0]
        data = (solar.solarYear << 9) | (solar.solarMonth << 5) | solar.solarDay
        if @@solar_1_1[index] > data
            index -= 1
        end

        solar11 = @@solar_1_1[index]
        y = GetBitInt(solar11, 12, 9)
        m = GetBitInt(solar11, 4, 5)
        d = GetBitInt(solar11, 5, 0)
        offset = SolarToInt(solar.solarYear, solar.solarMonth, solar.solarDay) - SolarToInt(y, m, d)

        days = @@lunar_month_days[index]
        leap = GetBitInt(days, 4, 13)

        lunarY = index + @@solar_1_1[0]
        lunarM = 1
        offset += 1

        for i in 0..12
            dm = GetBitInt(days, 1, 12 - i) == 1 ? 30 : 29
            if offset > dm
                lunarM += 1
                offset -= dm
            else
                break
            end
        end

        lunarD = offset.to_i()
        lunar.lunarYear = lunarY
        lunar.lunarMonth = lunarM
        lunar.isleap = false
        if leap != 0 and lunarM > leap
            lunar.lunarMonth = lunarM - 1
            if lunarM == leap + 1
                lunar.isleap = true
            end
        end

        lunar.lunarDay = lunarD
        return lunar
    end
end

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

    @input_field3 = UITextField.alloc.initWithFrame([[50, 150], [250, 40]])
    @input_field3.textColor = UIColor.blackColor
    @input_field3.backgroundColor = UIColor.whiteColor
    @input_field3.setBorderStyle UITextBorderStyleRoundedRect
    @input_field3.placeholder = "Enter the built month"
    view.addSubview(@input_field3) 

    @input_field4 = UITextField.alloc.initWithFrame([[50, 200], [250, 40]])
    @input_field4.textColor = UIColor.blackColor
    @input_field4.backgroundColor = UIColor.whiteColor
    @input_field4.setBorderStyle UITextBorderStyleRoundedRect
    @input_field4.placeholder = "Enter the built day"
    view.addSubview(@input_field4)  

		@input_field2 = UITextField.alloc.initWithFrame([[50, 250], [250, 40]])
		@input_field2.textColor = UIColor.blackColor
		@input_field2.backgroundColor = UIColor.whiteColor
		@input_field2.setBorderStyle UITextBorderStyleRoundedRect
		@input_field2.placeholder = "Enter the facing direction"
		view.addSubview(@input_field2) 

		@submit_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @submit_button.frame = [[50,350],[200,260]]
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
  converter = LunarSolarConverter.new
  solar = Solar.new
  solar.solarYear = @input_field.text.to_i
  solar.solarMonth = @input_field3.text.to_i
  solar.solarDay = @input_field4.text.to_i
  lunar = converter.SolarToLunar(solar)
      $year=lunar.lunarYear
      #$year = @input_field.text.to_i
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
  @result_final = $earthStar.to_s
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



end