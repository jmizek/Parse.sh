#!/bin/sed -f

#
# Parse.sh - A utility for replacing text for reading aloud through utilities such
#            as espeak, or a frontend such as Gespeaker
#

#political names
s/Boehner/Bayner/g
s/Bernanke/Bernankee/g
s/bin Laden/bin lahden/g
s/Reagan/Raygan/g
s/Bachmann/Bahkmann/g
s/John F\. Kennedy/John F Kennedy/g
s/Super \?PAC\(s\)\?\(\W\)/super pac\1\2/gI
s/ACLU/A-C-L-U/g

#abbreviations
s/vs\.\?/versus/g
s/\([0-9]\+\)-\([0-9]\+\)/\1 to \2/g
s/\([0-9]\+\)x10\^\([0-9]\+\)/\1 times 10 to the \2th/g #scientific notation with positive exponent
s/\([0-9]\+\)x10\^-\([0-9]\+\)/\1 times 10 to the negative \2th/g #scientific notation with negative exponent
s/\([0-9]\+\)x\([0-9]\+\)/\1 by \2/g
s/\([0-9]\+\)x\(\W\)/\1 times\2/g
s/no\. \([0-9]\+\)/number \1/gI
s/\(\W\)Co\./\1Company/g
s/WWI\(\W\)/WW1\1/g
s/WW\(II\|1\|2\)/World War \1/g

#technology
s/LAN/lan/g
s/WAN/wan/g
s/NET/net/g
s/\(\W\)MAC\(\W\)/\1mac\2/g
s/RAM/ram/g
s/ROM/rom/g
s/DDoS/DDOS/g
s/RFID/R-F-I-D/g
s/SIM/sim/g
s/WiMAX/WiMax/g
s/SSID/S-S-I-D/g
s/MMORPG/muh-morpuguh/g #Tribute to "Yatzee"; comment this out and uncomment the next line for proper pronunciation
#s/MMORPG/MMO-RPG/g #uncomment this and comment out the above line for proper pronunciation
s/SD card/S-D card/g #without this, SD gets turned to South Dakota
s/ASCII/ass-key/g #looks rude, but gets pronounced correctly
s/ISPs/I-S-Pees/g #also looks somewhat rude, but again, necessary
s/VoIP/V-O-I-P/g
s/\(\W\)SIP\(\W\)/\1Sip\2/g
s/IPv\([46]\)/I-P-V\1/g
s/\(\W\)PIN\(\W\)/\1Pin\2/g
s/802\.11/8-o-2point11/g

#computational units
s/\([TGMk]\)Hz/\1-hertz/gI
s/\(TB\|GB\|MB\|kB\)ps/\1 per second/gI
s/\([0-9]\| \)\([TGMkK]\)b\(\W\)/\1\2-bits\3/g #both upper and lowercase K to ensure success
s/\([0-9]\| \)\([TGMkK]\)B\(\W\)/\1\2-bytes\3/g
s/T-\(bits\|bytes\|hertz\)/terra-\1/g
s/G-\(bits\|bytes\|hertz\)/giga-\1/g
s/M-\(bits\|bytes\|hertz\)/mega-\1/g
s/k-\(bits\|bytes\|hertz\)/kilo-\1/gI

#electrical units or other units with upper-case letters
s/k\([AVWL]\)/kilo-\1/g
s/m\([AVWL]\)/milli-\1/g
s/[uµ]\([AVWL]\)/micro-\1/g
s/n\([AVWL]\)/nano-\1/g
s/p\([AVWL]\)/pico-\1/g
s/\(kilo\|milli\|micro\|nano\|pico\)-A/\1-amps/g
s/\(kilo\|milli\|micro\|nano\|pico\)-amps\(H\|Hr\)/\1-amp-hour/gI
s/\(kilo\|milli\|micro\|nano\|pico\)-V/\1-volts/g
s/\(kilo\|milli\|micro\|nano\|pico\)-W/\1-watts/g
s/\(kilo\|milli\|micro\|nano\|pico\)-watts\(H\|Hr\)/\1-watt-hour/gI
s/\(kilo\|milli\|micro\|nano\|pico\)-L/\1-liters/g

#units of distance or other units with lower-case letters
# these must be separate from upper-case units because
# of the need to make sure they aren't part of a word
s/\([0-9]\| \)\([kmµunp]\)g\(\W\)/\1\2-grams\3/g #removed 'c' because no one says centigrams
s/\([0-9]\| \)\([mµnp]\)s\(\W\)/\1\2-seconds\3/g #removed 'c' and 'k' because no one uses them in this way, 'u' for word 'us'
s/\([0-9]\| \)\([kcmµn]\)m\(\W\)/\1\2-meters\3/g #removed 'u' and 'p' to avoid confusion with um as a word and pm re: time
s/\([0-9]\| \)k-\(grams\|meters\)/\1kilo-\2/g
s/\([0-9]\| \)c-meters/\1centi-meters/g
s/\([0-9]\| \)m-\(grams\|meters\|seconds\)/\1milli-\2/g
s/\([0-9]\| \)[uµ]-\(grams\|meters\|seconds\)/\1micro-\2/g
s/\([0-9]\| \)n-\(grams\|meters\|seconds\)/\1nano-\2/g
s/\([0-9]\| \)p-\(grams\|meters\|seconds\)/\1pico-\2/g

#yet more units
s/\([0-9]\+\)' \?\([0-9]\+\)"/\1 foot \2/g #'
s/\([0-9]\| \)[lL]b\.\?/\1pound/g

#titles
s/Mr\./Mister/g
s/Ms\./Miss/g
s/Mrs\./Misses/g
s/Sen\./Senator/g
s/Rep\./Representative/g
s/Gov\./Governor/g
s/Gen\./General/g
s/Sgt\./Sergeant/g
s/Pfc\./Private first commander/g
s/Lt\./lieutenant/g
s/Maj\./Major/g
s/Col\./Colonel/g
s/Ltc\./lieutenant Colonel/gI
s/LtCol\./lieutenant Colonel/gI
s/Ph\.D\./PhD/gI

#replace dollar amounts when used as an adjective
# eg. "The $35 model entered the manufacturing stage" should be
#     "The 35 dollar model entered the manufacturing stage"
# not "The 35 dollars model entered the manufacturing stage"
# This is an ugly kludge, but it ought to provide better results.
# I have my doubts as to whether this can be done accurately using
# an empirical method.
s/\(a\|the\) \$\([0-9]*\)\(\.\)\?\([0-9]*\) \(tr\|b\|m\)illion/\1 \2\3\4 \5illion dollar/gI
s/\(a\|the\) \$\([0-9]*\)\(,[0-9]\+\)\?\.\([0-9]\+\)/\1 \2\3 dollar and \4 cent/gI
s/\(a\|the\) \$\([0-9]*\)\(,[0-9]\+\)\?/\1 \2\3 dollar/gI
#replace dollar amounts in typical fashion
s/\$\([0-9]*\)\(\.\)\?\([0-9]*\) \(tr\|b\|m\)illion/\1\2\3 \4illion dollars/gI
s/\$\([0-9]*\)\(,[0-9]\+\)\?\.\([0-9]\+\)/\1\2 dollars and \3 cents/g
s/\$\([0-9]*\)\(,[0-9]\+\)\?/\1\2 dollars/g
#replace British pounds when used as an adjective
s/\(a\|the\) £\([0-9]*\)\(\.\)\?\([0-9]*\) \(tr\|b\|m\)illion/\1 \2\3\4 \5illion pound/gI
s/\(a\|the\) £\([0-9]*\)\(,[0-9]\+\)\?\.\([0-9]\+\)/\1 \2\3.\4 pound/gI
s/\(a\|the\) £\([0-9]*\)\(,[0-9]\+\)\?/\1 \2\3 pound/gI
#replace British pound amounts in typical fashion
s/£\([0-9]*\)\(\.\)\?\([0-9]*\) \(tr\|b\|m\)illion/\1\2\3 \4illion pounds/gI
s/£\([0-9]*\)\(,[0-9]\+\)\?\.\([0-9]\+\)/\1\2.\3 pounds/g
s/£\([0-9]*\)\(,[0-9]\+\)\?/\1\2 pounds/g

#months of the year
s/Jan\.\? \([0-9]\)/January \1/g
s/Feb\.\? \([0-9]\)/February \1/g
s/Mar\.\? \([0-9]\)/March \1/g
s/Apr\.\? \([0-9]\)/April \1/g
s/Jun\.\? \([0-9]\)/June \1/g
s/Jul\.\? \([0-9]\)/July \1/g
s/Aug\.\? \([0-9]\)/August \1/g
s/Sept\?\.\? \([0-9]\)/September \1/g
s/Oct\.\? \([0-9]\)/October \1/g
s/Nov\.\? \([0-9]\)/November \1/g
s/Dec\.\? \([0-9]\)/December \1/g

#dates
s/\(January\|February\|March\|April\|May\|June\|July\|August\|September\|October\|November\|December\) \([0-9]\{1,2\}\)\(\W\|$\)/\1 \2th\3/g
s/ \([2-9]\)\?1th/ \11st/g #fixes other ordered numbers
s/ \([2-9]\)\?2th/ \12nd/g #fixes other ordered numbers
s/ \([2-9]\)\?3th/ \13rd/g #fixes other ordered numbers

#time and time zones
s/\(\W\)PST/\1Pacific Standard Time/g
s/\(\W\)PDT/\1Pacific Daylight Time/g
s/\(\W\)EST/\1Eastern Standard Time/g
s/\(\W\)EDT/\1Eastern Daylight Time/g
s/\(\W\)ET\(\W\|$\)/\1Eastern Time\2/g
s/\(\W\)CST/\1Central Standard Time/g
s/\(\W\)CDT/\1Central Daylight Time/g
s/\(\W\)KST/\1Korean Standard Time/g
s/\([0-9]\):\([0-9]\)\([0-9]\) \?\([ap]\)m/\U\1:\2\3\4M/g
s/\([0-9]\):00/\1o-clock/g
s/\([0-9]\):0\([0-9]\)/\1o\2/g

#days of the week
s/Sun\./Sunday/g
s/Mon\./Monday/g
s/Tue\./Tuesday/g
s/Tues\./Tuesday/g
s/Wed\./Wednesday/g
s/Thu\./Thursday/g
s/Thurs\./Thursday/g
s/Fri\./Friday/g
s/Sat\./Saturday/g

#Say years properly
s/\([0-9]\)000/\1 thousand/g
s/\([0-9]\)\([0-9]\)\([0-9]\)\([0-9]\)/\1\2 \3\4/g
s/\([0-9]\)\([0-9]\) 00/\1\2 hundred/g
s/\([0-9]\)\([0-9]\) 0\([0-9]\)/\1\2 oh \3/g

#roman numerals
s/\(\W\)VI\(\W\)/\16\2/g
s/\(\W\)IV\(\W\)/\14\2/g #could be problematic for things like IV drips
s/III/3/g
s/II/2/g

#starcraft
s/archon/arkon/gI
s/protoss/protawss/gI
s/esports/eesports/gI
s/SC2/Starcraft2/g
s/SC:BW/Starcraft Broodwar/gI
s/LaLuSh/La-Lush/g
s/\([TPZ]\)v\([TPZX]\)/\1-v-\2/gI
s/Z-v-\([TPZX]\)/Zee-v-\1/gI
s/\(T\|P\|Zee\)-v-Z/\1-v-Zee/gI

