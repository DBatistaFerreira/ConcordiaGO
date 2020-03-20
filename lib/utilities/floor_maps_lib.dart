library floor_maps_lib;

const hallFloors = ['H8', 'H9'];

const nodeGraph = {
  'H': {
    'H8': {
      '1': [176,214],
      '2': [307,214],
      '3': [342,214],
      '4': [342,120],
      '5': [463,214],
      '6': [550,214],
      '7': [638,214],
      '8': [731,214],
      '9': [837,214],
      '10': [854,169],
      '11': [837,323],
      '12': [837,398],
      '13': [837,513],
      '14': [837,598],
      '15': [837,689],
      '16': [837,795],
      '17': [878,811],
      '18': [730,795],
      '19': [635,795],
      '20': [635,684],
      '21': [550,795],
      '22': [462,795],
      '23': [400,795],
      '24': [400,690],
      '25': [368,795],
      '26': [282,795],
      '27': [176,795],
      '28': [90,805],
      '29': [176,655],
      '30': [176,593],
      '31': [176,501],
      '32': [176,397],
      '33': [176,319],
      '34': [132,195],
      '35': [132,167],
      '36': [264,397],
      '37': [264,440],
      '38': [264,485],
      '39': [264,514],
      '40': [368,397],      
      '41': [479,397],
      '42': [550,397],
      '43': [550,636],
      '44': [550,900],
      '45': [550,106],
      '46': [176,143],
      '47': [307,262],
      '48': [307,143],
      '49': [342,87],
      '50': [463,143],
      '51': [638,262],
      '52': [638,143],
      '53': [731,143],
      '54': [854,143],
      '55': [898,143],
      '56': [898,214],
      '57': [638,459],
      '58': [898,323],
      '59': [773,598],
      '60': [898,398],
      '61': [898,513],
      '62': [898,598],
      '63': [898,689],
      '64': [878,860],
      '65': [604,621],
      '66': [837,860],
      '67': [730,860],
      '68': [635,860],
      '69': [462,860],
      '70': [400,627],
      '71': [368,860],
      '72': [282,860],
      '73': [176,860],
      '74': [90,860],
      '75': [90,752],
      '76': [219,655],
      '77': [110,655],
      '78': [233,593],
      '79': [110,593],
      '80': [110,501],
      '81': [110,397],
      '82': [110,319],
      '83': [368,452],
      '84': [110,195],
      '85': [106,167],
      '86': [132,109],
      '87': [480,636],
      '88': [479,445],
    }
  }
};

const floorPlan = {
  'H9': '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">

 <metadata id="metadata7">image/svg+xml</metadata>
 <g>
  <title>background</title>
  <rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/>
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
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4163" width="89.398506" height="149.37518" x="514.67273" y="826.01007"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4165" width="64.144676" height="53.033039" x="514.67273" y="826.01007"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4167" width="180.31221" height="149.37521" x="604.07123" y="826.01007"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4169" width="66.165009" height="34.850262" x="784.38342" y="833.58624"/>
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
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m294.844205,97.025136l28.065108,-12.458893l40.692011,0.168012l15.020373,32.377141l-62.191128,27.948249l-21.586365,-48.034509z" id="rect4262"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" d="m316.430566,145.059636l112.001013,-50.332455l0.025842,42.019783l-11.5538,-0.087586l-86.810152,38.803284l-13.662903,-30.403026z" id="rect4315"/>
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
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4438" width="38.890888" height="52.04121" x="567.70575" y="464.35715"/>
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2.011846" stroke-miterlimit="4" id="rect4440" width="38.890865" height="86.873123" x="567.70575" y="516.39838"/>
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
    <rect fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" transform="matrix(-1.0041883,0,0,-1.0076605,1025.9663,1029.3055) " y="53.510307" x="150.04068" height="106.13573" width="90.534554" id="rect4696"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="rect4698" d="m1015.767513,123.95403l0,-75.606027l-48.044134,0l0,61.46729l-7.060699,0l0,14.138736l7.060699,0l48.044134,0z"/>
    <path fill="#ffd8d8" stroke="#000000" stroke-width="2" stroke-miterlimit="4" id="path4703" d="m561.139777,288.10384l-15.633465,-15.199521l-13.155881,15.199511l28.789346,0.00001z"/>
    <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_4" y="12.904205" x="316.999229" stroke-width="0" stroke="#000000" fill="#000000"/>
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
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_19" y="137.998775" x="307.001693"   stroke-width="0" stroke="#000000" fill="#000000">903</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_20" y="137.998775" x="446.000475"   stroke-width="0" stroke="#000000" fill="#000000">907</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_21" y="185.998351" x="58.003906"   stroke-width="0" stroke="#000000" fill="#000000">967</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_22" y="338.997011" x="58.003906"   stroke-width="0" stroke="#000000" fill="#000000">965</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_23" y="137.998775" x="535.999687"   stroke-width="0" stroke="#000000" fill="#000000">909</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_24" y="137.998775" x="625.998898"   stroke-width="0" stroke="#000000" fill="#000000">911</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_25" y="137.998775" x="716.998101"   stroke-width="0" stroke="#000000" fill="#000000">913</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_26" y="137.998775" x="806.997312"   stroke-width="0" stroke="#000000" fill="#000000">915</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_27" y="137.998775" x="919.996322"   stroke-width="0" stroke="#000000" fill="#000000">917</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_28" y="246.99782" x="919.996322"   stroke-width="0" stroke="#000000" fill="#000000">919</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_29" y="337.997023" x="919.996322"   stroke-width="0" stroke="#000000" fill="#000000">921</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_30" y="437.996146" x="920.996313"   stroke-width="0" stroke="#000000" fill="#000000">923</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_31" y="551.995147" x="951.996042"   stroke-width="0" stroke="#000000" fill="#000000">925</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_32" y="750.993404" x="903.996462"   stroke-width="0" stroke="#000000" fill="#000000">927</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_33" y="895.992133" x="903.996462"   stroke-width="0" stroke="#000000" fill="#000000">929</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_34" y="922.991895" x="744.997866"   stroke-width="0" stroke="#000000" fill="#000000">933</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_35" y="933.991798" x="412.000796"   stroke-width="0" stroke="#000000" fill="#000000">941</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_36" y="944.9917" x="520.999834"   stroke-width="0" stroke="#000000" fill="#000000">929</text>
  <text xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_37" y="866.992387" x="312.001681"   stroke-width="0" stroke="#000000" fill="#000000">943</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_38" y="809.992889" x="281.001953"   stroke-width="0" stroke="#000000" fill="#000000">945</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_39" y="765.993279" x="338.001449"   stroke-width="0" stroke="#000000" fill="#000000">981</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_40" y="798.992989" x="130.00328"   stroke-width="0" stroke="#000000" fill="#000000">961</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_41" y="337.997009" x="466.000295"   stroke-width="0" stroke="#000000" fill="#000000">914</text>
  <text style="cursor: move;" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_42" y="814.992849" x="769.997645"   stroke-width="0" stroke="#000000" fill="#000000">928</text>
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
</svg>'''
};
