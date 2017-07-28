-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local tapCount = 0

local background = display.newImageRect( "background.png", 660, 1000 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )

local platform = display.newImageRect( "platform.png", 660, 100 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect( "balloon.png", 152, 152 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.9

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=75, bounce=0.5 } )

local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
	tapCount = tapCount + 1
	tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )
