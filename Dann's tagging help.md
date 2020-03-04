# <line>(([A-Z+])*(&apos;S)?(.)(\()?(([A-Za-z]+))?)(\))?(.)?(\()?(([A-Za-z]?))?(.) (([A-Za-z]?))?(.)(([A-Za-z]?))?(\))?</line>
Title

Text

used for the speaker 
<line>(([A-Z+])*(&apos;S)?(.)(\()?(([A-Za-z]+))?)(.)?(\()?(([A-Za-z]?))(\))?</line>


**With Dann

Stage 
\(.*|)
dot matches all

replace with 
<stage>\0</stage>


highlight all lines
^.+$
<l>\0</l>

tag the speakers
<l>([A-Z }+)</l>  don't forget the space after Z

<speaker>\1</speaker>

Detecting the stage after the line
<l> (\(.*?\))</l>
<stage>\l</stage>

How to speech element
(<speaker>.*?)\n\n\n
<sp>\1</sp>\n**