#common abbreviations on the internet
s/\(\W\)BTW\(\W\)/\1By the way\2/g
s/\(\W\)IMO\(\W\)/\1In my opinion\2/g
s/\(\W\)IMHO\(\W\)/\1In my humble opinion\2/g
s/\(\W\)AFAIK\(\W\)/\1As far as I know\2/g
s/\(\W\)IIRC\(\W\)/\1If I recall correctly\2/g
s/\(\W\)YMMV\(\W\)/\1Your mileage may vary\2/g
s/\(\W\)FTFY\(\W\)/\1Fixed that for you\2/g

#state postal and general abbreviations
s/\(\W\)AL\(\W\)/\1alabama\2/g
s/\(\W\)AK\(\W\)/\1alaska\2/g
s/\(\W\)\(AZ\|Ariz\.\)\(\W\)/\1arizona\3/g
s/\(\W\)AR\(\W\)/\1arkansas\2/g
s/\(\W\)\(CA\|Cal\.\|Calif\.\)\(\W\)/\1california\3/g
s/\(\W\)\(CO\|Colo\.\)\(\W\)/\1colorado\3/g
s/\(\W\)\(CT\|Conn\.\)\(\W\)/\1connecticut\3/g
s/\(\W\)\(DE\|Del\.\)\(\W\)/\1delaware\3/g
s/\(\W\)\(FL\|Fla\.\)\(\W\)/\1florida\3/g
s/\(\W\)GA\(\W\)/\1georgia\2/g
s/\(\W\)HI\(\W\)/\1hawaii\2/g
s/\([RD]\)-ID\(\W\)/\1-idaho\2/g #intereferes with ID as in "identification"
s/\(\W\)\(IL\|Ill\.\)\(\W\)/\1illinois\3/g
s/\(\W\)\(IN\|Ind\.\)\(\W\)/\1indiana\3/g
s/\(\W\)IA\(\W\)/\1iowa\2/g
s/\(\W\)\(KS\|Kan\.\|Kans\.\)\(\W\)/\1kansas\3/g
s/\(\W\)KY\(\W\)/\1kentucky\2/g
s/\(\W\)LA\(\W\)/\1louisiana\2/g
s/\(\W\)ME\(\W\)/\1maine\2/g
s/\(\W\)MD\(\W\)/\1maryland\2/g
s/\(\W\)\(MA\|Mass\.\)\(\W\)/\1massachusetts\3/g
s/\(\W\)\(MI\|Mich\.\)\(\W\)/\1michigan\3/g
s/\(\W\)\(MN\|Minn\.\)\(\W\)/\1minnesota\3/g
s/\(\W\)MS\(\W\)/\1mississippi\2/g
s/\(\W\)MO\(\W\)/\1missouri\2/g
s/\(\W\)\(MT\|Mont\.\)\(\W\)/\1montana\3/g
s/\(\W\)\(NE\|Neb\.\|Nebr\.\)\(\W\)/\1nebraska\3/g
s/\(\W\)\(NV\|Nev\.\)\(\W\)/\1nevada\3/g
s/\(\W\)NH\(\W\)/\1new hampshire\2/g
s/\(\W\)NJ\(\W\)/\1new jersey\2/g
s/\(\W\)NM\(\W\)/\1new mexico\2/g
s/\(\W\)NY\(\W\)/\1new york\2/g
s/\(\W\)NC\(\W\)/\1north carolina\2/g
s/\(\W\)ND\(\W\)/\1north dakota\2/g
s/\(\W\)OH\(\W\)/\1ohio\2/g
s/\([RD]\)-OK\(\W\)/\1-oklahoma\2/g #interferes with OK i.e. "alright"
s/\(\W\)\(OR\|Ore\.\|Oreg\.\)\(\W\)/\1oregon\3/g
s/\(\W\)\(PA\|Penn\.\)\(\W\)/\1pennsylvania\3/g
s/\(\W\)RI\(\W\)/\1rhode island\2/g
s/\(\W\)SC\(\W\)/\1south carolina\2/g
s/\(\W\)SD\(\W\)/\1south dakota\2/g
s/\(\W\)TN\(\W\)/\1tennessee\2/g
s/\(\W\)TX\(\W\)/\1texas\2/g
s/\(\W\)UT\(\W\)/\1utah\2/g
s/\(\W\)VT\(\W\)/\1vermont\2/g
s/\(\W\)VA\(\W\)/\1virginia\2/g
s/\(\W\)\(WA\|Wash\.\)\(\W\)/\1washington\3/g
s/\(\W\)WV\(\W\)/\1west virginia\2/g
s/\(\W\)\(WI\|Wis\.\)\(\W\)/\1wisconsin\3/g
s/\(\W\)\(WY\|Wyo\.\)\(\W\)/\1wyoming\3/g

#other locales
s/L\.A\./L Eh/g
s/USSR/U-S-S-R/g

#US government affiliated abbreviations
s/U\. \?S\./US/g
s/R-/Republican of /g
s/D-/Democrat of /g
s/SCOTUS/US Supreme Court/g
s/POTUS/President of the US/g
s/\(\W\)DOD\(\W\)/\1Department of Defense\2/gI
s/\(\W\)DOJ\(\W\)/\1Department of Justice\2/gI
s/\(\W\)DHS\(\W\)/\1Department of Homeland Security\2/g
s/\(\W\)OIG\(\W\)/\1Office of the Inspector General\2/g
s/\(\W\)OMB\(\W\)/\1Office of Management and Budget\2/g
s/\(\W\)USDA\(\W\)/\1U-S-D-Eh\2/g
s/ZIP code/zip code/g #especially useful for voices which say 'z' as 'zed'
s/H\.R\./HR/g #house resolution
s/S\.B\./SB/g #senate bill

#other names
s/AT\&T/eighty-entee/g
s/IEEE/I triple-E/g
s/SNES/S-NES/g #for super nintendo
s/iPhone \?\([3-9]\)S/iPhone\1-S/g
s/Cato\(\W\)/Kayto/g
s/401k/4-O1 K/gI
s/\(\W\)RIM\(\W\)/\1R-I-M\2/g
s/Wii/Wee/g
s/Xbox 360/Xbox 3-60/gI
s/RIAA/R I Eh Eh/g
s/MPAA/M-P Eh Eh/g
s/WoW/Wow/g
s/IETF/I-E-T-F/g
s/OFDM/O-F-D-M/g

#basic mispronounced words
s/\(\W\)eke\([sd]\)*\(\W\)/\1eeke\2\3/g #comes out as "eck" otherwise
s/caucuse\([sd]\)\(\W\)/caucus\'\1\2/gI #does not interpret suffixes correctly
s/sushi/sooshee/gI #comes out as "suh-shee" otherwise
s/penchant/pen-chant/gI #comes out as "pawnshawnt" otherwise
s/reissu\(e\|es\|ed\|ing\)\(\W\)/re-issu\1\2/gI #interprets ei as a diagraph otherwise
s/patent/paghtent/gI #comes out as "pay-tent" otherwise
s/broccoli/brah-coli/gI #comes out with the accent on the second syllable rather than the first
s/beta/bayta/gI #comes out as "beeta" otherwise
s/geyser/guyser/gI #comes out as "gee-sur" otherwise
s/gizmo/ghizmo/gI #comes out as "gizz-mo" otherwise
s/cliched/cliche'd/gI #' #comes out as writen
s/retiree/retire-ee/gI #comes out as "retire" otherwise
s/nerfed/nerf'd/gI #' #comes out as ner-fed otherwise
s/[Pp]wn/pohn/g

#misc. punctuation and annoyances
#/\.\"/\. endquote./g
#s/\"/quote /g
s/|/, /g
s/^Advertisement//g
s/(pdf)//gI
