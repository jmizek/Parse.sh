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

#abbreviations
s/vs\.\?/versus/g
s/\([0-9]\+\)-\([0-9]\+\)/\1 to \2/g
s/no\. \([0-9]\+\)/number \1/gI
s/\(\W\)Co\./\1Company/g
s/WWI\(\W\)/WW1\1/g
s/WW\(II\|1\|2\)/World War \1/g

#technology
s/LAN/lan/g
s/WAN/wan/g
s/NET/net/g
s/RAM/ram/g
s/DDoS/DDOS/g
s/GHz/ giga hertz/gI
s/MHz/ mega hertz/gI
s/GBps/ gigabytes per second/g
s/Gbps/ gigabits per second/g
s/MBps/ megabytes per second/g
s/Mbps/ megabits per second/g
s/kBps/ kilobytes per second/g
s/kbps/ kilobits per second/g
s/\([0-9]\| \)MB\(\W\)/\1megabytes\2/g
s/SD card/S-D card/g #without this, SD gets turned to South Dakota

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

#replace dollar amounts when used as an adjective
# eg. "The $35 model entered the manufacturing stage" should be
#     "The 35 dollar model entered the manufacturing stage"
# not "The 35 dollars model entered the manufacturing stage"
# This is an ugly kludge, but it ought to provide better results.
# I have my doubts as to whether this can be done accurately using
# an empirical method.
s/\(a\|the\) \$\([0-9]*\)\(\.\)\?\([0-9]*\) \(tr\|b\|m\)illion/\1 \2\3\4 \5illion dollar/gI
s/\(a\|the\) \$\([0-9]*\),000/\1 \2 thousand dollar/gI
s/\(a\|the\) \$\([0-9]*\)\( \|\.\|?\)/\1 \2 dollar\3/gI
#replace dollar amounts in typical fashion
s/\$\([0-9]*\)\(\.\)\?\([0-9]*\) \(tr\|b\|m\)illion/\1\2\3 \4illion dollars/g
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
s/PST/Pacific Standard Time/g
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
s/\(\W\)DHS\(\W\)/\1Department of Homeland Security\2/g
s/\(\W\)OIG\(\W\)/\1Office of the Inspector General\2/g
s/\(\W\)OMB\(\W\)/\1Office of Management and Budget\2/g

s/U\.S\./US/g
s/ZIP code/zip code/g #especially useful for voices which say 'z' as 'zed'

#other names
s/AT\&T/eighty-entee/g

#starcraft
s/archon/arkon/gI
s/protoss/protawss/gI

#basic mispronounced words
s/\(\W\)eke\(s\|d\)*\(\W\)/\1eeke\2\3/g #comes out as "eck" otherwise
s/caucuse\(s\|d\)\(\W\)/caucus\'\1\2/gI #does not interpret suffixes correctly
s/sushi/sooshee/gI #comes out as "suh-shee" otherwise
s/penchant/pen-chant/gI #comes out as "pawnshawnt" otherwise
s/reissu\(e\|es\|ed\|ing\)\(\W\)/re-issu\1\2/gI #interprets ei as a diagraph otherwise
s/patent/paghtent/gI #comes out as "pay-tent" otherwise
s/broccoli/brah-coli/gI #comes out with the accent on the second syllable rather than the first

#misc. punctuation and annoyances
#/\.\"/\. endquote./g
#s/\"/quote /g
s/|/, /g
s/^Advertisement//g
