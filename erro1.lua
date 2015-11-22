--Esconde a barra de status
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

 --Imagem de fundo e posições x e y
    bg1 = display.newImage( "images/errou/background-menu.jpg" )
    bg1.x = display.contentWidth/2
    bg1.y = display.contentHeight/2
    group:insert(bg1)

    bg = audio.loadStream( "sounds/erro/errou.mp3" )
    audio.play( bg, { channel = 1 } )

    dislike = display.newImage( "images/errou/dislike.png" )
    dislike.x = display.contentWidth/2
    dislike.y = display.contentHeight/2
    dislike.xScale = 0.25
    dislike.yScale = 0.25
    group:insert(dislike)

    logo1 = display.newImage( "images/errou/errou.png" )
    logo1.x = display.contentWidth/2
    logo1.y = display.contentHeight/2 - 180
    logo1.xScale = 1.1
    logo1.yScale = 1.1
    logo1.alpha = -1
    group:insert(logo1)

    function showon( )
    	transition.to(logo1, {time = 2000, alpha = 1, onComplete = showoff}) 
    end
    

    function showoff( )
    	transition.to(logo1, {time = 1900, alpha = -1, onComplete = fim}) 
        dislike.alpha = -1
    end

    showon()


    function fim( )

        display.remove( bg1 )
        display.remove( dislike )
        display.remove( logo1 )

        transition.cancel( logo1 )

        storyboard.gotoScene("over_questao01", {effect = "slideDown"} )
    end

end
-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

-- Função enterScene do storyboard que irá ativar o objeto iniciar
function scene:enterScene( event )

end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto iniciar e parar o audio
function scene:exitScene( event )

    audio.stop(1)

    --[[storyboard.removeScene("questao01")
    storyboard.removeScene("apresentacao")
    storyboard.removeScene("over_questao01")
    storyboard.removeScene("menu")
    storyboard.removeScene("1quest")]]

end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene