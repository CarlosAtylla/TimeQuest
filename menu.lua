--Esconde a barra de status
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

    --Imagem de fundo e posições x e y
    local bg = display.newImage( "images/menu/background-menu.jpg" )
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/2
    group:insert(bg)

    --Som do jogo
    bg = audio.loadStream( "sounds/menu/background.mp3" )
    audio.play( bg, { channel = 1, loops = -1 } )

    --Sons do toque
    som = audio.loadStream( "sounds/menu/toque.wav" )
    som1 = audio.loadStream( "sounds/menu/toque.wav" )
    som2 = audio.loadStream( "sounds/menu/toque.wav" )
    som3 = audio.loadStream( "sounds/menu/toque.wav" )

    touch = audio.loadStream( "sounds/menu/toque.wav" )

    --Imagem logo, posições xy e imagem transparente
    logo = display.newImage( "images/menu/logo.png" )
    logo.x = display.contentWidth/2
    logo.y = display.contentHeight/2 - 180
    logo.alpha = -1
    group:insert(logo)

    --Imagem iniciar, posições xy e imagem transparente
    iniciar = display.newImage( "images/menu/iniciar.png" )
    iniciar.x = display.contentWidth/2
    iniciar.y = display.contentHeight/2 
    iniciar.alpha = -1
    group:insert(iniciar)

    --Imagem instruções, posições xy e imagem transparente
    instrucoes = display.newImage( "images/menu/instrucoes.png" )
    instrucoes.x = display.contentWidth/2
    instrucoes.y = display.contentHeight/2 + 75
    instrucoes.alpha = -1
    group:insert(instrucoes)

    --Imagem creditos, posições xy e imagem transparente
    creditos = display.newImage( "images/menu/creditos.png" )
    creditos.x = display.contentWidth/2
    creditos.y = display.contentHeight/2 + 150
    creditos.alpha = -1
    group:insert(creditos)

    --Imagens de interrogação, posições xy e tamanhos
    question = display.newImage( "images/menu/interrogacao.png" )
    question.x = display.contentWidth/2 
    question.y = display.contentHeight/2 - 180
    question.xScale = 0.12
    question.yScale = 0.12
    group:insert(question)

    question1 = display.newImage( "images/menu/interrogacao.png" )
    question1.x = display.contentWidth/2 
    question1.y = display.contentHeight/2 
    question1.xScale = 0.09
    question1.yScale = 0.09
    group:insert(question1)

    question2 = display.newImage( "images/menu/interrogacao.png" )
    question2.x = display.contentWidth/2 
    question2.y = display.contentHeight/2 + 75
    question2.xScale = 0.09
    question2.yScale = 0.09
    group:insert(question2)

    question3 = display.newImage( "images/menu/interrogacao.png" )
    question3.x = display.contentWidth/2 
    question3.y = display.contentHeight/2 + 150
    question3.xScale = 0.09
    question3.yScale = 0.09
    group:insert(question3)
    
    --Imagens dedo, posições xy, tamanhos e dedos transparentes
    dedo = display.newImage( "images/menu/dedo.png" )
    dedo.x = display.contentWidth/2
    dedo.y = display.contentHeight/2 - 150
    dedo.xScale = 0.15
    dedo.yScale = 0.15
    dedo.alpha = - 1
    group:insert(dedo)

    dedo1 = display.newImage( "images/menu/dedo.png" )
    dedo1.x = display.contentWidth/2
    dedo1.y = display.contentHeight/2 + 40
    dedo1.xScale = 0.15
    dedo1.yScale = 0.15
    dedo1.alpha = - 1
    group:insert(dedo1)

    dedo2 = display.newImage( "images/menu/dedo.png" )
    dedo2.x = display.contentWidth/2
    dedo2.y = display.contentHeight/2 + 120
    dedo2.xScale = 0.15
    dedo2.yScale = 0.15
    dedo2.alpha = - 1
    group:insert(dedo2)

    dedo3 = display.newImage( "images/menu/dedo.png" )
    dedo3.x = display.contentWidth/2
    dedo3.y = display.contentHeight/2 + 180
    dedo3.xScale = 0.15
    dedo3.yScale = 0.15 
    dedo3.alpha = - 1
    group:insert(dedo3)

    --Funções de efeitos de transições
    function showDedo()
        transition.to(dedo, {time = 1500, alpha = 1, onComplete = dedoOff })
    end

    function dedoOff( )
    	dedo.alpha = -1
    	question.alpha = -1
    	audio.play( som )
    	transition.to(logo, {time = 500, alpha = 1, onComplete = showDedo1 })
    end

    function showDedo1( )
    	audio.stop( 2 )
    	transition.to(dedo1, {time = 500, alpha = 1, onComplete = dedoOff1})
    end

    function dedoOff1( )
    	dedo1.alpha = -1
    	question1.alpha = -1
    	audio.play( som1 )
    	transition.to(iniciar, {time = 500, alpha = 1, onComplete = showDedo2 })
    end

    function showDedo2( )
    	audio.stop( 3 )
    	transition.to(dedo2, {time = 500, alpha = 1, onComplete = dedoOff2})
    end

    function dedoOff2( )
    	dedo2.alpha = -1
    	question2.alpha = -1
    	audio.play( som2 )
    	transition.to(instrucoes, {time = 500, alpha = 1, onComplete = showDedo3 })
    end

    function showDedo3( )
    	audio.stop( 4 )
    	transition.to(dedo3, {time = 500, alpha = 1, onComplete = dedoOff3})
    end

    function dedoOff3( )
    	dedo3.alpha = -1
    	question3.alpha = -1
    	audio.play( som3 )
    	transition.to(creditos, {time = 500, alpha = 1 })
    end
    showDedo()

end
-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

-- Função que redirecionará para a tela do jogo 
function startGame()

     audio.play(touch)

     
     display.remove(logo)
     display.remove(instrucoes)
     display.remove(creditos)
     display.remove(question)
     display.remove(question1)
     display.remove(question2)
     display.remove(question3)
     display.remove(dedo)
     display.remove(dedo1)
     display.remove(dedo2)
     display.remove(dedo3)

     transition.cancel(dedo)
     transition.cancel(logo)
     transition.cancel(dedo1)
     transition.cancel(dedo2)
     transition.cancel(dedo3)
     transition.cancel(instrucoes)
     transition.cancel(creditos)

     transition.to(iniciar, {time = 900, alpha = -1, onComplete = fim})  

end

function inst()

     audio.play(touch)
     iniciar.alpha = -1

     
     display.remove(logo)
     display.remove(instrucoes)     
     display.remove(creditos)
     display.remove(question)
     display.remove(question1)
     display.remove(question2)
     display.remove(question3)
     display.remove(dedo)
     display.remove(dedo1)
     display.remove(dedo2)
     display.remove(dedo3)

     transition.cancel(dedo)
     transition.cancel(logo)
     transition.cancel(dedo1)
     transition.cancel(dedo2)
     transition.cancel(dedo3)
     transition.cancel(instrucoes)
     transition.cancel(creditos)

     transition.to(instrucoes, {time = 900, alpha = -1, onComplete = fim1})  

end

function credit()

     audio.play(touch)
     iniciar.alpha = -1
     instrucoes.alpha = -1

     
     display.remove(logo)
     display.remove(instrucoes)     
     display.remove(creditos)
     display.remove(question)
     display.remove(question1)
     display.remove(question2)
     display.remove(question3)
     display.remove(dedo)
     display.remove(dedo1)
     display.remove(dedo2)
     display.remove(dedo3)

     transition.cancel(dedo)
     transition.cancel(logo)
     transition.cancel(dedo1)
     transition.cancel(dedo2)
     transition.cancel(dedo3)
     transition.cancel(instrucoes)
     transition.cancel(creditos)

     transition.to(instrucoes, {time = 900, alpha = -1, onComplete = fim2})  

end

function fim( )

    audio.stop( 1 )
    audio.stop( 2 )
    audio.stop( 3 )
    audio.stop( 4 )
    audio.stop( 5 )
    audio.stop( bg )
    audio.stop( som )
    audio.stop( som1 )
    audio.stop( som2 )
    audio.stop( som3 )
    storyboard.gotoScene("1quest", "crossFade", 1000) 

end

function fim1( )

    
    audio.stop( 1 )
    audio.stop( 2 )
    audio.stop( 3 )
    audio.stop( 4 )
    audio.stop( 5 )
    audio.stop( bg )
    audio.stop( som )
    audio.stop( som1 )
    audio.stop( som2 )
    audio.stop( som3 )
    storyboard.gotoScene("instrucoes", "crossFade", 1000) 

end

function fim2( )

    
    audio.stop( 1 )
    audio.stop( 2 )
    audio.stop( 3 )
    audio.stop( 4 )
    audio.stop( 5 )
    audio.stop( bg )
    audio.stop( som )
    audio.stop( som1 )
    audio.stop( som2 )
    audio.stop( som3 )
    storyboard.gotoScene("creditos", "crossFade", 1000) 

end


-- Função enterScene do storyboard que irá ativar o objeto iniciar
function scene:enterScene( event )

    iniciar:addEventListener("tap",startGame)

    instrucoes:addEventListener( "tap", inst )

    creditos:addEventListener( "tap", credit )

end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto iniciar e parar o audio
function scene:exitScene( event )
    
    iniciar:removeEventListener("tap", startGame)

    audio.stop( 1 )
    audio.stop( 2 )
    audio.stop( 3 )
    audio.stop( 4 )
    audio.stop( 5 )
    audio.stop( bg )
    audio.stop( som )
    audio.stop( som1 )
    audio.stop( som2 )
    audio.stop( som3 )

end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene