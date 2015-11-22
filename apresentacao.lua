--Esconde a barra de status
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

    --Imagem de fundo, e posições x e y
    local bg = display.newImage( "images/apresentacao/background-menu.jpg" )
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/2
    group:insert(bg)

    --Som do tempo
    som = audio.loadStream( "sounds/apresentacao/ticktac.mp3" )

    --Imagem Cronometro, posiões xy e tamanho inicial do cronometro 
    crono = display.newImage( "images/apresentacao/cronometro.png" )
    crono.x = display.contentWidth/2 + 15
    crono.y = display.contentHeight/2 - 20
    crono.xScale = 0.001
    crono.yScale = 0.001
    group:insert(crono)

    --Função de zoom para o cronometro e comando para tocar o audio
    function zoomCrono()
        audio.play( som )
        transition.to(crono, {time = 5000, xScale = 0.3, yScale = 0.3, onComplete = fim })
    end

    --Função que encerra apresentação e para o audio
    function fim( )
    	audio.stop( 1 )
    	transition.to(crono, {time = 2000, alpha = -1, onComplete = sair })

    end

    function sair( )
    	storyboard.gotoScene("menu", "crossFade", 1000)
    end
    zoomCrono()

end
-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

-- Função enterScene do storyboard que irá executar o som de fundo do jogo e ativará o objeto playbutton
function scene:enterScene( event )
	
end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto playbutton e parar o audio
function scene:exitScene( event )

    display.remove( bg )
    display.remove( crono )

    transition.cancel( crono )

	audio.stop( 1 )

    --storyboard.removeScene("apresentacao")
    storyboard.removeScene("menu")
    storyboard.removeScene("instrucoes")
    storyboard.removeScene("creditos")
    storyboard.removeScene("questao01")
    storyboard.removeScene("questao02")
    storyboard.removeScene("questao03")
    storyboard.removeScene("questao04")
    storyboard.removeScene("questao05")
    storyboard.removeScene("questao06")
    storyboard.removeScene("questao07")
    storyboard.removeScene("questao08")
    storyboard.removeScene("questao09")
    storyboard.removeScene("questao10")
    storyboard.removeScene("over_questao01")
    storyboard.removeScene("over_questao02")
    storyboard.removeScene("over_questao03")
    storyboard.removeScene("over_questao04")
    storyboard.removeScene("over_questao05")
    storyboard.removeScene("over_questao06")
    storyboard.removeScene("over_questao07")
    storyboard.removeScene("over_questao08")
    storyboard.removeScene("over_questao09")
    storyboard.removeScene("over_questao10")
    storyboard.removeScene("1quest")
    storyboard.removeScene("2quest")
    storyboard.removeScene("3quest")
    storyboard.removeScene("4quest")
    storyboard.removeScene("5quest")
    storyboard.removeScene("6quest")
    storyboard.removeScene("7quest")
    storyboard.removeScene("8quest")
    storyboard.removeScene("9quest")
    storyboard.removeScene("10quest")
    storyboard.removeScene("erro1")
    storyboard.removeScene("erro2")
    storyboard.removeScene("erro3")
    storyboard.removeScene("erro4")
    storyboard.removeScene("erro5")
    storyboard.removeScene("erro6")
    storyboard.removeScene("erro7")
    storyboard.removeScene("erro8")
    storyboard.removeScene("erro9")
    storyboard.removeScene("erro10")
    storyboard.removeScene("terminou")
end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene