--Esconde a barra de status
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

 --Imagem de fundo e posições x e y
    bg = display.newImage( "images/questao04/background-menu.jpg" )
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/2
    group:insert(bg)

    simbol = display.newImage( "images/questao04/interrogacao.png" )
    simbol.x = display.contentWidth/2
    simbol.y = display.contentHeight/2
    simbol.xScale = 0.15
    simbol.yScale = 0.15
    group:insert(simbol)

    logoquest = display.newImage( "images/questao04/logo-quest.png" )
    logoquest.x = display.contentWidth/2
    logoquest.y = display.contentHeight/2 - 180
    logoquest.alpha = -1
    group:insert(logoquest)

    function showon( )
        transition.to(logoquest, {time = 2000, alpha = 1, onComplete = showoff}) 
    end
    

    function showoff( )
        transition.to(logoquest, {time = 1900, alpha = -1, onComplete = sair}) 
        simbol.alpha = -1
    end


    function sair( )

        display.remove( bg )
        display.remove( simbol )
        display.remove( logoquest )
        transition.cancel( logoquest )
        storyboard.gotoScene("questao04")
        
    end
    showon()

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

end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene