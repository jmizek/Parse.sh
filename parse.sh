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
s/Super\( \)\?PAC\(s\)\?\(\W\)/super pac\2\3/gI

#abbreviations
s/vs\./versus/g
s/vs/versus/g
s/\([0-9]\+\)-\([0-9]\+\)/\1 to \2/g
s/no\. \([0-9]\+\)/number \1/gI
s/LAN/lan/g
s/WAN/wan/g
s/GHz/ giga hertz/g
s/MHz/ mega hertz/g
s/GBps/ gigabytes per second/g
s/Gbps/ gigabits per second/g
s/MBps/ megabytes per second/g
s/Mbps/ megabits per second/g
s/kBps/ kilobytes per second/g
s/kbps/ kilobits per second/g
s/WWI\(\W\)/WW1\1/g
s/WW\(II\|1\|2\)/World War \1/g

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

#replace dollar amounts
s/\$\([0-9]*\) trillion/\1 trillion dollars/g
s/\$\([0-9]*\) billion/\1 billion dollars/g
s/\$\([0-9]*\) million/\1 million dollars/g
s/\$\([0-9]*\),000/\1 thousand dollars/g
s/\$\([0-9]*\)\( \|\.\|?\)/\1 dollars\2/g

#months of the year
s/Jan\./January/g
s/Feb\./February/g
s/Mar\./March/g
s/Apr\./April/g
s/Jun\./June/g
s/Jul\./July/g
s/Aug\./August/g
s/Sept\./September/g
s/Oct\./October/g
s/Nov\./November/g
s/Dec\./December/g

#dates
s/\(January\|February\|March\|April\|May\|June\|July\|August\|September\|October\|November\|December\) \([0-9]\{1,2\}\)\(\W\)/\1 \2th\3/g
s/ \(2\|3\)*1th/ \11st/g
s/ \(2\|3\)*2th/ \12nd/g
s/ \(2\)*3th/ \13rd/g

#time zones
s/EST/Eastern Standard Time/g
s/\(\W\)ET$/\1Eastern Time/g
s/CST/Central Standard Time/g
s/KST/Korean Standard Time/g

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

#state postal abbreviations
s/\(\W\)AL\(\W\)/\1alabama\2/g
s/\(\W\)AK\(\W\)/\1alaska\2/g
s/\(\W\)AZ\(\W\)/\1arizona\2/g
s/\(\W\)AR\(\W\)/\1arkansas\2/g
s/\(\W\)CA\(\W\)/\1california\2/g
s/\(\W\)CO\(\W\)/\1colorado\2/g
s/\(\W\)CT\(\W\)/\1connecticut\2/g
s/\(\W\)DE\(\W\)/\1delaware\2/g
s/\(\W\)FL\(\W\)/\1florida\2/g
s/\(\W\)GA\(\W\)/\1georgia\2/g
s/\(\W\)HI\(\W\)/\1hawaii\2/g
s/\(\W\)ID\(\W\)/\1idaho\2/g
s/\(\W\)IL\(\W\)/\1illinois\2/g
s/\(\W\)IN\(\W\)/\1indiana\2/g
s/\(\W\)IA\(\W\)/\1iowa\2/g
s/\(\W\)KS\(\W\)/\1kansas\2/g
s/\(\W\)KY\(\W\)/\1kentucky\2/g
s/\(\W\)LA\(\W\)/\1louisiana\2/g
s/\(\W\)ME\(\W\)/\1maine\2/g
s/\(\W\)MD\(\W\)/\1maryland\2/g
s/\(\W\)MA\(\W\)/\1massachusetts\2/g
s/\(\W\)MI\(\W\)/\1michigan\2/g
s/\(\W\)MN\(\W\)/\1minnesota\2/g
s/\(\W\)MS\(\W\)/\1mississippi\2/g
s/\(\W\)MO\(\W\)/\1missouri\2/g
s/\(\W\)MT\(\W\)/\1montana\2/g
s/\(\W\)NE\(\W\)/\1nebraska\2/g
s/\(\W\)NV\(\W\)/\1nevada\2/g
s/\(\W\)NH\(\W\)/\1new hampshire\2/g
s/\(\W\)NJ\(\W\)/\1new jersey\2/g
s/\(\W\)NM\(\W\)/\1newmexico\2/g
s/\(\W\)NY\(\W\)/\1newyork\2/g
s/\(\W\)NC\(\W\)/\1north carolina\2/g
s/\(\W\)ND\(\W\)/\1north dakota\2/g
s/\(\W\)OH\(\W\)/\1ohio\2/g
#s/\(\W\)OK\(\W\)/\1oklahoma\2/g #interfieres with OK i.e. "alright"
s/\(\W\)OR\(\W\)/\1oregon\2/g
s/\(\W\)PA\(\W\)/\1pennsylvania\2/g
s/\(\W\)RI\(\W\)/\1rhode island\2/g
s/\(\W\)SC\(\W\)/\1south carolina\2/g
s/\(\W\)SD\(\W\)/\1south dakota\2/g
s/\(\W\)TN\(\W\)/\1tennessee\2/g
s/\(\W\)TX\(\W\)/\1texas\2/g
s/\(\W\)UT\(\W\)/\1utah\2/g
s/\(\W\)VT\(\W\)/\1vermont\2/g
s/\(\W\)VA\(\W\)/\1virginia\2/g
s/\(\W\)WA\(\W\)/\1washington\2/g
s/\(\W\)WV\(\W\)/\1west virginia\2/g
s/\(\W\)WI\(\W\)/\1wisconsin\2/g
s/\(\W\)WY\(\W\)/\1wyoming\2/g

#US government affiliated abbreviations
s/R-/Republican of /g
s/D-/Democrat of /g
s/SCOTUS/US Supreme Court/g
s/POTUS/President of the US/g
s/\(\W\)DOD\(\W\)/\1Department of Defense\2/gI
s/\(\W\)DOJ\(\W\)/\1Department of Justice\2/gI
s/U\.S\./US/g

#other names
s/AT\&T/eighty-entee/g
s/NET/net/g
s/ZIP code/zip code/g #useful for voices which say 'z' as 'zed'
s/DDoS/DDOS/g

#starcraft
s/archon/arkon/gI
s/protoss/protawss/gI

#basic mispronounced words
s/\(\W\)eke\(s\|d\)*\(\W\)/\1eeke\2\3/g
s/\(\W\)caucuse\(s\|d\)\(\W\)/\1caucus\'\2\3/gI
s/sushi/sooshee/gI
s/penchant/pen-chant/gI

#misc. punctuation and annoyances
#/\.\"/\. endquote./g
#s/\"/quote /g
s/|/, /g
s/^Advertisement//g
