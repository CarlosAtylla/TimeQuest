--Esconde a barra de status
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

 --Imagem de fundo e posições x e y
    bg = display.newImage( "images/creditos/background-menu.jpg" )
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/2
    group:insert(bg)

    bg = audio.loadStream( "sounds/creditos/cred.mp3" )
    audio.play( bg, { channel = 1, loops = -1 } )

    simbol = display.newImage( "images/creditos/inst.png" )
    simbol.x = display.contentWidth/2
    simbol.y = display.contentHeight/2 - 10
    
    group:insert(simbol)

    logoquest = display.newImage( "images/creditos/logo.png" )
    logoquest.x = display.contentWidth/2
    logoquest.y = display.contentHeight/2 - 200
    group:insert(logoquest)

    menu = display.newImage( "images/creditos/menu.png" )
    menu.x = display.contentWidth/2
    menu.y = display.contentHeight/2 + 150
    menu.xScale = 0.8
    menu.yScale = 0.8
    group:insert(menu)

    nome = display.newImage( "images/creditos/nome.png" )
    nome.x = display.contentWidth/2 
    nome.y = display.contentHeight/2 + 220
    group:insert(nome)

end
-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

function voltar()

     menu:removeEventListener("tap",voltar)

    audio.stop(bg)

    audio.stop( 1 )

    storyboard.removeScene("apresentacao")
    
    storyboard.removeScene("menu")

    storyboard.removeScene("instrucoes")

    --storyboard.removeScene("creditos")

    storyboard.removeScene("questao01")
    
    storyboard.removeScene("over_questao01")
    
    storyboard.removeScene("1quest")
    
    storyboard.removeScene("erro1")

    storyboard.gotoScene("menu", "crossFade", 1000) 

end

-- Função enterScene do storyboard que irá ativar o objeto iniciar
function scene:enterScene( event )

     menu:addEventListener("tap",voltar)

end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto iniciar e parar o audio
function scene:exitScene( event )

    audio.stop( bg )

    menu:removeEventListener("tap",voltar)

    audio.stop(bg)

    audio.stop( 1 )

    storyboard.removeScene("apresentacao")
    
    storyboard.removeScene("menu")

    storyboard.removeScene("instrucoes")

    --storyboard.removeScene("creditos")

    storyboard.removeScene("questao01")
    
    storyboard.removeScene("over_questao01")
    
    storyboard.removeScene("1quest")
    
    storyboard.removeScene("erro1")
    

    storyboard.removeScene("terminou")
end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene