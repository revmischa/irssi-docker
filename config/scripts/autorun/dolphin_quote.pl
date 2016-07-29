use warnings;
use strict;
use Irssi;


my @searches = (
    q{yi-drizzy},
    q{lecrae},
    q{carrie underwood see thru},
    q{carrie underwood nude},
    q{carrie underwood green bikini},
    q{carrie underwood cameltoe},
    q{carrie underwood},
    q{janelle monae},
    q{katharine hepburn audrey hepburn},
    q{katharine hepburn},
    q{katherine hepburn},
    q{adele 21},
    q{wshh 50 cent banner},
    q{wshh 50 cent},
    q{boat accident},
    q{andrew godoy},
    q{treasuretroopers},
    q{cameron giles basketball},
    q{blake lively nude},
    q{blake lively},
    q{jennifer lawrence nude},
    q{nude},
    q{jennifer lawrence},
    q{miley cyrus wardrobe malfunction pic uncensored},
    q{miley cyrus wardrobe malfunction pic},
    q{miley cyrus wardrobe malfunction horse},
    q{miley cyrus wardrobe malfunction},
    q{diddy new tattoo},
    q{melyssa ford nude},
    q{melyssa ford},
    q{http://sphotos-a.xx.fbcdn.net/hphotos-ash3/64932_123250497850945_815767645_n.jpg},
    q{the dictator},
    q{dietsupplementsettlement},
    q{dietsupplementssettlement},
    q{diet supplements settlement},
    q{adriana lima},
    q{adriana lima sex tape},
    q{surprised kitty},
    q{suprprised kitty},
    q{biljana sesevic nude},
    q{biljana sesevic},
    q{http://sphotos-b.xx.fbcdn.net/hphotos-ash3/575758_117326988410813_583532169_n.jpg},
    q{navy gay},
    q{marines gay},
    q{http://sphotos-b.xx.fbcdn.net/hphotos-prn1/601526_105354296313654_1267525222_n.jpg},
    q{restaurant fight liveleak},
    q{pac div},
    q{"ARABIC FUCK YOU LICNESE"},
    q{license => 'ARABIC FUCK YOU LICNESE',},
    q{new orleans hornets},
    q{pelicans hat},
    q{dad from that's so raven},
    q{big sean eminem's seal of approval},
    q{lemonparty},
    q{lemon party},
    q{lemonpart},
    q{k-town growth},
    q{mic k town soundcloud},
    q{mic k town},
    q{mic ktown},
    q{rico recklezz lil mister},
    q{high school metal detectors},
    q{new orleans school metal detectors},
    q{lil jay 00 unexpected fame},
    q{lil mister warzone},
    q{2pac walk of fame},
    q{p.rico king},
    q{big titties gifs},
    q{christopher donner},
    q{poncho},
    q{mob boss made town vote for kids},
    q{accentuated},
    q{aiki},
    q{shondale gregory chicago},
    q{tooka chicago},
    q{beat man with a belt over debt},
    q{g-unit radio},
    q{rich person},
    q{rich},
    q{finally the rock},
    q{penelope soto},
    q{soto court},
    q{soto},
    q{enyce},
    q{wu-tang secret society},
    q{ash coma},
    q{angelica's worst nightmare},
    q{angelica's nightmare},
    q{doug walker},
    q{nostalgia critic},
    q{cartoon mindfucks},
    q{loaded lux},
    q{dark souls stamina},
    q{7 dayz the movie},
    q{kaitlin olson nude},
    q{kaitlin olson see through},
    q{kaitlin olson sex scene},
    q{kaitlin olson held up sex scene},
    q{kaitlin olson held up dailymotion},
    q{kaitlin olson held up},
    q{kaitlin olson},
    q{kaitlyn olson},
    q{louis ck},
    q{cut your hair chicago jail},
    q{lil wayne deathwish lyrics},
    q{lil wayne deathwish},
    q{mecca},
    q{mecc},
    q{bshellz},
    q{notorious b.i.g. i'll suck on ya daddy's dick},
    q{ill suck on ya daddy's dick},
    q{raspberry},
    q{cruel summer},
    q{king gordy},
    q{children of the corn harlem nights},
    q{what happens when you cut a walrus whiskers},
    q{what happens when you cut a walrus},
    q{what happens when you cut a cat's whiskers},
    q{lil durk 52 bars},
    q{children of the corn},
    q{children of the corn danger zone},
    q{children of the corn dangerzone},
    q{children of the corn digga},
    q{children of the corn camron},
    q{objective hate},
    q{duplex},
    q{hey jesse},
    q{lord of d},
    q{ascii farts},
    q{the weeknd},
    q{chief keef mlk},
    q{chief keef obama},
    q{futuristic keyboard},
    q{water keyboard},
    q{pink grand piano},
    q{colorful grand piano},
    q{colorful pianos},
    q{colorful keyboards},
    q{keyboard},
    q{"madclown" peter lulzsec},
    q{"madclown" peter fisher},
    q{madclown peter fisher},
    q{madclown nigg},
    q{tr0ll gnosis mole},
    q{tr0ll gnosis},
    q{irc gnosis},
    q{gnosis},
    q{mole lulzsec},
    q{mole gn0sis},
    q{george jolicoeur florida},
    q{George Jolicoeur},
    q{fat criminal},
    q{george jolicoeur},
    q{earl sweatshirt},
    q{lil durk},
    q{raaraa talking sit},
    q{raaraa},
    q{you can be touched},
    q{mindy vega},
    q{truc picnic},
    q{truk picnic},
    q{truck picnic},
    q{cho},
    q{jose guapo},
    q{maria swan nude},
    q{maria swan gif},
    q{jen bayer},
    q{jen the pen bayer},
    q{mc paul barman},
    q{mc paul berman},
    q{tor},
    q{rakim},
    q{jay-z},
    q{big daddy kane},
    q{2013-1989},
    q{2013-1988},
    q{laughinggirls.jpg},
    q{the first word you see describes you},
    q{krazyvideoz efnet},
    q{bpsrn},
    q{wilfredo guevara godoy},
    q{dronebl},
    q{LET 30 SHOTS GO CALL THAT A CROWD CLEARER},
    q{chase staffing},
    q{extended barrel for tec 9},
    q{extended barrel for machine gun},
    q{becca's song andrew godoy},
    q{indian baby},
    q{mature porn},
    q{93.183.155.80 sockslist},
    q{93.183.155.80},
    q{99-110-237-43.lightspeed.tukrga.sbcglobal.net},
    q{2wire dynamic ip},
    q{2wire internet static ip},
    q{in and out gif},
    q{christina applebum},
    q{pepsi next},
    q{pespi next},
    q{chastity belt},
    q{randy orton gif},
    q{randy orton},
    q{protection order},
    q{419 phone number},
    q{419},
    q{adriana's},
    q{adrianas},
    q{sarcasm t-shirt},
    q{lord jamar},
    q{cash money records logo},
    q{cash money records},
    q{cmr},
    q{nachash evan mitchell},
    q{nachash phillip stevens},
    q{nacash phillip stevens},
    q{nacash pastebin},
    q{wilfredo guevara godoy},
    q{girls gone dead beetlejuice},
    q{beetlejuice georgia},
    q{beetlejuice},
    q{as bad as can},
    q{cm punk disses fans},
    q{jay-z},
    q{jay-z you gon get this work},
    q{dmx},
    q{amber rose nude},
    q{ace hood goin down},
    q{nigga been on probation since i dont know when},
    q{love sosa intro video},
    q{lil wayne tha carter 2},
    q{make noise p r},
    q{roc sign},
    q{illuminati diamond tattoo},
    q{illuminati diamond},
    q{diamond sign illuminati},
    q{diamon sign illuminati},
    q{red cafe chief kee},
    q{red cafe},
    q{fredo christmas hat},
    q{p. rico make noise},
    q{p. rico jojo},
    q{p. rico jojlo},
    q{p. rico brick squad},
    q{p. rico brickswuad},
    q{selena star},
    q{selena starr},
    q{destiny's child super bowl 2013},
    q{destiny's child superbowl},
    q{destiny's child},
    q{chief keef},
    q{true religion denim jacket},
    q{woke up this morning got yourself a gun},
    q{woke up this mornin got urself a gun},
    q{the krown albuquerque},
    q{the crowne albuquerque},
    q{the crown albuquerque},
    q{the krown albequerke},
    q{the krown},
    q{$wagg on the clock},
    q{kobe jordan biting jersey},
    q{ether},
    q{trinidad},
    q{toledo to detroit},
    q{zeeland michigan to toledo},
    q{toledo to milwaukee},
    q{cuban links},
    q{raekwon},
    q{ether},
    q{dj quik perm},
    q{snoop perm},
    q{perm},
    q{rainbow god},
    q{rainbow god's promise},
    q{odd future fight san antonio},
    q{odd future attempted murder},
    q{odd future murder},
    q{odd future fight},
    q{superbowl},
    q{seoul},
    q{predator},
    q{preadotr},
    q{t-shirts and buddens},
    q{white knight},
    q{hank the angry drunken dwarf},
    q{beetlejuice},
    q{cannabis drink},
    q{activist drink},
    q{activist},
    q{"attention mac faggots. mac os is stupid, and is for stupid, underskilled shitlickers who think"},
    q{"stop it or 1.) im telling an oper"},
    q{"stop it or 1) im telling an oper"},
    q{stop it or im telling an oper},
    q{like a martian},
    q{task force},
    q{thread spool},
    q{used thread},
    q{thread in trash},
    q{thread},
    q{no limit album covers},
    q{tupac no limit album covers},
    q{tupac no limi album covers},
    q{future pluto},
    q{in out gif},
    q{chief keef before he was a glory boy},
    q{chief keef before fame},
    q{voltorb flip},
    q{flame soulja slim},
    q{future spazz on yall},
    q{lil b},
    q{fredo santana},
    q{intercall},
    q{chase jobs},
    q{lisa ann nudevista},
    q{trish stratus nip slip video},
    q{trish stratus nip slip},
    q{martian sky},
    q{martian sky stars},
    q{boxing gucci mane},
    q{knight kirk},
    q{lil nico apologizes},
    q{joseline hernandez},
    q{kaylin garcia nude},
    q{kaylin garcia},
    q{ghetto symphony},
    q{atv offroad fury 2},
    q{paragraph president},
    q{got a gun},
    q{do the shawty lo},
    q{feminine training},
    q{op is a phaggot gif family feud},
    q{op is a phaggot gif},
    q{op is a phagot gif},
    q{family feud gif},
    q{op is a phaggot family feud gif},
    q{op is a phaggot},
    q{b-32 i need a bag of dope},
    q{"For me, it was about not getting anything out at the stores because it was raining on and off. So instead of not going out, I did go out to the stores to eat some food."},
    q{For me, it was about not getting anything out at the stores because it was raining on and off. So instead of not going out, I did go out to the stores to eat some food.},
    q{eve torres},
    q{two dekalb county officers men arrested for stealing $65,000 worth of checken},
    q{star player hater},
    q{troi torain player hater},
    q{player haters ball},
    q{jojo simmons},
    q{lincoln},
    q{I awe at your logical and intellectual superiority, you are the second coming of Albert Einstein, no, Isaac Newton. We should all bow down to your grammatical greatness.},
    q{horseshoe gang},
    q{juelz santana gbe},
    q{juelz santana fredo santana},
    q{juelz santana lil reese},
    q{lil wayne},
    q{pusha t doesn't matter},
    q{french montana it doesn't even matter},
    q{french montana it doesnt even matter},
    q{fredo santana},
    q{packet},
    q{pokemon},
    q{111 petrol point peachtree city ga},
    q{petrol point probation office peachtree city},
    q{danica patrick nude},
    q{fredo santana},
    q{wale},
    q{mahmoud ereikat},
    q{edai},
    q{aiki},
    q{world series of dice},
    q{onyx all we got iz us},
    q{jerry lynn},
    q{kanye west},
    q{anders behring breivik cell},
    q{anders behring breivik},
    q{prison suite},
    q{angie martinez nude},
    q{lil debbie nude},
    q{lil debbie},
    q{Show & AG "Next Level (Nyte Time Mix)"},
    q{beauty dior},
    q{lil reese 300 gif},
    q{lil reese gif},
    q{lil reese 300},
    q{fredo santana},
    q{goat},
    q{pokemon platinum ost},
    q{iphone 5 cons},
    q{iphone 5},
    q{jay-z basketball game},
    q{jay-z basketball gane},
    q{jay-z twirling basketball},
    q{kano mortal kombat},
    q{kano},
    q{more than swag},
    q{obama},
    q{carly mckinney},
    q{carly mckinney twitter},
    q{carl mckinney twitter},
    q{carl mckinney},
    q{obtained heavy balls},
    q{tupac batman},
    q{tupac superman},
    q{tupac superhero},
    q{super tupac},
    q{skip bayless},
    q{roc nation},
    q{t-shirts and buddens},
    q{lil reese hot97},
    q{camron twitter},
    q{camron twittet},
    q{moneygram newnan},
    q{lil b obama basedgod},
    q{you think im wack i think you're stupid shot you in your heart you think im cupid},
    q{prince 1999},
    q{wesley willis},
    q{camron spits on girl},
    q{camron gif},
    q{hypebeast},
    q{lil nico apologizes},
    q{hair styles for girls},
    q{aiki},
    q{edai lil jay 00 twitter},
    q{edai},
    q{french quarter},
    q{boxden beat box},
    q{sammie},
    q{lisa ann},
    q{lisa anne},
    q{pot kettle black},
    q{Just got word @rickyrozay suppose to be at club #compound on Jan 26th !!! Its a no go!!! he think its a game!!!! All gs lock that date in},
    q{rick ross compound night club gds},
    q{rick ross atlanta gds jan 26},
    q{k foxx},
    q{tahiry},
    q{tahiry joe budden},
    q{tahiri joe budden},
    q{tahiri},
    q{slim dunkin mr feeny},
    q{danielle christine fishel nude},
    q{danielle christine fishel},
    q{benzino},
    q{kline ratbox},
    q{is the adams apple supposed to stick out},
    q{cut larynx},
    q{cut adams apple},
    q{sk la flare},
    q{yung berg},
    q{chief keef},
    q{chief keef crucifix},
    q{chief keef crucify},
    q{chief keef cry},
    q{nutt da legend},
    q{shot97 radio live broadcast},
    q{shot97 radio},
    q{how to do spoiler tags on 420chan},
    q{speedtest},
    q{there are more african american prisoners than slaves},
    q{probation set up to get arrested},
    q{truc picnic},
    q{tupac picnic},
    q{triple entendre},
    q{swagg and jojo},
    q{melpopene},
    q{what part of new orleans is frank ocean from},
    q{peachtree city county jail},
    q{peachtree city county jail inmates},
    q{waka flocka crips},
    q{olivia munn nude leak},
    q{olivia munn nude},
    q{mya harrison nude},
    q{mya nude},
    q{mya harrison see through},
    q{mya harrison},
    q{mya harrison nip},
    q{brooke hogan nip slip},
    q{humping pact initiative},
    q{dark souls gif},
    q{great lightning spear},
    q{lord gwyn},
    q{hustle and flow},
    q{forever drake},
    q{forever},
    q{jasmine waltz wikipedia},
    q{jasmine waltz},
    q{jasmine waltzs},
    q{jasmine waltz and jesse},
    q{lebron flocka james 4},
    q{Why is society covering up that there are more bi-sexual women than straight women?},
    q{human eye},
    q{eye},
    q{eyemed},
    q{eye of god nebula},
    q{midwest rap},
    q{Why is society covering up that there are more bi-sexual women than straight women?},
    q{itsbx},
    q{mystikal not that nigga},
    q{magnezone},
    q{magenzeone},
    q{sesame street its ok to cry},
    q{samuel l jackson django},
    q{welcome to puerto rico mixtape},
    q{p rico mixtape},
    q{lil jay 00 unexpected fame},
    q{lil jay 00 mixtape},
    q{leopard seal},
    q{leapard seal},
    q{seal animal},
    q{seal},
    q{violate that bitch},
    q{eminem},
    q{That all receive 9-11 in what it was. It was a mark (a dent or a scratch in particular from what all mark can imply). And it surely left a mark because people start having it in their foreheads or in their right hand (when they talk online about it).},
    q{That all recieve 9-11 in what it was. It was a mark (a dent or a scratch in particular from what all mark can imply). And it surely left a mark because people start having it in their foreheads or in their right hand (when they talk online about it).},
    q{don killuminati},
    q{Claudia Colucci nude},
    q{Claudia Colucci},
    q{nudevista},
    q{alicia fox nude},
    q{richard matthew stallman},
    q{rms},
    q{double d ed edd n eddy},
    q{double d},
    q{acid lsd},
    q{pineal gland},
    q{peneal gland},
    q{my name is wizzle lyrics},
    q{lil wayne "this is just my love song"},
    q{lil wayne this is just my love songs},
    q{don killuminati artwork},
    q{don killuminati},
    q{chief},
    q{chief keef cry},
    q{crucial conflict},
    q{smokin on hay},
    q{"holographic world" book},
    q{"holographic world"},
    q{holographic world},
    q{emmulation},
    q{vonbraun hanz},
    q{prince positivity},
    q{google videos},
    q{prince positivity tube},
    q{prince positivity},
    q{why dont you go bathe in the waters of lake minnetonka},
    q{prince great},
    q{black gangster disciple},
    q{black gangster disciples},
    q{gangster disciples},
    q{box chevy},
    q{nascar #1},
    q{nacsar #1},
    q{nacsar 24},
    q{no 1 nascar},
    q{register freeonsmash},
    q{register onsmash},
    q{master p killer pussy},
    q{ray allen 2013},
    q{ray allen},
    q{yyou},
    q{suge knight katt williams fight},
    q{gho5t 2pac},
    q{in game trades pokemon heart gold},
    q{pokemon heartgold wpa2},
    q{nintendo dsi xl wpa2},
    q{paula faris nude},
    q{john krueger faris},
    q{john krueger},
    q{paula faris husband},
    q{paula faris krueger},
    q{paula faris},
    q{paula faris anna faris related},
    q{anna faris paula},
    q{anna faris},
    q{paula krueger world news now},
    q{paula kruger world news now},
    q{paula kruger},
    q{paula kreuger},
    q{cazal},
    q{zombieland 2},
    q{zombieland 2 2011},
    q{zombieland},
    q{Feel the warmth of the one who never dies.},
    q{lil reese 3hunna gif},
    q{lil reese beats up girl},
    q{black mario costume},
    q{black mario},
    q{black boy mario costume},
    q{black boy mario},
    q{slander},
    q{no limit hat},
    q{adams apple un},
    q{real kings dont die they become martyrs},
    q{how come he don't want me man},
    q{how come he dont want me man},
    q{how come he dont love me man},
    q{assasination fail},
    q{4gifs},
    q{kanye west grew up confused},
    q{chief keef},
    q{chief keef as a child},
    q{obamicon},
    q{obamaize},
    q{imgu},
    q{baby 2pac},
    q{baby pac},
    q{hunna},
    q{break a band},
    q{chief keef no limit},
    q{chief keef as a child},
    q{reby sky},
    q{britani knight nude},
    q{paige wwe},
    q{summer rae nude},
    q{summer rae},
    q{14 in roman numeral},
    q{vine street atlanta},
    q{promotions glitch ps3},
    q{promotions glitch},
    q{dark souls promotions glitch},
    q{promotions dark souls},
    q{shenron real},
    q{shenron sighting},
    q{porunga},
    q{quetzalcoatl sighting},
    q{quetzalcoatl},
    q{real dragon found},
    q{real dragon sightings},
    q{dragon sightings},
    q{loch ness monster},
    q{real sea monsters},
    q{sea monster},
    q{real life gyarados},
    q{real life gyrados},
    q{hydra dark souls},
    q{hydra},
    q{loch ness monster},
    q{lochness monster},
    q{turtle without shell},
    q{tupac fiance},
    q{dipping snuff},
    q{child dipping snuff},
    q{child dipping},
    q{copenhagen kid},
    q{ousha t},
    q{jenna shea bussin},
    q{daylyt sextape},
    q{daylyt sex tape},
    q{jenna shea porn},
    q{jenna shea tube},
    q{jenna shea},
    q{houston rockets mascot smashes face},
    q{bang pt 2},
    q{landscaping goggles},
    q{lawn mowing glasses},
    q{kelly kelly calender},
    q{future fbg},
    q{raw dizzy},
    q{raw dizzy lil wayne war},
    q{we live together porno},
    q{charlie sweets},
    q{Phoenix Askani},
    q{effie Making Music Together},
    q{effie wet and fucked},
    q{trouble go},
    q{are pigs clean},
    q{keef},
    q{we live together porno},
    q{bugs bunny florida},
    q{we live together porno},
    q{steampunk poetry},
    q{"last tears of a dying robot"},
    q{last tears of a dying robot},
    q{we them bang brothers},
    q{j mane gbe diss},
    q{interscope},
    q{rakim pioneered lyricism},
    q{rakim pioneer},
    q{rakim lyrical},
    q{haterz},
    q{d4l},
    q{bdn 2414},
    q{derrick rose gd},
    q{derrick rose gang},
    q{derrick rose},
    q{black disciples nation},
    q{black disciples},
    q{bdn},
    q{a cieleto lindo},
    q{"bun b" gangster disciples},
    q{bump j vice lord},
    q{bump j},
    q{lil flip leprechaun},
    q{pug t-shirt},
    q{a cieleto lindo},
    q{sonic fan movie},
    q{saints row 2 ezzy fm},
    q{ezzy fm},
    q{adonai eloheinu},
    q{jay-z you gon get this work},
    q{jimmy iovine},
    q{llama gun},
    q{ewa sonnet gif},
    q{ewa sonnet porn},
    q{ewa sonnet tube},
    q{ewa sonnet nude},
    q{ewa sonnet},
    q{women with big breasts pouring water on each other gif},
    q{women with big breasts pouring water on each other},
    q{women with big breasts pouring water on eachother},
    q{http://ist1-4.filesor.com/pimpandhost.com/2/2/3/2/22325/Z/L/a/U/ZLaU/fae7pgf2q2oagxq0xf0.gif},
    q{this is charles hamilton},
    q{charles hamilton pink lavalamp},
    q{pink lava lamp},
    q{lava in a cup},
    q{drink lava},
    q{drink lava flow},
    q{fiji water},
    q{delhi water},
    q{dasani water},
    q{aquafina},
    q{fiji water},
    q{yfw americlaps},
    q{partners pizza atlanta},
    q{partners pizza},
    q{<object width="448" height="374"><param name="movie" value="http://www.worldstarhiphop.com/videos/e/16711680/wshh7516ffdAc0npMRsd"></param><param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always"></param><embed src="http://www.worldstarhiphop.com/videos/e/16711680/wshh7516ffdAc0npMRsd" type="application/x-shockwave-flash" allowFullscreen="true" width="448" height="374"></embed></object>},
    q{saw movie theme},
    q{rosa mendes nude},
    q{eve torres see through},
    q{eve torres nude},
    q{michelle mccool nipple slip},
    q{trish stratus nipple slip},
    q{madison rayne nip},
    q{madison rayne nipple slip},
    q{daffney nip},
    q{daffney},
    q{raesha saed},
    q{nip slip tna},
    q{brooke hogan nip slip tna},
    q{brooke hogan nip slip},
    q{mary louise parker nude},
    q{mary louise parker},
    q{fakeshoredrive chief keef},
    q{chopper city shot},
    q{otaku photoshop internet identity},
    q{otaku photoshop internet},
    q{girls selfshot naked},
    q{rip lil jojo},
    q{lil jojo},
    q{flocka flame},
    q{chief keef},
    q{chief keef point gun},
    q{chief keef points gun at cop},
    q{chief keef point gun at cop},
    q{chief keef mother cry},
    q{chief keef didn't cry},
    q{fredo santan},
    q{andrew wk},
    q{jacques greene},
    q{big sigh sound},
    q{big sigh},
    q{lisa ann},
    q{nailin palin},
    q{corporate man},
    q{corporate white man},
    q{giraffe getting shot gif},
    q{louisiana hood fight},
    q{jena 6 video},
    q{jena 6 beating},
    q{indian babies},
    q{indian babies laughing},
    q{babies laughing},
    q{black babies},
    q{babies},
    q{triple h angry},
    q{the rock pretending to be the undertaker},
    q{the rock i came},
    q{make giffs from youtube},
    q{lil reese fredo chief keef},
    q{p rico make noise},
    q{tony blancka},
    q{tony blanka},
    q{tony blankla},
    q{kieth bonds},
    q{gh},
    q{beacon of light in your harbor of inequity},
    q{beacon of light in a harbor of inequity},
    q{dana plato},
    q{fucked up shit reddit},
    q{fucked up shit redit},
    q{seth rogan},
    q{child kidnapper},
    q{my name is steven},
    q{adriana lima nude},
    q{nicki minaj sex tape},
    q{miranda kerr sex tape},
    q{miranda kerr nude},
    q{miranda kerr},
    q{adriana lima victoria secret},
    q{adriana lima},
    q{adriana lima sex tape},
    q{new orleans},
    q{bogota},
    q{difficulty smackdown vs raw 2010},
    q{how to increase technical skill in career mode in smackdown vs raw 2010},
    q{overpowered finishers smackdown vs raw 2010},
    q{overpowered finishers smackdown vs raw 2100},
    q{bad effects of smoking pot},
    q{groupie},
    q{2 sanctuary guardians},
    q{mr candie action figure},
    q{mr candy action figure},
    q{cillian murphy},
    q{sunshine movie},
    q{50 tyson autism},
    q{ducktales alternate},
    q{mortal kombat pyramid},
    q{mortal kombat pyramid of argus},
    q{dark souls 2 edge},
    q{irssi identifiers},
    q{lil jay 00 twitter},
    q{gorillas in the jungle},
    q{gorillas in the mist},
    q{"real in the field"},
    q{real in the field},
    q{l's black disciples},
    q{c-murder},
    q{black hitler},
    q{hitler black},
    q{hitler},
    q{hitler was half black},
    q{man in the yellow hat},
    q{predator face},
    q{esl jobs},
    q{slight ache in testicles},
    q{feeling a slight pull in testicle},
    q{you are a wigger},
    q{p. rico chief keef diss},
    q{p rico br},
    q{p rico},
    q{p rico make noise},
    q{leilani dowding vagina},
    q{leilani dowding},
    q{jessica barth nude},
    q{jessica barth},
    q{peedi crakk gif},
    q{top 10 questions about the economy},
    q{lil chuckee},
    q{los dark fantasy},
    q{lil wayne all alone},
    q{"2pac in the cut"},
    q{2pac in the cut},
    q{horoscope},
    q{salami},
    q{dark souls 2 epic name bro},
    q{internet nerd},
    q{white supremacy on the internet},
    q{japanese are smarter than whites},
    q{jay electronica act II},
    q{forever alone},
    q{river man dance},
    q{lil mouse},
    q{keef bang mixtape},
    q{anna wise},
    q{lil wayne carter 3},
    q{all eyez on me 10 million sold},
    q{all eyez on me diamond},
    q{all eyez on me sales},
    q{drake},
    q{shaving a walrus},
    q{walrus shave},
    q{vibrissae scissors},
    q{vibrissae shave},
    q{dog vibrissae},
    q{bristle},
    q{walrus},
    q{nvidia handheld},
    q{shang tsung babality},
    q{mortal kombat 9 nude},
    q{jade mortal kombat 9 alternate costume},
    q{jade mortal kombat 9 alt},
    q{jade mortal kombat 9},
    q{kitana mortal kombat 9},
    q{mileena mortal kombat 2011 alt},
    q{mileena mortal kombat 2011},
    q{skarlet babality},
    q{scarlett babality},
    q{stillborn},
    q{human zygote},
    q{zygote},
    q{stillborn},
    q{k-rino open thought surgery},
    q{abe simpson gif imgur},
    q{abe simpson gif},
    q{simpsons in and out},
    q{freddy e},
    q{kid buu destroys galaxy},
    q{bleach},
    q{timbaland},
    q{walrus whiskers shaved},
    q{walrus whiskers},
    q{walrus moustache},
    q{walrus shaved},
    q{walrus},
    q{shaved walrus},
    q{heather clem nude},
    q{heather clem sex tape},
    q{heather clem},
    q{hulk hogan sex tape},
    q{kanye west sex tape},
    q{demi lovato sex tape},
    q{demi lovato sextape},
    q{jennifer love hewitt nude},
    q{jennifer love hewitt},
    q{zmovies tv},
    q{vidbux du_CD2.mkv},
    q{vidbux du_CD2},
    q{711chan},
    q{UNCLE_JIM_BOB flat earth society},
    q{irc.grove.bz interview},
    q{uncle_jim_bob},
    q{match tempos in audacity},
    q{million dollar extreme},
    q{skarlet mk9},
    q{copenhagen kid},
    q{laurelai encyclopedia dramatica},
    q{undead dragon valley of drakes},
    q{white knight},
    q{lil boosieana},
    q{big sausage pizza},
    q{piccolo db evolution},
    q{piccolo db},
    q{piccolo movie},
    q{piccolo},
    q{tupac piccolo},
    q{poetic justince},
    q{tupac piccolo},
    q{darth maul scream},
    q{lil jojo},
    q{big smoke gta},
    q{big smoke},
    q{big smoke jersey},
    q{big smoke jersy},
    q{big smoke costume},
    q{big smoke original},
    q{capra demon wikidot},
    q{white knight},
    q{3 fine hoes},
    q{eat the cake annie mae},
    q{ssarcasm shirt},
    q{3oh3},
    q{ruzzle},
    q{ruzle},
    q{3 fine hoes},
    q{jim giles},
    q{bassinet},
    q{sheep soundboard},
    q{animal soundboard},
    q{you were taken by the abyss},
    q{123 degree},
    q{123 degrees radius},
    q{123 degrees celsius fahrenheit},
    q{360 walk away},
    q{female skeleton},
    q{enyce sweatsuit},
    q{enyce sweat suit},
    q{lil jay datpiff},
    q{chief keef gifs},
    q{cloudbrah},
    q{dj kay slay shade 45},
    q{jimmy iovine},
    q{sexy wives sindrome},
    q{christin black},
    q{krisztina caravana},
    q{caravana ventura},
    q{carvana ventura},
    q{wall worm dark souls},
    q{ghostface take care},
    q{oblock 4 life},
    q{o block 4 life},
    q{capab r\n\ exploit},
    q{capab r\n\ },
    q{capab r\n},
    q{urban dictionary power up},
    q{how to accept dcc irssi},
    q{the golden lotus},
    q{the golden lotuss},
    q{list of medieval authors},
    q{asterix and obelix},
    q{aterix and obelix},
    q{christchurch},
    q{christchurch earthquake},
    q{thejoefrom1993},
    q{smexy irc},
    q{smexy},
    q{max ether pokemon},
    q{ether pokemon card},
    q{ether pokemon},
    q{maractus},
    q{zone 6},
    q{pathways learning center},
    q{claire forlani nude},
    q{claire forlani},
    q{dewars white label commercial claire forlani},
    q{dewars white label commercial},
    q{dewars white label},
    q{mila kunis sex scene},
    q{jenny mccarthy sex},
    q{jenny mccarthy nude},
    q{jenny mccarthy new years},
    q{dick clark new years eve 2012},
    q{tras},
    q{causes of uti in women},
    q{uti},
    q{cranberry pills},
    q{chief keef},
    q{predator face},
    q{twista vice lord},
    q{vice lords},
    q{venn diagram},
    q{do apes cough and sneeze},
    q{bats in the sky},
    q{bats in the sk},
    q{new mcdonalds commercial jpop drop},
    q{vermont},
    q{maine capital},
    q{myu},
    q{2pac and Eskiah},
    q{housing market in nyc},
    q{roaches that spell out i heart you},
    q{fat baby smoking},
    q{fat baby},
    q{dumbbells},
    q{dumbells},
    q{channing tatum},
    q{wanwan},
    q{asians obsessed with black culture},
    q{asians obsessed with black women},
    q{wraith irc},
    q{eau le doet},
    q{dont make me snap my fingers},
    q{instagram profile picture problems},
    q{enlarge instagram profile picture},
    q{how to enlarge instagram profile picture},
    q{zayn malik shirtless},
    q{zayn malik},
    q{tila tequila howard stern riding},
    q{tila tequila howard stern},
    q{random string generator mirc},
    q{kickban alias mirc},
    q{crying giraffe}
);


sub dolphin {
    my ($data, $server, $target_channel) = @_;

    my $search = $searches[int(rand(scalar(@searches)))];
    $target_channel->command("MSG " . $target_channel->{name} . " Searched for $search");
}

Irssi::command_bind('dolphin', 'dolphin');