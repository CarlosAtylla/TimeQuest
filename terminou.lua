--Esconde a barra de status
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

    bg = display.newImage( "images/terminou/background-menu.jpg" )
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/2
    group:insert(bg)

    ok = audio.loadStream( "sounds/acerto/vitoria.mp3" )
    audio.play( ok, { channel = 1 } )

    logo = display.newImage( "images/terminou/parabens.png" )
    logo.x = display.contentWidth/2 - 5
    logo.y = display.contentHeight/2 - 200
    group:insert(logo)

    loser = display.newImage( "images/terminou/trofeu.png" )
    loser.x = display.contentWidth/2
    loser.y = display.contentHeight/2 + 40

    loser.xScale = 0.15
    loser.yScale = 0.15
    loser.alpha = -1
    group:insert(loser)  

    acertos = display.newImage( "images/terminou/acertou.png" )
    acertos.x = display.contentWidth/2 + 1
    acertos.y = display.contentHeight/2 - 120
    group:insert(acertos)

    --[[menu = display.newImage( "images/terminou/menu.png" )
    menu.x = display.contentWidth/2
    menu.y = display.contentHeight/2 + 210
    menu.xScale = 0.8
    menu.yScale = 0.8
    group:insert(menu)]]

    function showloser()
        transition.to( loser, {alpha = 1, time = 3000} )
    end

    showloser()

  end

-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

--[[function voltamenu() 

    storyboard.gotoScene("menu", "crossFade", 1000)
    menu:removeEventListener( "tap", voltamenu )
    display.remove( bg )
    display.remove( logo )
    display.remove( loser )
    display.remove( acertos )
    display.remove( menu )

    transition.cancel( loser )

end]]

-- Função enterScene do storyboard que irá ativar o objeto iniciar
function scene:enterScene( event )

    --menu:addEventListener( "tap", voltamenu )

end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto iniciar e parar o audio
function scene:exitScene( event )  

    audio.stop(1)  

    menu:removeEventListener( "tap", voltamenu )
    display.remove( bg )
    display.remove( logo )
    display.remove( loser )
    display.remove( acertos )
    --display.remove( menu )

    transition.cancel( loser )

    --[[storyboard.removeScene("menu")
    storyboard.removeScene("apresentacao")
    storyboard.removeScene("questao01")
    storyboard.removeScene("over_questao01")
    storyboard.removeScene("1quest")
    storyboard.removeScene("erro1")]]



end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene