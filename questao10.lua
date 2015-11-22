
-- Esconde a barra de status e define as posições X e Y das telas do jogo
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

        bg = display.newImage( "images/questao10/background-menu.jpg" )
        bg.x = display.contentWidth/2
        bg.y = display.contentHeight/2
        group:insert(bg)

        bg = audio.loadStream( "sounds/questoes/music10.mp3" )
        audio.play( bg, { channel = 1, loops = -1 } )

        ok = audio.loadStream( "sounds/acerto/acertou.mp3" )
        audio.play( ok, { channel = 1 } )

        som1 = audio.loadStream( "sounds/menu/toque.wav" )
        som2 = audio.loadStream( "sounds/menu/toque.wav" )
        som3 = audio.loadStream( "sounds/menu/toque.wav" )
        som4 = audio.loadStream( "sounds/menu/toque.wav" )

        quest = display.newImage( "images/questao10/desafio.png" )
        quest.x = display.contentWidth/2 + 10
        quest.y = display.contentHeight/2 - 130
        quest.xScale = 0.9
        quest.yScale = 0.9
        group:insert(quest)

        desafio = display.newImage( "images/questao10/question.png" )
        desafio.x = display.contentWidth/2 + 2
        desafio.y = display.contentHeight/2 - 20
        group:insert(desafio)

        questa = display.newImage( "images/questao10/a.png" )
        questa.x = display.contentWidth/2 - 100
        questa.y = display.contentHeight/2 + 80
        group:insert(questa)


        questb = display.newImage( "images/questao10/b.png" )
        questb.x = display.contentWidth/2 - 100
        questb.y = display.contentHeight/2 + 180
        group:insert(questb)


        questc = display.newImage( "images/questao10/c.png" )
        questc.x = display.contentWidth/2 + 100
        questc.y = display.contentHeight/2 + 80
        group:insert(questc)


        questd = display.newImage( "images/questao10/d.png" )
        questd.x = display.contentWidth/2 + 100
        questd.y = display.contentHeight/2 + 180
        group:insert(questd)


        --Adiciona o cronômetro
        local tempo = display.newText( "15", 0, 0, "Marker Felt", 70 )   
        tempo.x = display.contentWidth/2
        tempo.y = 40
        tempo:setTextColor( 1, 0, 0 )
        group:insert(tempo)

        local number = 15
        local modf = math.modf

        function timerDown()
            number = number - 1
            local start_seconds = number

            local start_minutes = modf(start_seconds/60)
            local seconds       = start_seconds - start_minutes*60

            local start_hours = modf(start_minutes/60)
            local minutes     = start_minutes - start_hours*60

            local min = minutes < 15 and (minutes) or minutes
            local sec = seconds < 15 and (seconds) or seconds

            tempo.text = sec

            if(number == 0)then

                clock = audio.loadStream( "sounds/clock/timeup.mp3" )
                audio.play( clock )

                audio.stop( 1 )

                questa:removeEventListener( "tap", quest01 )

                questb:removeEventListener( "tap", quest02 )

                questc:removeEventListener( "tap", quest03 )

                questd:removeEventListener( "tap", quest04 )


                --Imagem de fundo, e posições x e y
                bg2 = display.newImage( "images/timeover/background-menu.jpg" )
                bg2.x = display.contentWidth/2
                bg2.y = display.contentHeight/2
                group:insert(bg2)

                --Imagem Cronometro, posiões xy e tamanho inicial do cronometro 
                crono = display.newImage( "images/timeover/cronometro.png" )
                crono.x = display.contentWidth/2 + 10
                crono.y = display.contentHeight/2 + 10
                crono.xScale = 0.3
                crono.yScale = 0.3
                group:insert(crono)

                over = display.newImage( "images/timeover/over.png" )
                over.x = display.contentWidth/2
                over.y = display.contentHeight/2 - 190

              function showon1( )
                  transition.to(over, {time = 2500, alpha = 1, onComplete = showoff1}) 
              end
    

              function showoff1( )
                  transition.to(over, {time = 1900, alpha = -1, onComplete = fim1}) 
                  crono.alpha = -1
              end

              showon1()


              function fim1()

                  audio.stop(1)

                  questa:removeEventListener( "tap", quest01 )

                  questb:removeEventListener( "tap", quest02 )

                  questc:removeEventListener( "tap", quest03 )

                  questd:removeEventListener( "tap", quest04 )

                  --display.remove( bg )
                  display.remove( quest )
                  display.remove( desafio )
                  display.remove( questa )
                  display.remove( questb )
                  display.remove( questc )
                  display.remove( questd )
                  display.remove( tempo )
                  display.remove( bg2 )
                  display.remove( crono )
                  display.remove( over )
                  display.remove( bg1 )
                  display.remove( like1 )
                  display.remove( logo1 )

                  transition.cancel( over )
                  transition.cancel( logo1 )

                  timer.cancel( timerDown )

                  audio.stop(1)

                  storyboard.gotoScene("over_questao10", {effect = "slideUp"})

              end

            end

        end

        timerDown = timer.performWithDelay(1000, timerDown, number)

    function quest01( )

        audio.play(som1)

        audio.play(ok)

        audio.stop(1)
        
        --Imagem de fundo e posições x e y
        bg1 = display.newImage( "images/acertou/background-menu.jpg" )
        bg1.x = display.contentWidth/2
        bg1.y = display.contentHeight/2
        group:insert(bg1)

        like1 = display.newImage( "images/acertou/like.png" )
        like1.x = display.contentWidth/2
        like1.y = display.contentHeight/2
        like1.xScale = 0.25
        like1.yScale = 0.25
        group:insert(like1)

        logo1 = display.newImage( "images/acertou/acertou.png" )
        logo1.x = display.contentWidth/2
        logo1.y = display.contentHeight/2 - 180
        logo1.xScale = 1.1
        logo1.yScale = 1.1
        logo1.alpha = -1
        group:insert(logo1)

        function showon( )

            questa:removeEventListener( "tap", quest01 )

            questb:removeEventListener( "tap", quest02 )

            questc:removeEventListener( "tap", quest03 )

            questd:removeEventListener( "tap", quest04 )

            timer.cancel( timerDown )

            transition.to(logo1, {time = 2000, alpha = 1, onComplete = showoff}) 

        end
    

        function showoff( )

            questa:removeEventListener( "tap", quest01 )

            questb:removeEventListener( "tap", quest02 )

            questc:removeEventListener( "tap", quest03 )

            questd:removeEventListener( "tap", quest04 )

            timer.cancel( timerDown )

            transition.to(logo1, {time = 1900, alpha = -1, onComplete = fim}) 

            like1.alpha = -1

        end

        showon()


        function fim()

            audio.stop(1)

            questa:removeEventListener( "tap", quest01 )

            questb:removeEventListener( "tap", quest02 )

            questc:removeEventListener( "tap", quest03 )

            questd:removeEventListener( "tap", quest04 )

            --display.remove( bg )
            display.remove( quest )
            display.remove( desafio )
            display.remove( questa )
            display.remove( questb )
            display.remove( questc )
            display.remove( questd )
            display.remove( tempo )
            display.remove( bg2 )
            display.remove( crono )
            display.remove( over )
            display.remove( bg1 )
            display.remove( like1 )
            display.remove( logo1 )

            transition.cancel( over )
            transition.cancel( logo1 )

            timer.cancel( timerDown )

            audio.stop(1)

            storyboard.gotoScene("terminou", {effect = "slideLeft"})

        end

    end

end

-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

function quest02( )

     audio.play(som2)

     audio.stop(1)

     questa:removeEventListener( "tap", quest01 )

     questb:removeEventListener( "tap", quest02 )

     questc:removeEventListener( "tap", quest03 )

     questd:removeEventListener( "tap", quest04 )

     --display.remove( bg )
     display.remove( quest )
     display.remove( desafio )
     display.remove( questa )
     display.remove( questb )
     display.remove( questc )
     display.remove( questd )
     display.remove( tempo )
     display.remove( bg2 )
     display.remove( crono )
     display.remove( over )
     display.remove( bg1 )
     display.remove( like1 )
     display.remove( logo1 )

     transition.cancel( over )
     transition.cancel( logo1 )

     timer.cancel( timerDown )

     audio.stop(1)
    
     storyboard.gotoScene("erro10")

end

function quest03( )

     audio.play(som3)

     audio.stop(1)

     questa:removeEventListener( "tap", quest01 )

     questb:removeEventListener( "tap", quest02 )

     questc:removeEventListener( "tap", quest03 )

     questd:removeEventListener( "tap", quest04 )

     --display.remove( bg )
     display.remove( quest )
     display.remove( desafio )
     display.remove( questa )
     display.remove( questb )
     display.remove( questc )
     display.remove( questd )
     display.remove( tempo )
     display.remove( bg2 )
     display.remove( crono )
     display.remove( over )
     display.remove( bg1 )
     display.remove( like1 )
     display.remove( logo1 )

     transition.cancel( over )
     transition.cancel( logo1 )

     timer.cancel( timerDown )

     audio.stop(1)
    
     storyboard.gotoScene("erro10")

end

function quest04( )

     audio.play(som4)

     audio.stop(1)

     questa:removeEventListener( "tap", quest01 )

     questb:removeEventListener( "tap", quest02 )

     questc:removeEventListener( "tap", quest03 )

     questd:removeEventListener( "tap", quest04 )

     --display.remove( bg )
     display.remove( quest )
     display.remove( desafio )
     display.remove( questa )
     display.remove( questb )
     display.remove( questc )
     display.remove( questd )
     display.remove( tempo )
     display.remove( bg2 )
     display.remove( crono )
     display.remove( over )
     display.remove( bg1 )
     display.remove( like1 )
     display.remove( logo1 )

     transition.cancel( over )
     transition.cancel( logo1 )

     timer.cancel( timerDown )

     audio.stop(1)
    
     storyboard.gotoScene("erro10")

end

-- Função enterScene do storyboard que irá ativar o objeto iniciar
function scene:enterScene( event )

    questa:addEventListener( "tap", quest01 )

    questb:addEventListener( "tap", quest02 )

    questc:addEventListener( "tap", quest03 )

    questd:addEventListener( "tap", quest04 )

end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto iniciar e parar o audio
function scene:exitScene( event )

    questa:removeEventListener( "tap", quest01 )

    questb:removeEventListener( "tap", quest02 )

    questc:removeEventListener( "tap", quest03 )

    questd:removeEventListener( "tap", quest04 )

    --display.remove( bg )
    display.remove( quest )
    display.remove( desafio )
    display.remove( questa )
    display.remove( questb )
    display.remove( questc )
    display.remove( questd )
    display.remove( tempo )
    display.remove( bg2 )
    display.remove( crono )
    display.remove( over )
    display.remove( bg1 )
    display.remove( like1 )
    display.remove( logo1 )

    audio.stop(1)

    transition.cancel( over )
    transition.cancel( logo1 )

    timer.cancel( timerDown )

end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene