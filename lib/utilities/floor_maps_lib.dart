library floor_maps_lib;

const availableIndoorFloors = {
  'H': ['1', '8', '9'],
  'MB': ['1', 'S2'],
  'CC': ['1'],
  'VE': ['1', '2'],
  'VL': ['1', '2']
};

const nodeGraph = {
  'H8': {
    '000000': [176, 214], // 0,
    '000001': [307, 214], // 1,
    '000002': [342, 214], // 2,
    '000003': [342, 120], // 3,
    '000004': [463, 214], // 4,
    '000005': [550, 214], // 5,
    '000006': [638, 214], // 6,
    '000007': [731, 214], // 7,
    '000008': [837, 214], // 8,
    '000009': [854, 169], // 9,
    '000010': [837, 323], // 10
    '000011': [837, 398], // 11
    '000012': [837, 513], // 12
    '000013': [837, 598], // hallFloors13
    '000014': [837, 689], // 14
    '000015': [837, 795], // 15
    '000016': [878, 811], // 16
    '000017': [730, 795], // 17
    '000018': [641, 795], // 18
    '000019': [641, 684], // 19
    '000020': [550, 795], // 20
    '000021': [462, 795], // 21
    '000022': [400, 795], // 22
    '000023': [400, 690], // 23
    '000024': [368, 795], // 24
    '000025': [282, 795], // 25
    '000026': [176, 795], // 26
    '000027': [90, 805], // 27
    '000028': [176, 655], // 28
    '000029': [176, 593], // 29
    '000030': [176, 501], // 30
    '000031': [176, 397], // 31
    '000032': [176, 319], // 32
    '000033': [132, 195], // 33
    '000034': [132, 167], // 34
    '000035': [264, 397], // 35
    '000036': [264, 440], // 36
    '000037': [264, 485], // 37
    '000038': [264, 514], // 38
    '000039': [368, 397], // 39
    '000040': [479, 397], // 40
    '000041': [550, 397], // 41
    '000042': [550, 636], // 42
    '140000': [550, 900], // 43
    '140001': [550, 106], // 44
    '100801': [176, 143], // 45
    '100802': [307, 262], // 46
    '100803': [307, 143], // 47
    '100805': [342, 87], // 48
    '100807': [463, 143], // 49
    '100810': [638, 262], // 50
    '100811': [638, 143], // 51
    '100813': [731, 143], // 52
    '100815': [854, 143], // 53
    '100817': [898, 143], // 54
    '100819': [898, 214], // 55
    '100820': [638, 459], // 56
    '100821': [898, 323], // 57
    '100822': [773, 598], // 58
    '100823': [898, 398], // 59
    '100825': [898, 513], // 60
    '100827': [898, 598], // 61
    '100829': [898, 689], // 62
    '100831': [878, 860], // 63
    '100832': [641, 635], // 64
    '100833': [837, 860], // 65
    '100835': [730, 860], // 66
    '100837': [641, 860], // 67
    '100841': [462, 860], // 68
    '100842': [400, 627], // 69
    '100843': [368, 860], // 70
    '100845': [282, 860], // 71
    '100847': [176, 860], // 72
    '100849': [90, 860], // 73
    '100851': [90, 752], // 74
    '100852': [219, 655], // 75
    '100853': [110, 655], // 76
    '100854': [233, 593], // 77
    '100855': [110, 593], // 78
    '100857': [110, 501], // 79
    '100859': [110, 397], // 80
    '100861': [110, 319], // 81
    '100862': [368, 452], // 82
    '100863': [110, 195], // 83
    '100865': [106, 167], // 84
    '100867': [132, 109], // 85
    '120000': [480, 636], // 86
    '120001': [479, 445], // 87
    '110000': [305, 358], // 88 Top-left
    '110001': [300, 742], // 89 Bottom-left
    '110002': [715, 738], // 90 bottom-right
    '110003': [712, 272], // 91 top-right
    '130000': [356, 348], // 92
  },
  'H9': {
    '000000': [181, 226], // 0,
    '000001': [437, 226], // 1,
    '000002': [532, 226], // 2,
    '000003': [642, 226], // 3,
    '000004': [720, 226], // 4,
    '000005': [843, 226], // 5,
    '000006': [860, 183], // 6,
    '000007': [843, 336], // 7,
    '000008': [843, 414], // 8,
    '000009': [824, 532], // 9,
    '000010': [870, 503], // 10
    '000011': [801, 584], // 11
    '000012': [815, 649], // 12
    '000013': [827, 705], // 13
    '000014': [827, 850], // 14
    '000015': [707, 843], // 15
    '000016': [666, 755], // 16
    '000017': [716, 649], // 17
    '000018': [666, 649], // 18
    '000019': [569, 649], // 19
    '000020': [532, 649], // 20
    '000021': [478, 677], // 21
    '000022': [407, 672], // 22
    '000023': [404, 759], // 23
    '000024': [404, 802], // 24
    '000025': [404, 846], // 25
    '000026': [382, 900], // 26
    '000027': [82, 901], // 27
    '000028': [80, 799], // 28
    '000029': [83, 667], // 29
    '000030': [83, 528], // 30
    '000031': [299, 667], // 31
    '000032': [521, 546], // 32
    '000033': [531, 409], // 33
    '000034': [457, 409], // 34
    '000035': [362, 409], // 35
    '000036': [273, 409], // 36
    '000037': [182, 409], // 37
    '000038': [179, 333], // 38
    '000039': [531, 331], // 39
    '100902': [437, 272], // 40
    '100903': [181, 152], // 41
    '100907': [437, 152], // 42
    '100909': [532, 152], // 43
    '100910': [642, 272], // 44
    '100911': [642, 152], // 45
    '100913': [720, 152], // 46
    '100914': [489, 331], // 47
    '100915': [860, 152], // 48
    '100917': [912, 183], // 49
    '100919': [912, 226], // 50
    '100920': [642, 474], // 51
    '100921': [912, 336], // 52
    '100923': [912, 414], // 53
    '100925': [912, 503], // 54
    '100927': [912, 705], // 55
    '100928': [797, 815], // 56
    '100929': [887, 923], // 57
    '100933': [787, 898], // 58
    '100937': [594, 811], // 59
    '100941': [416, 916], // 60
    '100943': [365, 846], // 61
    '100945': [365, 802], // 62
    '100961': [121, 799], // 63
    '100962': [362, 470], // 64
    '100963': [182, 470], // 65
    '100964': [273, 470], // 66
    '100965': [112, 333], // 67
    '100966': [407, 625], // 68
    '100967': [112, 226], // 69
    '100968': [299, 625], // 70
    '100980': [569, 582], // 71
    '100981': [367, 759], // 72
    '110000': [273, 339], // 73
    '110001': [299, 735], // 74
    '110002': [716, 735], // 75
    '110003': [720, 339], // 76
    '130000': [362, 362], // 77
    '120000': [457, 437], // 78
    '120001': [465, 546], // 79
  }
};

const floorPlan = {
  'H1': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">
 <metadata id="metadata7">image/svg+xml</metadata>

 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="1026" width="1026" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="layer4">
   <g transform="matrix(-0.99582912,0,0,-0.99239778,1021.6871,1021.4805) " id="g4587">
    <rect fill="#ffffff" stroke-width="2.011846" stroke-miterlimit="4" id="rect3365" width="1013.302501" height="458.709127" x="1.55452" y="178.912988" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4205" width="110.446667" height="163.469611" x="545.404409" y="433.245793" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4207" width="104.456804" height="138.469633" x="375.947637" y="498.245715" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_1" width="134.446642" height="41.469768" x="545.404407" y="596.245568" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_2" width="155.456745" height="216.469557" x="858.947004" y="420.2458" stroke="#000000"/>
    <path fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" d="m562.38935,422.13631l39.4444,98.13938l78.20147,116.39946l189.37019,0l78.96815,-114.47551l36.03399,-101.96976l-125.73567,-71.83231l-146.97089,-0.00381l-17.5381,-0.16285l-131.77354,73.9054z" id="path4332" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4336" width="210.537891" height="93.456811" x="181.191299" y="351.007898" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_3" width="379.456429" height="73.469703" x="0.948075" y="563.245638" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_4" width="182.456686" height="73.469703" x="197.947821" y="498.245723" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_5" width="197.456658" height="73.469703" x="2.94809" y="498.245723" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_8" width="86.456825" height="138.469633" x="374.947637" y="306.245971" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_9" width="76.53805" height="38.456885" x="537.190838" y="179.008123" stroke="#000000"/>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="754.000003" y="474.666713" id="svg_11" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(-180 773.161376953125,466.62530517578125) ">110</text>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_13" width="86.456825" height="138.469633" x="0.280953" y="432.912644" stroke="#000000"/>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="127.333316" y="541.333371" id="svg_14" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 146.49468994140625,533.2865600585938) ">118</text>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="551.333329" y="501.333382" id="svg_16" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 570.4924926757812,493.28182983398443) ">112</text>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="411.333327" y="569.333371" id="svg_18" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 430.49734497070307,561.2865600585938) ">115</text>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="209.999984" y="398.666695" id="svg_19" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 230.04931640625,390.6147766113281) ">102</text>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="952.666685" y="574.666717" id="svg_20" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 972.7180786132812,566.6252441406251) ">109</text>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="399.333327" y="382.666705" id="svg_21" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 419.3827209472656,374.6145935058594) ">196</text>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_22" width="51.204712" height="38.456885" x="323.857493" y="405.674801" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_23" width="49.871382" height="38.456885" x="274.524162" y="405.674801" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_24" width="30.456822" height="79.802975" x="0.280953" y="432.91265" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_26" width="86.456825" height="81.136292" x="0.280953" y="356.912651" stroke="#000000"/>
    <line fill="none" stroke="#000000" stroke-width="2.011846"  x1="216.666648" y1="226.666683" x2="365.999993" y2="226.333335" id="svg_28"  />
    <line fill="none" stroke="#000000" stroke-width="2.011846"  x1="365.999994" y1="177.33335" x2="365.666659" y2="225" id="svg_29"  />
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_30" width="181.871427" height="38.456885" x="614.524182" y="179.008123" stroke="#000000"/>
    <text fill="#000000" stroke="#000000" stroke-width="0"  x="599.333331" y="224.000038" id="svg_31" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 662.0493774414062,206.61495971679685) ">103</text>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_33" width="34.456822" height="119.802972" x="0.280953" y="236.912633" stroke="#000000"/>
    <text fill="#000000" stroke-width="0"  x="-5.516575" y="303.990943" id="svg_34" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 17.886415481567383,296.0997314453125) matrix(0.8335283994674683,0,0,1,5.800494831055403,0) " stroke="#000000">101</text>
    <line fill="none" stroke="#000000" stroke-width="2.011846"  x1="595.333338" y1="524.000033" x2="595.000003" y2="571.666683" id="svg_35"   transform="rotate(-101 595.1668701171875,547.8333740234376) "/>
    <line fill="none" stroke-width="2.011846"  x1="557.345746" y1="482.721017" x2="559.654413" y2="554.279042" id="svg_36"   transform="rotate(-21 558.5000610351562,518.500244140625) " stroke="#000000"/>
    <text fill="#000000" stroke="#000000" stroke-width="0" x="571.333334" y="580.000056" id="svg_37" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve" transform="rotate(180 590.497314453125,571.95361328125) ">114</text>
    <line fill="none" stroke="#000000" stroke-width="2.011846"  x1="285.999994" y1="302.33335" x2="285.666659" y2="350" id="svg_6"  />
    <line fill="none" stroke="#000000" stroke-width="2.011846"  x1="215.999994" y1="302.33335" x2="215.666659" y2="350" id="svg_7"  />
   </g>
  </g>
 </g>
</svg>''',
  'H9': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">
 <metadata id="metadata7">image/svg+xml</metadata>

 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="1026" width="1026" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="layer4">
   <g transform="matrix(-0.99582912,0,0,-0.99239778,1021.6871,1021.4805) " id="g4587">
    <rect fill="#ffffff" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect3365" width="1007.1639" height="927.04303" x="8.592215" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4137" width="60.09816" height="48.992397" x="8.592215" y="325.98459"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4139" width="60.09816" height="45.456867" x="8.592215" y="374.97699"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4141" width="83.836746" height="115.66246" x="8.592215" y="420.43387"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4145" width="58.083767" height="56.063465" x="92.428963" y="459.32474"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4147" width="58.083771" height="38.890869" x="92.428963" y="420.43387"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4149" width="141.41544" height="112.632" x="8.592215" y="536.09631"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4151" width="141.41544" height="92.42897" x="8.592215" y="648.72833"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4153" width="141.41544" height="92.42894" x="8.592215" y="741.15729"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4155" width="141.41544" height="141.79906" x="8.592215" y="833.58624"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4157" width="95.964493" height="141.79904" x="237.38585" y="833.58624"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4159" width="89.903572" height="141.79904" x="333.35034" y="833.58624"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4161" width="91.418808" height="141.79904" x="423.25391" y="833.58624"/>
    <rect fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4163" width="256.397369" height="149.37518" x="514.672731" y="826.01007" stroke="#000000"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4167" width="180.31221" height="149.37521" x="694.070608" y="826.01007"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4171" width="140.45891" height="235.23814" x="875.29718" y="740.14716"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4173" width="140.45891" height="93.439133" x="875.29718" y="646.70801"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4177" width="60.656864" height="46.467018" x="955.09924" y="488.11407"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4179" width="60.656853" height="89.398499" x="955.09924" y="398.71558"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4181" width="60.656853" height="46.972095" x="955.09924" y="351.74347"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4183" width="60.656853" height="44.951775" x="955.09924" y="306.79169"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4185" width="60.656853" height="46.972088" x="955.09924" y="259.81961"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4191" width="55.101025" height="43.941647" x="960.65509" y="215.87796"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4193" width="55.101006" height="45.45686" x="960.65509" y="170.4211"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4195" width="55.101006" height="46.467014" x="960.65509" y="123.95408"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4197" width="46.467018" height="61.469692" x="921.25909" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4199" width="47.477142" height="61.469692" x="873.78192" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4201" width="44.446682" height="61.469692" x="829.33527" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4203" width="44.446739" height="61.469692" x="784.88855" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4205" width="44.446735" height="61.469692" x="740.44183" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4207" width="45.456882" height="61.469692" x="694.98492" y="48.342255"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4209" width="110.6117" height="56.063465" x="821.25403" y="135.06577"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4220" width="110.61185" height="94.449234" x="821.25403" y="191.12923"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4222" width="55.55854" height="21.718307" x="876.30731" y="285.57846"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4224" width="55.558575" height="43.436577" x="876.30731" y="307.29675"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4226" width="185.36301" height="51.012703" x="635.89105" y="196.68506"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4228" width="71.215767" height="96.974655" x="750.03827" y="247.69775"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4230" width="53.53809" height="96.974648" x="696.50018" y="247.69775"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4234" width="60.609131" height="36.870575" x="635.89105" y="247.69775"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4236" width="60.609131" height="60.104073" x="635.89105" y="284.56833"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4238" width="26.263969" height="22.72842" x="670.23621" y="321.94397"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4240" width="38.890881" height="61.619293" x="782.36316" y="135.06577"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4242" width="41.921345" height="61.619293" x="740.44183" y="135.06577"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m652.05349,135.06577l88.38834,0l0,61.61929l-104.55078,0l0,-30.80965l16.16244,-30.80964z" id="rect4246"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m651.5625,48.34375l0,46.3125l10.09375,0l0,15.15625l33.34375,0l0,-61.46875l-43.4375,0z" id="rect4249"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m8.59375,48.34375l0,191.28125l179.28125,0l0,-72.24889l16.6875,-15.65736l0,-103.375l-195.96875,0z" id="rect4254"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m149.50258,155.77388l29.28774,0l9.58976,11.12833l-0.50508,51.50113l-38.37242,0l0,-62.62946z" id="rect4259"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m294.8442,97.02514l28.06511,-12.4589l40.69201,0.16802l15.02038,32.37714l-62.19113,27.94825l-21.58637,-48.03451z" id="rect4262"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m316.43057,145.05964l112.00101,-50.33246l0.02584,42.01978l-11.5538,-0.08758l-86.81015,38.80328l-13.6629,-30.40302z" id="rect4315"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m335.87572,48.34226l0,36.27752l27.7256,0.11447l15.02037,32.37714l49.80989,-22.38421l0,-46.38492l-92.55586,0z" id="path4324"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m428.45742,136.74696l96.8219,0l13.63706,-29.46039l0,-58.94432l-110.4848,0l0.02584,88.40471z" id="path4326"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m661.65625,109.8125l-24.24999,0l-29.29443,64.64921l-82.83251,-37.71475l13.63706,-29.46039l0,-58.94432l112.64612,0.0015l0,46.3125l10.09375,0l0,15.15625z" id="path4328"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m204.5625,151.71875l17.68163,17.68163l105.12499,0l-32.52492,-72.37524l28.06511,-12.4589l12.96641,0.05354l0,-36.27752l-131.31322,0.0015l0,103.37499z" id="path4330"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m330.09347,175.46266l25.9853,51.52698l51.51778,61.11423l124.75384,0l52.02286,-60.10408l23.73858,-53.53808l-82.83251,-37.71475l-96.8219,-0.002l-11.5538,-0.0855l-86.81015,38.8032z" id="path4332"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m419.71838,288.10387l0,48.48732c32.82996,12.62691 69.65311,10.02829 100.51018,0l0,-48.48732l-100.51018,0z" id="path4334"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4336" width="53.538086" height="45.456863" x="520.22858" y="288.10388"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m545.50627,272.90436l15.63347,15.19952l41.41625,0l0,-17.1726l-32.0548,-26.90454l-24.99492,28.87762z" id="path4338"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m602.55599,270.93128l5.47973,0l0,-56.217l-17.77173,0l-5.89074,13.28551l-13.87206,16.02695l32.0548,26.90454z" id="path4340"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m608.03572,214.71428l0,-40.08092l-17.77173,40.08092l17.77173,0z" id="path4342"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m407.59655,288.10387l-29.04188,0l16.80782,-14.51295l12.23406,14.51295z" id="path4344"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m311.78571,169.40038l0,-17.36467l6.32779,-3.23116l9.25562,20.59583l-15.58341,0z" id="path4346"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m208.92857,195.07143l0,53.21428l50.35714,0l0,-59.28571l-44.64285,0l-5.71429,6.07143z" id="path4348"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4350" width="45.000103" height="59.28569" x="259.28571" y="189"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4355" width="52.5" height="96.428596" x="281.42856" y="248.28569"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4357" width="72.499985" height="96.428574" x="208.92857" y="248.28571"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m304.28581,189l0,59.28569l29.64275,0l-29.64275,-59.28569z" id="path4359"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m90,330.4375l0,66.78125l-21.3125,0l0,23.21875l119.53125,0l0,-90l-98.21875,0z" id="rect4361"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m187.875,239.625l0,73.30357l-16.80357,0l0,17.50893l-81.07143,0l0,66.78125l-21.30963,0l0,-71.23416l-60.09816,0l0.00154,-86.35959l179.28125,0z" id="path4366"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m237.38585,833.58624l-59.88585,0l0,30.7709l-27.49235,0l0,111.02814l87.3782,0l0,-141.79904z" id="path4368"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m248,468.40625l0,59.09375l19.1875,0l0,59.09375l-19.1875,0l0,57.59375l179.8125,0l0,-175.78125l-179.8125,0z" id="rect4370"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4372" width="57.578693" height="59.093925" x="209.60666" y="527.51001"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m267.1875,527.5l36.02679,-59.09375" id="path4377"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m267.18535,586.59375l34.60036,57.59375" id="path4379"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m241.9375,413.375l0,55.03125l185.875,0l0,307.09375l48.46875,0l0,-307.09375l0,-55.03125l-234.34375,0z" id="rect4381"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4386" width="97.492615" height="131.3125" x="330.31989" y="644.1875"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4388" width="52.022858" height="131.3125" x="278.29703" y="644.1875"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4390" width="69.19545" height="29.794643" x="209.10158" y="644.1875"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4392" width="69.19545" height="101.51785" x="209.10158" y="673.98212"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4396" width="57.142857" height="26.428572" x="875.71429" y="372.21429"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4402" width="57.14291" height="45.71431" x="875.71429" y="398.64285"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4404" width="57.142891" height="44.285732" x="875.71429" y="444.35718"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4406" width="57.142838" height="45.950836" x="875.71429" y="488.64291"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m832.84375,534.59375l0,52.96875l26.8125,0l0,59.15625l156.09375,0l0,-112.125l-156.09375,0l-26.8125,0z" id="rect4408"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m821.25,285.59375l0,40.1875l17.6875,0l0,18.90625l37.375,0l0,-59.09375l-55.0625,0z" id="rect4415"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4420" width="157.50002" height="92.142845" x="718.21429" y="372.21429"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4422" width="89.285721" height="52.14286" x="786.42859" y="464.35715"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4424" width="42.870544" height="18.093742" x="832.84375" y="516.5"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4426" width="46.415161" height="42.857136" x="786.42859" y="516.5"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4428" width="53.558033" height="43.928577" x="779.28571" y="559.35712"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4430" width="111.61768" height="92.142845" x="606.59662" y="372.21429"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4432" width="49.49749" height="46.199253" x="557.09912" y="372.21429"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4436" width="49.497498" height="45.943592" x="557.09912" y="418.41354"/>
    <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4438" width="24.890882" height="52.04121" x="581.705749" y="464.35715"/>
    <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4440" width="24.890867" height="86.873123" x="581.705749" y="516.39838"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4442" width="85.35788" height="138.91437" x="606.59662" y="464.35715"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m691.9545,603.27151l87.33121,0l0,-43.91439l7.14288,0l0,-94.99997l-94.47409,0l0,138.91436z" id="path4448"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4450" width="93.43911" height="136.87567" x="730.34027" y="644.18262"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4452" width="54.043182" height="96.469597" x="730.34027" y="644.18262"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4454" width="34.850243" height="38.385822" x="695.49005" y="644.18262"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4458" width="60.609104" height="28.881376" x="634.88086" y="653.68719"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4462" width="68.690369" height="38.385822" x="566.19049" y="644.18262"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4464" width="54.548225" height="108.08635" x="511.64227" y="644.18262"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m566.1875,696.21875l0,56.0625l13.625,0l20.21875,0l0,28.78125l130.3125,0l0,-84.84375l-164.15625,0z" id="rect4466"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4468" width="54.548237" height="52.527916" x="600.03064" y="728.5304"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4473" width="68.170227" height="28.793533" x="511.64227" y="752.26898"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4698" d="m1015.76751,123.95403l0,-75.60603l-48.04413,0l0,61.46729l-7.0607,0l0,14.13874l7.0607,0l48.04413,0z"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4703" d="m561.13978,288.10384l-15.63347,-15.19952l-13.15588,15.19951l28.78935,0.00001z"/>
    <line   id="svg_1" y2="495" x2="556.5" y1="602" x1="557.5"   stroke-width="2.011846" stroke="#000000" fill="none"/>
   </g>
  </g>
  <text stroke="#000000" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_8" y="812.907495" x="531.000109" stroke-width="0" fill="#000000"/>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="828.992687" x="533.999685"   stroke-width="0" stroke="#000000" fill="#000000">937</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="616.994563" x="344.001363"   stroke-width="0" stroke="#000000" fill="#000000">966</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_11" y="616.994563" x="209.002544"   stroke-width="0" stroke="#000000" fill="#000000">968</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_12" y="505.995525" x="354.001271"   stroke-width="0" stroke="#000000" fill="#000000">962</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_13" y="504.995534" x="267.002026"   stroke-width="0" stroke="#000000" fill="#000000">964</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_14" y="448.996044" x="71.003774"   stroke-width="0" stroke="#000000" fill="#000000">963</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_15" y="592.994762" x="643.998716"   stroke-width="0" stroke="#000000" fill="#000000">980</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_16" y="479.995769" x="646.998687"   stroke-width="0" stroke="#000000" fill="#000000">920</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_17" y="326.997112" x="625.998877"   stroke-width="0" stroke="#000000" fill="#000000">910</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_18" y="296.997371" x="315.001622"   stroke-width="0" stroke="#000000" fill="#000000">902</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_19" y="137.998775" x="224.002263"   stroke-width="0" stroke="#000000" fill="#000000">903</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_20" y="137.998775" x="405.000757"   stroke-width="0" stroke="#000000" fill="#000000">907</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_21" y="185.998351" x="58.003906"   stroke-width="0" stroke="#000000" fill="#000000">967</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_22" y="338.997011" x="58.003906"   stroke-width="0" stroke="#000000" fill="#000000">965</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_23" y="137.998775" x="535.999687"   stroke-width="0" stroke="#000000" fill="#000000">909</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_24" y="137.998775" x="625.998898"   stroke-width="0" stroke="#000000" fill="#000000">911</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_25" y="137.998775" x="716.998101"   stroke-width="0" stroke="#000000" fill="#000000">913</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_26" y="137.998775" x="806.997312"   stroke-width="0" stroke="#000000" fill="#000000">915</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_27" y="137.998775" x="919.996322"   stroke-width="0" stroke="#000000" fill="#000000">917</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_28" y="246.99782" x="919.996322"   stroke-width="0" stroke="#000000" fill="#000000">919</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_29" y="337.997023" x="919.996322"   stroke-width="0" stroke="#000000" fill="#000000">921</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_30" y="437.996146" x="920.996313"   stroke-width="0" stroke="#000000" fill="#000000">923</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_31" y="551.995147" x="951.996042"   stroke-width="0" stroke="#000000" fill="#000000">925</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_32" y="750.993404" x="903.996462"   stroke-width="0" stroke="#000000" fill="#000000">927</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_33" y="895.992133" x="903.996462"   stroke-width="0" stroke="#000000" fill="#000000">929</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_34" y="922.991895" x="744.997866"   stroke-width="0" stroke="#000000" fill="#000000">933</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_35" y="933.991798" x="412.000796"   stroke-width="0" stroke="#000000" fill="#000000">941</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_36" y="944.9917" x="520.999834"   stroke-width="0" stroke="#000000" fill="#000000">929</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_37" y="866.992387" x="312.001681"   stroke-width="0" stroke="#000000" fill="#000000">943</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_38" y="809.992889" x="281.001953"   stroke-width="0" stroke="#000000" fill="#000000">945</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_39" y="765.993279" x="338.001449"   stroke-width="0" stroke="#000000" fill="#000000">981</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_40" y="798.992989" x="130.00328"   stroke-width="0" stroke="#000000" fill="#000000">961</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_41" y="337.997009" x="466.000295"   stroke-width="0" stroke="#000000" fill="#000000">914</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_42" y="814.992849" x="769.997645"   stroke-width="0" stroke="#000000" fill="#000000">928</text>
 </g>
</svg>''',
  'H8': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="layer2">
   <g stroke="#000000" stroke-width="2.550478" stroke-miterlimit="4" transform="matrix(1.4703124,0,0,1.4703124,-39.192937,-241.91877) " id="g3987">
    <rect fill="#ffffff" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3007" width="682.14288" height="625.71429" x="33.57143" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3781" width="95.178574" height="69.821426" x="33.57143" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3783" width="60.714279" height="92.142853" x="128.75" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3785" width="66.785721" height="92.142853" x="189.46428" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3787" width="55.714287" height="37.321423" x="256.25" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3789" width="42.499992" height="27.142853" x="269.46429" y="238.250848"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3791" width="42.499992" height="27.678572" x="269.46429" y="265.393698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3797" width="63.92857" height="92.142838" x="311.96429" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3803" width="66.428574" height="92.142853" x="431.78571" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3805" width="55.714294" height="92.142853" x="498.21429" y="200.929438"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m621.42857,200.929438l0,71.42857l-18.92857,0l0,20.71428l-48.57141,0l0,-92.14285l67.49998,0z" id="path3809"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3811" width="94.285744" height="91.785706" x="621.42859" y="200.929438"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3813" width="94.285721" height="66.071434" x="621.42859" y="292.715148"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3815" width="94.285721" height="57.499996" x="621.42859" y="358.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3817" width="94.285721" height="66.071426" x="621.42859" y="416.286588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3819" width="94.285721" height="57.499992" x="621.42859" y="482.357998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3821" width="94.285721" height="65.000015" x="621.42859" y="539.857998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3823" width="94.285721" height="63.214279" x="621.42859" y="604.857998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3825" width="94.642883" height="97.500015" x="621.07141" y="729.143698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3827" width="61.785694" height="97.500031" x="559.28571" y="729.143698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3829" width="62.857132" height="97.500031" x="496.42856" y="729.143698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3831" width="63.214272" height="97.500031" x="433.21429" y="729.143698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3833" width="59.285713" height="97.857155" x="315.71429" y="728.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3835" width="67.142868" height="97.857147" x="248.57143" y="728.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3837" width="56.42857" height="97.857147" x="192.14285" y="728.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3839" width="67.499992" height="97.857147" x="124.64286" y="728.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3841" width="91.071426" height="97.857147" x="33.57143" y="728.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3843" width="50.35714" height="31.785723" x="33.57143" y="697.000878"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3845" width="64.285713" height="31.785732" x="33.57143" y="665.215178"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3847" width="31.071428" height="40.357117" x="97.857147" y="665.215178"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3849" width="95.357147" height="62.142883" x="33.57143" y="603.072288"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3851" width="95.357147" height="62.857143" x="33.57143" y="540.215178"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3853" width="95.357147" height="60.000027" x="33.57143" y="480.215148"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3855" width="95.357147" height="62.499996" x="33.57143" y="417.715148"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3857" width="95.357147" height="61.42857" x="33.57143" y="356.286588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3859" width="77.85714" height="24.10714" x="33.57143" y="270.750878"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m128.92858,356.286588l0,-47.14287l-17.50001,0l0,-14.2857l-77.85714,0l0,61.42857l95.35715,0z" id="path3861"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m640.71429,729.143698l0,-17.49998l-18.57143,0l-0.71427,-43.57144l94.28572,0l-0.00002,61.07142l-75,0z" id="path3863"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3865" width="62.142857" height="90.35714" x="165.71428" y="330.572288"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3873" width="111.42858" height="61.785713" x="227.85713" y="330.572288"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3875" width="34.285713" height="34.285713" x="280.35715" y="330.572288"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3877" width="21.785721" height="28.571426" x="227.85713" y="392.357998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3881" width="22.500006" height="23.571428" x="249.64285" y="392.357998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3883" width="20" height="23.571421" x="272.14285" y="392.357998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3885" width="36.428574" height="27.5" x="339.28571" y="392.357998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3887" width="36.428566" height="24.642849" x="339.28571" y="367.715148"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3889" width="36.428558" height="26.428568" x="339.28571" y="341.286588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3891" width="47.142853" height="27.499992" x="292.14285" y="392.357998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3895" width="25" height="195.71428" x="313.92856" y="454.857998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3897" width="37.857155" height="29.999985" x="338.92856" y="620.572288"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3899" width="63.214272" height="88.214294" x="250.71428" y="454.857998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3901" width="33.928566" height="57.142864" x="216.78572" y="454.857998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3903" width="33.928558" height="31.07143" x="216.78572" y="512.000878"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3908" width="34.285713" height="27.857143" x="171.78572" y="484.143728"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3913" width="34.28574" height="29.285812" x="171.78572" y="454.857998"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m216.78572,543.250868l0,-19.46429l-10.35715,0l-0.35714,-11.7857l-34.28571,0l0,31.24999l45,0z" id="path3917"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3919" width="36.07143" height="65.714287" x="215.71428" y="623.786588"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3923" width="43.928551" height="65.714371" x="171.78572" y="623.786528"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m171.78572,543.250868l0,57.67856l52.85714,0l0,-7.14285l26.24999,0l0,-50.71429l-79.10713,0.17858z" id="path3925"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m250.89285,543.072288l0,69.64286l17.67858,0l0,10.53571l45.35713,0l-0.00001,-80.17857l-63.0357,0z" id="path3927"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3931" width="52.85717" height="22.857094" x="171.78572" y="600.929408"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3933" width="41.663605" height="24.376646" x="251.78571" y="665.124228"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m313.92856,650.572278l0,26.1687l38.36214,0l0,12.12183l24.74874,0l-0.25373,-38.29053l-62.85715,0z" id="path3935"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m293.44931,665.124228l0,-41.87337l-24.87788,0l0,16.87209l-16.78572,0l0,25.00128l41.6636,0z" id="path3937"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3941" width="64.649765" height="89.398499" x="431.84021" y="331.016258"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3943" width="11.785714" height="12.770314" x="443.57144" y="331.016258"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3945" width="36.01004" height="89.398483" x="496.48999" y="331.016258"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3947" width="48.035873" height="70.091736" x="532.5" y="331.016258"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3949" width="48.035843" height="19.306747" x="532.5" y="401.107998"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3951" width="39.107143" height="40.714287" x="541.07141" y="459.143728"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4731" d="m431.842197,420.412372l0,118.023387l121.976629,0l0,-38.575986l-12.752392,0l0,-40.722638l12.752392,0l0,-38.724764l-121.976629,0z"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3955" width="83.571426" height="85.714287" x="498.21429" y="538.429408"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3957" width="36.428562" height="65.178596" x="498.21429" y="624.143698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3959" width="47.142864" height="65.178604" x="534.64288" y="624.143698"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3961" width="28.214294" height="65.178596" x="470" y="624.143698"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m431.84021,420.414758l0,182.83765" id="path3963"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3965" width="25.00128" height="43.184021" x="431.84021" y="603.252408"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3969" width="25.00128" height="21.993006" x="431.84021" y="646.436428"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" id="rect3971" width="25.00128" height="20.892859" x="431.84021" y="668.429408"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m470,624.143698l-13.15851,0" id="path3973"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m498.21429,538.429408l-66.37408,0" id="path3975"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m541.07141,499.858018l-22.86315,38.57139" id="path3981"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m541.07141,459.143728l-23.36823,-38.72898" id="path3983"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="1.360255" stroke-miterlimit="4" d="m375.71428,454.143708l0,127.89547" id="path3985"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4717" d="m224.637082,593.78114l0,18.937302l0,11.073327l26.248673,0l0.892667,0l0,16.323062l16.790649,0l0,-27.396389l-17.683317,0l0,-18.937302l-26.248673,0z"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4726" d="m431.842197,538.435759l0,64.824659l24.994688,0l0,20.892669l41.381512,0l0,-20.892669l0,-64.824659l-66.3762,0z"/>
    <ellipse id="svg_1" cy="808.907945" cx="521.000051" stroke-width="1.360255" stroke="#000000" fill="#ffffff"/>
   </g>
  </g>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_2" y="910.908529" x="56.997396" stroke-width="0" stroke="#000000" fill="#000000">849</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_3" y="502.997627" x="356.996731" stroke-width="0" stroke="#000000" fill="#000000">852</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_4" y="910.908529" x="172.99806" stroke-width="0" stroke="#000000" fill="#000000">847</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_5" y="910.908529" x="264.998587" stroke-width="0" stroke="#000000" fill="#000000">845</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_6" y="912" x="355" stroke-width="0" stroke="#000000" fill="#000000">843</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_7" y="912" x="449.000538" stroke-width="0" stroke="#000000" fill="#000000">841</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_8" y="911" x="625.001545" stroke-width="0" stroke="#000000" fill="#000000">837</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="910.999989" x="717.002071" stroke-width="0" stroke="#000000" fill="#000000">835</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="910.999989" x="809.002598" stroke-width="0" stroke="#000000" fill="#000000">833</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_11" y="913" x="925.003265" stroke-width="0" stroke="#000000" fill="#000000">831</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_12" y="702" x="923" stroke-width="0" stroke="#000000" fill="#000000">829</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_13" y="610.998264" x="925.003265" stroke-width="0" stroke="#000000" fill="#000000">827</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_14" y="522.997761" x="923.999989" stroke-width="0" stroke="#000000" fill="#000000">825</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_15" y="432.997246" x="923.999989" stroke-width="0" stroke="#000000" fill="#000000">823</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_16" y="338.996708" x="925" stroke-width="0" stroke="#000000" fill="#000000">821</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_17" y="246.996174" x="925" stroke-width="0" stroke="#000000" fill="#000000">819</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_18" y="128.995495" x="925" stroke-width="0" stroke="#000000" fill="#000000">817</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_19" y="128.995495" x="802.999298" stroke-width="0" stroke="#000000" fill="#000000">815</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_20" y="128.995495" x="714.998795" stroke-width="0" stroke="#000000" fill="#000000">813</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_21" y="128.995495" x="626.998291" stroke-width="0" stroke="#000000" fill="#000000">811</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_22" y="128.995495" x="448.997269" stroke-width="0" stroke="#000000" fill="#000000">807</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_23" y="88.995262" x="358.99675" stroke-width="0" stroke="#000000" fill="#000000">805</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_24" y="128.995491" x="270.996246" stroke-width="0" stroke="#000000" fill="#000000">803</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_25" y="128.995491" x="176.995708" stroke-width="0" stroke="#000000" fill="#000000">801</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_26" y="116.995422" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">867</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_27" y="180.995789" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">865</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_28" y="250.996189" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">863</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_29" y="338.996693" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">861</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_30" y="426.997196" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">859</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_31" y="518.997723" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">857</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_32" y="604.998215" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">855</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_33" y="702.998775" x="62.995052" stroke-width="0" stroke="#000000" fill="#000000">853</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_34" y="768.999153" x="36.9949" stroke-width="0" stroke="#000000" fill="#000000">851</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_35" y="666.998562" x="230.996006" stroke-width="0" stroke="#000000" fill="#000000">852</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_36" y="478.997475" x="284.996315" stroke-width="0" stroke="#000000" fill="#000000">860</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_37" y="620.998299" x="356.996731" stroke-width="0" stroke="#000000" fill="#000000">842</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_128" y="302.996468" x="316.996506" stroke-width="0" stroke="#000000" fill="#000000">802</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_129" y="322.996582" x="620.998245" stroke-width="0" stroke="#000000" fill="#000000">810</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_130" y="472.997444" x="656.998451" stroke-width="0" stroke="#000000" fill="#000000">820</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_132" y="616.998268" x="626.99828" stroke-width="0" stroke="#000000" fill="#000000">832</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_133" y="616.998268" x="730.998875" stroke-width="0" stroke="#000000" fill="#000000">822</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_135" y="604.998207" x="250.99612" stroke-width="0" stroke="#000000" fill="#000000">854</text>
 </g>
</svg>''',
  'MB1': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="g3906">
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m358.57143,146.85714l102.14286,734.28572l15.71428,0l32.14286,111.42857l226.42857,0l0,8.57147l46.42857,0l0,9.2857l198.92857,0l0,-354.12413l-128.79854,0l0,-543.73304l-36.5586,0l0,17.14285l-184.28571,0l0,-16.42857l-25,0l0,-15.71428l-208.57143,0l0,49.28571l-38.57143,0z" id="path3908"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m517.85714,97.57143l0,71.42857l29.28572,0l0,38.57143l72.14285,0l0,-94.28572l-13.57142,0l0,-15.71428l-87.85715,0z" id="path3910"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m619.28571,153.28571l35,0l17.66827,30.60234l0,52.96909l179.60462,0l0,-124.28571l-36.5586,0l0,17.14285l-184.28571,0l0,-16.42857l-11.42858,0l0,40z" id="path3912"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m549.28571,241.14286l62.85715,0l199.32896,53.41003l0,179.44711l-178.12618,47.72877l-84.05993,0l0,-280.58591z" id="path3914"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m760,236.85714l0,43.90392l51.47182,13.79183l0,179.44711l-122.0369,32.69969l0,33.72888l45.56508,0l0,41.42857l25.71429,0l0,-63.57143l90.84431,0l0,-281.42857l-91.5586,0z" id="path3916"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m689.43492,540.42857l-74.43492,0l0,-18.6998l18.34564,0l56.08928,-15.02908l0,33.72888z" id="path3918"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m515.71429,505.42857l0,-72.85714" id="path3920"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m515.71429,442.92857l33.57142,0" id="path3922"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m515.71429,402.21429l0,-164.28572" id="path3924"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3926" width="128.79854" height="176.26695" x="851.55859" y="656.30444"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3928" width="116.5584" height="100" x="735" y="664.71429"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3930" width="39.999996" height="58.214287" x="760.71429" y="566.14288"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3932" width="90.844284" height="40.357124" x="760.71429" y="624.35718"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3934" width="50.844311" height="106.07146" x="800.71429" y="518.28571"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3936" width="40" height="47.857174" x="760.71429" y="518.28571"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3938" width="40.015049" height="41.42857" x="694.98492" y="540.42859"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3940" width="37.880692" height="41.428589" x="657.10425" y="540.42859"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3942" width="42.104248" height="41.428608" x="615" y="540.42859"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3944" width="41.785706" height="39.285767" x="615" y="625.42853"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3946" width="38.928589" height="39.285767" x="656.78571" y="625.42853"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3948" width="39.285702" height="39.285767" x="695.71429" y="625.42853"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3950" width="120" height="60.280552" x="615" y="664.71429"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m683.125,725l0,48.5l-7.34375,0l0,36.59375l31.84375,0l0,22.47462l20.9375,0l0,-22.47462l6.4375,0l0,-36.59375l0,-48.5l-51.875,0z" id="path3952"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3954" width="8.472274" height="45.379456" x="735" y="764.71429"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3956" width="27.274118" height="45.379456" x="743.47229" y="764.71429"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m770.75,764.71875l0,45.375l0,22.47462l24.25,0l0,-22.47462l56.5625,0l0,-45.375l-80.8125,0z" id="path3958"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3960" width="26.011425" height="22.477646" x="825.54718" y="810.09375"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3962" width="30.54718" height="22.477646" x="795" y="810.09375"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m906.4375,832.5625l0,28.9375l-47.15625,0l-95.71875,0l0,66.4375l69.65625,0l0,19.28125l26.0625,0l0,-19.28125l0,-20.71875l70.375,0l0,103.21875l50.6875,0l0,-141.78125l0,-36.09375l-73.90625,0z" id="path3964"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m859.28125,907.21875l0,40l-26.0625,0l0,-19.28125l-69.65625,0l0,-18.9375l-28.5625,0l0,92.1562l28.5625,0l17.875,0l0,9.2813l77.84375,0l70.375,0l0,-103.21875l-70.375,0z" id="path3966"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3968" width="28.5625" height="34.285713" x="735" y="874.71429"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m651.84375,792.03125l0,18.0625l0,22.46875l55.78125,0l0,-22.46875l-38.53125,0l0,-18.0625l-17.25,0z" id="path3970"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m598.25,774.75l0,74.46875l53.59375,0l0,-57.1875l17.25,0l0,-17.28125l-17.25,0l-53.59375,0z" id="path3972"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3974" width="54.09375" height="49.755154" x="615" y="724.99487"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3976" width="22.658794" height="19.955654" x="615" y="754.79437"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m425.23112,626.06103l85.84031,0l0,168.29611" id="path3978"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m469.28572,626.06103l0,168.29611" id="path3980"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m441.4733,742.82299l27.81242,0" id="path3982"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m476.42857,881.14286l39.28572,0l-8.21429,-27.14286l-26.07143,0" id="path3984"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m515.71429,881.14286l30.71428,111.42857" id="path3986"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m408.39731,505.04597l40.88841,0l0,-177.83169l-32.14286,0l14.64286,97.85715" id="path3988"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m422.14286,327.21428l-17.85714,-130" id="path3990"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3992" width="33.214283" height="48.571426" x="397.14285" y="97.571426"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3994" width="127.98717" height="75.357147" x="723.57141" y="161.5"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m682.5,194l28.57143,0c0,0 4.28572,-21.07143 -9.28571,-36.07143" id="path3997"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m656.78572,145.78571c27.85714,-16.07143 44.64288,-3.57143 55.71428,9.64286" id="path3999"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m547.14286,169l0,-39.49008" id="path4001"/>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_4" y="397.9935" x="653.497716" stroke-width="0" stroke="#000000" fill="#000000">1.210</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_6" y="750.987735" x="886.493911" stroke-width="0" stroke="#000000" fill="#000000">1.437</text>
  </g>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_8" y="723.988176" x="763.49592" stroke-width="0" stroke="#000000" fill="#000000">1.301</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="705.98847" x="644.497862" stroke-width="0" stroke="#000000" fill="#000000">1.424</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="983.98393" x="807.4952" stroke-width="0" stroke="#000000" fill="#000000">1.115</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_11" y="902.985253" x="786.495545" stroke-width="0" stroke="#000000" fill="#000000">1.494</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_12" y="795.987" x="780.495631" stroke-width="0" stroke="#000000" fill="#000000">1.432</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_13" y="152.997501" x="758.496001" stroke-width="0" stroke="#000000" fill="#000000">1.347</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_14" y="203.996669" x="757.496017" stroke-width="0" stroke="#000000" fill="#000000">1.349</text>
  <text stroke="#000000" transform="matrix(0.780244096457249,0,0,0.780244096457249,143.62290890706956,179.15249000193188) " xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_15" y="818.594032" x="587.602645" stroke-width="0" fill="#000000">1.130</text>
  <text stroke="#000000" transform="matrix(0.8335527777671814,0,0,0.8335527777671814,120.93430990353227,147.4696381604299) " xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_16" y="780.820731" x="670.096497" stroke-width="0" fill="#000000">1.410</text>
 </g>
</svg>''',
  'MBS2': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="layer2">
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path3765" d="m33.57143,450.42857l360,-30l-47.14286,-325l58.57143,0l0,-87.14286l26.42857,0l0,87.14286l430.71429,0l0,555.82514l121.74572,0l0,351.53309l-516.18795,0l-63.63961,-486.89353l-366.68538,31.31473l-3.80421,-96.77943z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path3767" d="m362.56209,206.65206l185.95074,0l0,-111.22349l-202.08426,0l16.13352,111.22349z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="95.428574" x="548.51282" height="111.22349" width="73.236061" id="rect3769"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="95.428574" x="621.7489" height="65.901154" width="39.901039" id="rect3771"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="95.428574" x="661.64996" height="65.901154" width="36.870544" id="rect3773"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="95.428574" x="698.52051" height="65.901154" width="39.395927" id="rect3775"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="95.428574" x="737.91644" height="140.65244" width="124.22643" id="rect3777"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3798" d="m728.3125,236.09375l0,13.625l-25.25,0l0,265.65625l159.09375,0l0,-279.28125l-133.84375,0z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m677.8125,236.09375l0,13.625l25.25,0l0,265.65625l-159.09375,0l0,-279.28125l133.84375,0z" id="path3803"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="515.375" x="613.1626" height="23.751778" width="126.26907" id="rect3805"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="539.12677" x="613.1626" height="41.416256" width="42.426403" id="rect3807"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="539.12677" x="655.58899" height="41.416248" width="40.406105" id="rect3809"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="539.12677" x="695.99512" height="41.416241" width="43.436577" id="rect3811"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="515.375" x="739.4317" height="51.530972" width="48.487293" id="rect3813"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="515.375" x="787.91901" height="65.410713" width="34.223862" id="rect3817"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="619.71429" x="763.92859" height="41.42857" width="98.214287" id="rect3819"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="661.14288" x="739.4317" height="33.214298" width="58.425858" id="rect3821"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="621.1424" x="696.78571" height="36.071888" width="42.645924" id="rect3829"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="621.1424" x="655.71429" height="36.071884" width="41.071419" id="rect3831"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="621.1424" x="613.1626" height="36.07188" width="42.551697" id="rect3833"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="657.21429" x="613.1626" height="68.214325" width="126.2691" id="rect3835"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path3845" d="m702.84375,800.4375l0,-37.875l-26.0625,0l0,37.875l26.0625,0z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3837" d="m676.78125,725.4375l0,37.125l26.0625,0l0,37.875l0,22.84375l36.59375,0l0,-97.84375l-62.65625,0z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3849" d="m613.15625,725.4375l0,75l0,22.5l35.40625,0l0,-22.5l28.21875,0l0,-75l-63.625,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="694.35718" x="739.4375" height="93.26712" width="58.420059" id="rect3854"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3860" d="m862.15625,651.25l0,9.90625l-64.3125,0l0,126.46875l64.3125,0l0,-17.9375l121.71875,0l0,-118.4375l-121.71875,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="787.62433" x="769.73627" height="36.87056" width="92.406624" id="rect3862"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="769.6875" x="906.61194" height="123.49774" width="77.276672" id="rect3867"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="893.18524" x="887.92407" height="109.60155" width="95.964493" id="rect3869"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="919.44922" x="733.87585" height="83.337578" width="154.04825" id="rect3871"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="855.80963" x="733.87585" height="63.639618" width="131.82487" id="rect3873"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="855.80963" x="620.73877" height="146.97717" width="113.13712" id="rect3875"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3877" d="m456.87766,919.98254l163.86109,0l0,82.80426l-153.03812,0l-10.82297,-82.80426z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3880" d="m436.97577,767.71722l133.25534,0l0,152.26534l-113.40012,-0.35714l-19.85522,-151.9082z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3882" d="m426.42941,687.02917l143.80171,0l0,80.68808l-133.25535,-0.00002l-10.54636,-80.68806z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect3884" d="m417.84375,621.3125l8.58566,65.71671l143.78934,0.002l0,-48.90625l-62.625,0l0,-16.8125l-89.75,0.00004z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path3889" d="m507.59375,621.3125l0,-336.74416"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path3893" d="m460.62956,621.31248l0,-107.43952"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path3895" d="m379.88115,326.0486l34.28139,-5.11477l15.15229,101.01525"/>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_1" y="391.994268" x="745.996578" stroke-width="0" stroke="#000000" fill="#000000">S2.230</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_2" y="177.33074" x="759.329717" stroke-width="0" stroke="#000000" fill="#000000">S2.285</text>
  </g>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_4" y="158.664347" x="412.668119" stroke-width="0" stroke="#000000" fill="#000000">S2.245</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_5" y="390.660954" x="583.33229" stroke-width="0" stroke="#000000" fill="#000000">S2.210</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_6" y="722.656099" x="851.328371" stroke-width="0" stroke="#000000" fill="#000000">S2.435</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_7" y="954.652707" x="897.994356" stroke-width="0" stroke="#000000" fill="#000000">S2.455</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_8" y="970.652473" x="771.329541" stroke-width="0" stroke="#000000" fill="#000000">S2.465</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="937.319627" x="640.664785" stroke-width="0" stroke="#000000" fill="#000000">S2.401</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="837.321089" x="907.327552" stroke-width="0" stroke="#000000" fill="#000000">S2.445</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_11" y="701.323078" x="641.998099" stroke-width="0" stroke="#000000" fill="#000000">S2.440</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_12" y="969.319159" x="503.33346" stroke-width="0" stroke="#000000" fill="#000000">S2.105</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_13" y="849.320914" x="472.667242" stroke-width="0" stroke="#000000" fill="#000000">S2.115</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_14" y="670.65686" x="454.000848" stroke-width="0" stroke="#000000" fill="#000000">S2.145</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_15" y="739.989179" x="464.667359" stroke-width="0" stroke="#000000" fill="#000000">S2.135</text>
 </g>
</svg>''',
  'CC1': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

    <metadata id="metadata7">image/svg+xml</metadata>
    <g>
     <title>background</title>
     <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
    </g>
    <g>
     <title>Layer 1</title>
     <g display="inline" id="layer4">
      <g transform="matrix(-0.99582912,0,0,-0.99239778,1021.6871,1021.4805) " id="g4587">
       <rect stroke="#000000" fill="#ffffff" stroke-width="2.011846" stroke-miterlimit="4" id="rect3365" width="1007.1639" height="284.042977" x="11.592215" y="502.342287"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4357" width="212.499991" height="120.428568" x="505.928561" y="673.285714"/>
       <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m301.78571,644.1875" id="path4379"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_1" width="211.49999" height="120.428585" x="310.928567" y="673.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_2" width="216.499995" height="120.42857" x="505.928561" y="495.285711"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_3" width="210.500002" height="120.428585" x="311.928555" y="495.285697"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_4" width="72.500001" height="113.428582" x="239.928557" y="673.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_5" width="161.5" height="113.428582" x="100.928556" y="673.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_6" width="72.500001" height="113.428582" x="29.928557" y="673.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_7" width="72.500001" height="113.428582" x="239.928557" y="502.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_8" width="250.499996" height="113.428582" x="11.928559" y="502.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="rect4396" width="29.142857" height="50.428557" x="262.714291" y="565.214286"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_9" width="54.499998" height="113.428568" x="721.928581" y="502.285714"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_11" width="242.499993" height="113.428568" x="775.928553" y="502.285714"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_25" width="62.500004" height="59.428588" x="459.928558" y="734.2857"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_26" width="62.500004" height="60.428584" x="459.928558" y="673.285703"/>
       <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_29" width="35.5" height="51.428583" x="29.928557" y="673.285703"/>
      </g>
      <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_12" width="39.499993" height="113.428568" x="266.928579" y="241.285714"/>
      <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_13" width="99.500003" height="113.428568" x="166.928588" y="241.285714"/>
      <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_14" width="99.500003" height="113.428568" x="66.928588" y="241.285714"/>
      <rect stroke="#000000" fill="#ffd8d8" stroke-width="2.011846" stroke-miterlimit="4" id="svg_15" width="60.500003" height="113.428568" x="6.928588" y="241.285714"/>
     </g>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_16" y="477" x="105.5"  stroke-width="0" stroke="#000000" fill="#000000">119</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_17" y="478" x="258.5"  stroke-width="0" stroke="#000000" fill="#000000">117</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_18" y="306" x="18.5"  stroke-width="0" stroke="#000000" fill="#000000">124</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_19" y="306" x="92.5"  stroke-width="0" stroke="#000000" fill="#000000">122</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_20" y="306" x="193.5"  stroke-width="0" stroke="#000000" fill="#000000">120</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_21" y="306" x="383.5"  stroke-width="0" stroke="#000000" fill="#000000">116</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_22" y="478" x="383.5"  stroke-width="0" stroke="#000000" fill="#000000">115</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_23" y="478" x="583.5"  stroke-width="0" stroke="#000000" fill="#000000">111</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_24" y="307" x="609.5"  stroke-width="0" stroke="#000000" fill="#000000">112</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_27" y="493" x="715.5"  stroke-width="0" stroke="#000000" fill="#000000">109</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_28" y="307" x="819.5"  stroke-width="0" stroke="#000000" fill="#000000">106</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_30" y="277" x="934.5"  stroke-width="0" stroke="#000000" fill="#000000">104</text>
     <text stroke="#000000" transform="matrix(0.7664201309507992,0,0,0.8484848737716675,234.7932586500971,50.27271854877471) " xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_31" y="337" x="944.5"  stroke-width="0" fill="#000000">102</text>
     <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_32" y="480" x="870.5"  stroke-width="0" stroke="#000000" fill="#000000">101</text>
    </g>
   </svg>''',
  'VE1': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="g4664">
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m790.17773,42.21484l0,94.64258l-97.21289,0l0,32.04883l0,25.75781l14.64649,0l0,6.0625l33.83984,0l0,-31.82031l48.72656,0l0,1.00977l33.60157,0l0,-47.34375l6.5664,0l0,-80.35743l-6.5664,0l-33.60157,0z" id="path4672"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4666" width="33.840092" height="31.819807" x="718.61188" y="168.90587"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m790.17773,42.21484l0,127.70118l33.60157,0l0,-47.34375l6.5664,0l0,-80.35743l-6.5664,0l-33.60157,0z" id="path4668"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" id="rect4670" width="42.647237" height="25.758892" x="692.964659" y="168.90587"/>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_1" y="190" x="694.5" stroke-width="0" stroke="#000000" fill="#000000">191</text>
  </g>
 </g>
</svg>''',
  'VE2': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="g4719">
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m224.42773,26.28516l0,100l-35.71289,0l0,45.71484l35.71289,0l0,150.71484l302.03516,0l0,-172.7539l98.99414,0l0,5.42968l48.48828,0l0,26.76954l16.66602,0l0,140.66406l54.54883,0l0,-140.66406l0,-29.29493l32.125,0l33.53515,0l0,-42.29296l2.52539,0l0,-73.57227l-36.06054,0l0,-10.71484l-552.85743,0z" id="path4721"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4723" width="50.506348" height="58.967793" x="224.42773" y="149.96094"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4725" width="50.506348" height="60.104076" x="224.42773" y="208.92873"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m224.42773,269.0332l0,53.68164l103.53907,0l0,-46.86328l-34.84961,0l0,-6.81836l-68.68946,0z" id="path4727"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4729" width="34.849613" height="40.406303" x="293.11719" y="235.44522"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4731" width="34.849613" height="40.911163" x="293.11719" y="194.53406"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4733" width="34.849613" height="44.57312" x="293.11719" y="149.96094"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m327.9668,182.66406l0,140.05078l151.01758,0l0,-140.05078l-27.94922,0l0,4.8711l-38.57032,0l0,-4.8711l-18.57226,0l0,4.8711l-20.89258,0l0,-4.8711l-45.0332,0z" id="path4735"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4737" width="18.571428" height="14.236189" x="393.89285" y="168.42857"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4739" width="20.892853" height="19.107145" x="373" y="168.42857"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4741" width="38.571426" height="19.107145" x="412.46429" y="168.42857"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4743" width="16.666019" height="26.769541" x="673.94531" y="155.39062"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4745" width="38.386108" height="27.054445" x="690.61133" y="162.17635"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4747" width="38.386108" height="59.598965" x="690.61133" y="189.23079"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4749" width="38.386108" height="73.994469" x="690.61133" y="248.82974"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m777.28516,37l0,73.57227l0,16.28125l33.53515,0l0,-16.28125l2.52539,0l0,-73.57227l-2.52539,0l-33.53515,0z" id="path4751"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4753" width="34.397911" height="38.575203" x="742.88727" y="83.922356"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4755" width="76.771614" height="31.251598" x="666.11566" y="91.24596"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m725.9668,26.28516l0,64.96093l16.91992,0l0,-7.32421l34.39844,0l0,-57.63672l-34.39844,0l-16.91992,0z" id="path4757"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4759" width="59.851147" height="42.989986" x="666.11566" y="26.285156"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4761" width="40.406101" height="37.059967" x="598.18292" y="85.437584"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4763" width="72.983444" height="37.059967" x="525.1994" y="85.437584"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4765" width="51.77029" height="59.152428" x="525.1994" y="26.285156"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m576.96875,26.28516l0,59.15234l61.62109,0l0,5.80859l0,31.25196l27.52539,0l0,-31.25196l59.85157,0l0,-21.9707l-59.85157,0l0,-42.99023l-89.14648,0z" id="path4767"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4769" width="31.062218" height="54.4851" x="494.13718" y="68.012451"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m475.95508,26.28516l0,41.72656l0,20.96094l18.18164,0l0,-20.96094l31.0625,0l0,-41.72656l-49.24414,0z" id="path4771"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4773" d="m475.95508,26.28516l0,41.72656l0,20.96094l-18.18164,0l0,-20.96094l-31.0625,0l0,-41.72656l49.24414,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4775" width="36.363735" height="33.524891" x="457.77344" y="88.97266"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4777" width="31.062498" height="54.485828" x="426.71094" y="68.011719"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4779" width="25.507786" height="27.779928" x="401.20316" y="68.011719"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4781" width="25.507782" height="26.7059" x="401.20316" y="95.79165"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4783" width="50.256523" height="41.726562" x="376.45441" y="26.285156"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4785" width="24.748749" height="54.485832" x="376.45441" y="68.011719"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4787" width="50.002544" height="38.322659" x="326.45187" y="84.174889"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4789" width="50.002533" height="57.889732" x="326.45187" y="26.285156"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m274.68164,26.28516l0,62.43554l17.92969,0l0,-22.22265l33.83984,0l0,-40.21289l-51.76953,0z" id="path4791"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4793" width="33.840546" height="55.9995" x="292.61133" y="66.498047"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m224.42773,26.28516l0,40.46484l33.33399,0l0,21.9707l16.91992,0l0,-62.43554l-50.25391,0z" id="path4795"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4797" width="34.849609" height="33.776848" x="257.76172" y="88.7207"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4799" width="33.333988" height="55.747551" x="224.42773" y="66.75"/>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_1" y="56" x="281.5" stroke-width="0" stroke="#000000" fill="#000000">229</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_2" y="111" x="332.5" stroke-width="0" stroke="#000000" fill="#000000">227</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_3" y="56" x="383.5" stroke-width="0" stroke="#000000" fill="#000000">225</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_4" y="59" x="531.5" stroke-width="0" stroke="#000000" fill="#000000">223</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_5" y="115" x="684.5" stroke-width="0" stroke="#000000" fill="#000000">221</text>
   <text stroke="#000000" transform="matrix(0.8751463294029236,0,0,1,86.08660587668419,0) " xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_6" y="233" x="691.785332" stroke-width="0" fill="#000000">212</text>
   <text stroke="#000000" transform="matrix(0.900117039680481,0,0,1,69.16895002126694,0) " xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_8" y="291" x="692.5" stroke-width="0" fill="#000000">210</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="264" x="389.5" stroke-width="0" stroke="#000000" fill="#000000">226</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="307" x="255.5" stroke-width="0" stroke="#000000" fill="#000000">228</text>
  </g>
 </g>
</svg>''',
  'VL1': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="g4499">
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m208.0918,17.88867l0,101.82617l-19.51953,0l0,51.42774l17.14257,0l0,161.42969l-18.57226,0l0,48.57031l12.85742,0l0,75.71484l-45.71484,0l0,55.71485l-51.42774,0l0,55.71289l-48.57226,0l0,61.42968l-22.85743,0l0,227.14258l28.57227,0l0,67.14258l-30,0l0,41.42773l325.71484,0l0,-41.42773l0,-67.14258l0,-51.05078l37.23438,0l0,20.20313l437.39648,0l21.43946,0l0,-259.86719l83.92968,0l12.5,0l27.5,0l0,-40.71485l-27.5,0l0,-174.64257l-12.5,0l0,-5.35743l-72.14257,0l0,-253.57031l-16.42969,0l0,30.71485l-16.79688,0l0,-104.6836l-474.63086,0l-147.62304,0z" id="path4501"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4503" width="68.571426" height="41.427731" x="30" y="924"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4505" width="57.14341" height="62.8563" x="298.57144" y="902.57141"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4507" width="57.143398" height="58.571411" x="298.57144" y="844"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4509" width="48.57143" height="92.724052" x="595.71429" y="733.28571"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4511" width="48.571438" height="69.285645" x="595.71429" y="663.99994"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4513" width="52.142849" height="50.5812" x="644.28571" y="775.42859"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m644.28516,664l0,111.42773l52.14257,0l0,50.58204l56.42969,0l0,-92.00977l-25,0l0,-70l-83.57226,0z" id="path4515"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m727.85742,566.14259l0,127.03319l0,40.82422l33.79688,0l0,-40.82422l16.66797,0l0,-127.03319l-16.66797,0l-33.79688,0z" id="path4517"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4519" width="58.815411" height="92.933701" x="792.96973" y="733.07605"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4521" width="58.928017" height="57.143135" x="792.85712" y="566.14258"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m792.85742,623.28516l0,54.23242l33.44727,0l0,55.55859l25.48047,0l0,-55.55859l0,-54.23242l-58.92774,0z" id="path4523"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4525" width="33.447269" height="27.779291" x="792.85742" y="677.51758"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4527" width="40.112305" height="73.23571" x="752.85742" y="752.77405"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4529" width="49.889919" height="50.507626" x="742.96722" y="413.36279"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4531" width="49.889919" height="46.972107" x="742.96722" y="366.39069"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4533" width="34.485119" height="31.567261" x="758.37201" y="334.82343"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4535" width="85.24527" height="68.437836" x="707.61188" y="266.38559"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4537" width="85.24527" height="65.659912" x="707.61188" y="200.72568"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4539" width="23.363159" height="46.466999" x="823.77942" y="334.57089"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4541" width="23.363159" height="133.8452" x="823.77942" y="183.55309"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4543" width="23.363159" height="13.637089" x="823.77942" y="169.91602"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4545" width="23.363161" height="47.343746" x="823.77942" y="122.57227"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4547" width="23.363159" height="17.172607" x="823.77942" y="317.39828"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4549" width="64.888199" height="94.871223" x="725.28955" y="42.214844"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4551" width="150.51259" height="94.871216" x="574.77679" y="42.214844"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m661.14453,264.87109l0,17.17188l-18.6875,0l0,52.78125l65.1543,0l0,-69.95313l-46.4668,0z" id="path4553"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m642.45703,194.16016l0,50.00195l18.6875,0l0,20.70898l46.4668,0l0,-70.71093l-65.1543,0z" id="path4555"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4557" width="18.6875" height="37.880859" x="642.45703" y="244.16211"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4559" width="48.487312" height="26.76952" x="642.45703" y="167.39064"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4561" width="148.49243" height="171.22086" x="394.96964" y="165.37033"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m320.21875,165.37109l0,49.4961l-77.27734,0l0,121.72461l152.02734,0l0,-171.22071l-74.75,0z" id="path4563"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4565" width="77.277344" height="49.496101" x="242.94141" y="165.37109"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4567" width="32.829952" height="40.911175" x="541.94684" y="96.174889"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4569" width="48.487301" height="53.960045" x="526.28949" y="42.214844"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4571" width="50.507629" height="53.960045" x="475.78186" y="42.214844"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4573" width="50.507629" height="53.960045" x="425.27423" y="42.214844"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4575" width="49.497498" height="53.960045" x="375.77673" y="42.214844"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m241.42578,42.21484l0,93.86133l134.35156,0l18.18164,0l0,-39.90039l-18.18164,0l0,-53.96094l-134.35156,0z" id="path4577"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4579" width="47.477169" height="40.911175" x="494.46967" y="96.174889"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4581" width="19.519529" height="51.427738" x="188.57227" y="119.71484"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4583" width="47.25222" height="151.42857" x="543.46204" y="176.5"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4585" width="52.772881" height="48.571434" x="242.94141" y="364.71429"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4587" width="52.772873" height="47.857136" x="242.94141" y="413.28574"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4589" width="199.28572" height="96.428589" x="295.71429" y="364.71429"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m200,386.85742l0,70l-45.71484,0l0,55.71485l45.71484,0l42.94141,0l0,-125.71485l-42.94141,0z" id="path4591"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4593" width="27.584267" height="32.142014" x="215.35715" y="512.57227"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4595" width="27.584265" height="23.570862" x="215.35715" y="544.71429"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4597" width="51.427738" height="55.712891" x="102.85742" y="512.57227"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m154.28516,512.57227l0,55.71289l40.35742,0l0,61.42968l48.29883,0l0,-61.42968l-27.58399,0l0,-55.71289l-61.07226,0z" id="path4599"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m127.5,568.28516l0,40l-24.64258,0l0,21.42968l91.78516,0l0,-61.42968l-67.14258,0z" id="path4601"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4603" width="24.64258" height="40" x="102.85742" y="568.28516"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m54.28516,568.28516l0,61.42968l-22.85743,0l0,66.42774l60,0l0,-66.42774l11.42969,0l0,-61.42968l-48.57226,0z" id="path4605"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4607" width="60" height="34.643135" x="31.427734" y="696.14258"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4609" width="60" height="49.285713" x="31.427734" y="730.78571"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4611" width="60" height="48.928581" x="31.427734" y="780.07141"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4613" width="60" height="27.857428" x="31.427734" y="829"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m690.94434,167.39064l0,-30.30458" id="path4615"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m508.92857,165.37033l0,-28.28427" id="path4617"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m274.28571,165.37109l0,-29.29492" id="path4619"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m241.42578,136.07617l-33.33399,0" id="path4621"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m242.94141,187.57143l-37.22657,0" id="path4623"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m187.14258,332.57227l0,48.57031l12.85742,0l0,5.71484l5.71484,0l0,-5.71484l0,-48.57031l-18.57226,0z" id="path4625"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m242.94141,364.71429l-37.22657,0" id="path4627"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m823.77942,169.91602l-83.84268,0l0,30.80966" id="path4629"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m792.85714,463.87042l0,102.27216" id="path4631"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m762.14286,463.87042l0,102.27217" id="path4633"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m778.32227,566.14259l14.53485,0" id="path4635"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m520,491.14286c10.71429,39.28571 30,67.14285 52.85714,82.85714" id="path4637"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m600.71429,589.71429c41.78571,17.14285 84.28571,8.57142 117.14285,-15.71429" id="path4639"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m478.92857,501.5c6.78572,31.42857 22.5,57.85714 22.5,57.85714" id="path4641"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m507.5,569.35714c20.71429,30.71429 41.07143,44.64286 41.07143,44.64286" id="path4643"/>
  </g>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_2" y="263.998594" x="447.333677" stroke-width="0" stroke="#000000" fill="#000000">126</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_3" y="275.99853" x="303.334444" stroke-width="0" stroke="#000000" fill="#000000">128</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_4" y="102.66612" x="288.667856" stroke-width="0" stroke="#000000" fill="#000000">127</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_5" y="97.332815" x="631.332698" stroke-width="0" stroke="#000000" fill="#000000">121</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_6" y="303.998381" x="728.665513" stroke-width="0" stroke="#000000" fill="#000000">116</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_7" y="243.998701" x="728.665513" stroke-width="0" stroke="#000000" fill="#000000">118</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_8" y="310.665012" x="657.999223" stroke-width="0" stroke="#000000" fill="#000000">110</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="231.998765" x="656.665896" stroke-width="0" stroke="#000000" fill="#000000">112</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="423.997742" x="370.000756" stroke-width="0" stroke="#000000" fill="#000000">122</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_11" y="762.662606" x="676.66579" stroke-width="0" stroke="#000000" fill="#000000">104</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_12" y="710.662882" x="599.332868" stroke-width="0" stroke="#000000" fill="#000000">101</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_13" y="638.663266" x="732.665492" stroke-width="0" stroke="#000000" fill="#000000">103</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_14" y="659.996486" x="801.998456" stroke-width="0" stroke="#000000" fill="#000000">197</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_15" y="670.663095" x="44.669155" stroke-width="0" stroke="#000000" fill="#000000">102</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_16" y="493.330706" x="176.668452" stroke-width="0" stroke="#000000" fill="#000000">194</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_17" y="395.997891" x="248.668069" stroke-width="0" stroke="#000000" fill="#000000">124</text>
 </g>
</svg>''',
  'VL2': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
 </g>
 <g>
  <title>Layer 1</title>
  <g display="inline" id="g4801">
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4803" d="m212.091728,19.221979l0,101.82617l-19.51953,0l0,51.42774l17.14257,0l0,161.42969l-18.57226,0l0,48.57031l12.85742,0l0,75.71484l-45.71484,0l0,55.71485l-51.42774,0l0,55.71289l-48.57226,0l0,61.42968l-22.85743,0l0,227.14258l28.57227,0l0,67.14258l-30,0l0,41.42773l325.71484,0l0,-41.42773l0,-67.14258l0,-51.05078l37.23438,0l0,20.20313l437.39648,0l21.43946,0l0,-259.86719l83.92968,0l12.5,0l27.5,0l0,-40.71485l-27.5,0l0,-174.64257l-12.5,0l0,-5.35743l-72.14257,0l0,-253.57031l-16.42969,0l0,30.71485l-16.79688,0l0,-104.6836l-474.63086,0l-147.62304,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="925.333309" x="33.999928" height="41.427731" width="68.571426" id="rect4805"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m768.642508,725.690729l0,28.41602l28.32617,0l0,73.23633l58.81641,0l0,-92.9336l-58.81446,0l0,-8.71875l-28.32812,0z" id="path4807"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4809" d="m796.857348,624.618469l0,54.23242l33.44727,0l0,55.55859l25.48047,0l0,-55.55859l0,-54.23242l-58.92774,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="678.850889" x="796.857348" height="27.779291" width="33.447269" id="rect4811"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="754.107359" x="756.857348" height="73.23571" width="40.112305" id="rect4813"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4815" d="m665.144458,266.204399l0,17.17188l-18.6875,0l0,52.78125l65.1543,0l0,-69.95313l-46.4668,0z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4817" d="m646.456958,195.493469l0,50.00195l18.6875,0l0,20.70898l46.4668,0l0,-70.71093l-65.1543,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="245.495419" x="646.456958" height="37.880859" width="18.6875" id="rect4819"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="168.723949" x="646.456958" height="26.76952" width="48.487312" id="rect4821"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="177.833309" x="547.461968" height="151.42857" width="47.25222" id="rect4823"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="366.047599" x="246.941338" height="105.71429" width="52.772881" id="rect4825"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4827" d="m203.999928,388.190729l0,70l-45.71484,0l0,55.71485l45.71484,0l42.94141,0l0,-125.71485l-42.94141,0z"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="513.905579" x="208.642798" height="32.142056" width="38.298561" id="rect4829"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" y="822.476189" x="35.427662" height="35.71463" width="52.857143" id="rect4831"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4833" d="m191.142508,333.905579l0,48.57031l12.85742,0l0,5.71484l5.71484,0l0,-5.71484l0,-48.57031l-18.57226,0z"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4835" d="m246.941338,366.047599l-37.22657,0"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4837" d="m796.857068,465.203729l0,102.27216"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m547.461968,329.261879l0,6.78572l-302.03347,0l0,-22.85714l-35.71373,0" id="path4839"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m547.461968,177.833309l0,-14.53892l98.99499,0l0,5.42956" id="path4841"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m721.966728,362.167289l0,34.22071l9.34375,0l0,68.8164l65.54687,0l0,-103.03711l-65.54687,0l-9.34375,0z" id="path4843"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m686.105398,362.167289l0,34.22071l0,1.13476l0,54.80078l45.20508,0l0,-55.93554l-9.34375,0l0,-34.22071l-35.86133,0z" id="path4845"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4847" width="36.11298" height="48.235657" x="649.992478" y="362.167289"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4849" width="36.113007" height="49.244961" x="649.992478" y="410.402949"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4851" width="49.24493" height="48.739838" x="649.992478" y="459.647919"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m699.238208,452.323539l0,12.88086l0,33.08203l0,10.10157l-49.24609,0l0,83.73047l0,16.62695c0,32.73483 26.35306,59.08789 59.08789,59.08789l14.20508,0l14.48437,0l59.08789,0l0,-59.08789l0,-16.62695l0,-24.64258l0,-59.08789l0,-43.1836l-65.54687,0l0,-12.88086l-32.07227,0z" id="path4853"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4855" width="21.071711" height="51.071426" x="775.785638" y="616.761899"/>
   <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4857" width="33.333988" height="27.779301" x="796.970628" y="706.630189"/>
   <path fill="#ffffff" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m711.611258,336.157529l67.68074,0l0,26.00976" id="path4859"/>
   <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" d="m766.160088,166.198539l0,169.95899l65.66015,0l0,-20.45703l24.74805,0l0,-131.31836l-24.74805,0l0,-18.1836l-65.66015,0z" id="path4861"/>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_1" y="267.995187" x="791.328337" stroke-width="0" stroke="#000000" fill="#000000">205</text>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="189.83309" x="352.798797" height="146.095324" width="132.58401" id="svg_2"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="156.500352" x="247.467362" height="179.428064" width="104.58452" id="svg_3"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="17.83382" x="212.389888" height="90.102611" width="104.891797" id="svg_4"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="17.83382" x="318.543379" height="90.102611" width="101.814887" id="svg_5"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="17.83382" x="421.619961" height="90.102611" width="101.814887" id="svg_6"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="17.83382" x="524.696542" height="90.102611" width="101.814887" id="svg_7"/>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="17.83382" x="627.773121" height="90.102611" width="138.737842" id="svg_8"/>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_9" y="70.768993" x="245.077796" stroke-width="0" stroke="#000000" fill="#000000">229</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_10" y="70.768994" x="351.231285" stroke-width="0" stroke="#000000" fill="#000000">227</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_11" y="69.230536" x="451.23095" stroke-width="0" stroke="#000000" fill="#000000">225</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_12" y="70.768993" x="552.769071" stroke-width="0" stroke="#000000" fill="#000000">223</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_13" y="72.30745" x="674.307125" stroke-width="0" stroke="#000000" fill="#000000">221</text>
   <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_14" y="272.306778" x="400.461889" stroke-width="0" stroke="#000000" fill="#000000">226</text>
   <rect stroke="#000000" fill="#ffd8d8" stroke-width="2" stroke-miterlimit="4" y="17.83382" x="766.234195" height="90.102611" width="63.353476" id="svg_25"/>
  </g>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_15" y="273.845235" x="286.616117" stroke-width="0" stroke="#000000" fill="#000000">228</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_16" y="430.767785" x="745.076117" stroke-width="0" stroke="#000000" fill="#000000">204</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_17" y="583.074965" x="701.999339" stroke-width="0" stroke="#000000" fill="#000000">201</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_18" y="658.459329" x="808.152829" stroke-width="0" stroke="#000000" fill="#000000">297</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_19" y="786.151208" x="808.152829" stroke-width="0" stroke="#000000" fill="#000000">240</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_20" y="427.690872" x="254.308534" stroke-width="0" stroke="#000000" fill="#000000">202</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_21" y="495.382953" x="182.001084" stroke-width="0" stroke="#000000" fill="#000000">294</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_22" y="429.229329" x="688.153231" stroke-width="0" stroke="#000000" fill="#000000">203</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_23" y="235.383825" x="660.461017" stroke-width="0" stroke="#000000" fill="#000000">212</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_24" y="310.768188" x="660.461016" stroke-width="0" stroke="#000000" fill="#000000">210</text>
 </g>
</svg>''',
};
