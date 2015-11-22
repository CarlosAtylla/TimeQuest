
-- Esconde a barra de status e define as posições X e Y das telas do jogo
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard, cria uma nova scene e adiciona as variáveis button 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Função cretescene do storyboard onde serão inseridos elementos que iram aparecer na tela de menu
function scene:createScene( event )
local group = self.view

        bg = display.newImage( "images/questao01/background-menu.jpg" )
        bg.x = display.contentWidth/2
        bg.y = display.contentHeight/2
        group:insert(bg)

        bg = audio.loadStream( "sounds/questoes/music.mp3" )
        audio.play( bg, { channel = 1, loops = -1 } )

        ok = audio.loadStream( "sounds/acerto/acertou.mp3" )
        audio.play( ok, { channel = 1 } )

        som1 = audio.loadStream( "sounds/menu/toque.wav" )
        som2 = audio.loadStream( "sounds/menu/toque.wav" )
        som3 = audio.loadStream( "sounds/menu/toque.wav" )
        som4 = audio.loadStream( "sounds/menu/toque.wav" )
        som5 = audio.loadStream( "sounds/menu/toque.wav" )
        som6 = audio.loadStream( "sounds/menu/toque.wav" )
        som7 = audio.loadStream( "sounds/menu/toque.wav" )
        som8 = audio.loadStream( "sounds/menu/toque.wav" )

        quest = display.newImage( "images/questao01/desafio.png" )
        quest.x = display.contentWidth/2 + 5
        quest.y = display.contentHeight/2 - 130
        group:insert(quest)

        forma1 = display.newImage( "images/questao01/forma1.png" )
        forma1.x = display.contentWidth/2 - 100
        forma1.y = display.contentHeight/2 - 20
        forma1.xScale = 0.6
        forma1.yScale = 0.6
        group:insert(forma1)


        forma2 = display.newImage( "images/questao01/forma2.png" )
        forma2.x = display.contentWidth/2 + 100
        forma2.y = display.contentHeight/2 + 10
        forma2.xScale = 0.6
        forma2.yScale = 0.6
        group:insert(forma2)


        forma3 = display.newImage( "images/questao01/forma3.png" )
        forma3.x = display.contentWidth/2 - 100
        forma3.y = display.contentHeight/2 + 80
        forma3.xScale = 0.6
        forma3.yScale = 0.6
        group:insert(forma3)


        forma4 = display.newImage( "images/questao01/forma4.png" )
        forma4.x = display.contentWidth/2 + 100
        forma4.y = display.contentHeight/2 + 180
        forma4.xScale = 0.5
        forma4.yScale = 0.5
        group:insert(forma4)


        forma5 = display.newImage( "images/questao01/forma5.png" )
        forma5.x = display.contentWidth/2 - 100
        forma5.y = display.contentHeight/2 + 190
        forma5.xScale = 0.6
        forma5.yScale = 0.6
        group:insert(forma5)


        forma6 = display.newImage( "images/questao01/forma6.png" )
        forma6.x = display.contentWidth/2  + 10
        forma6.y = display.contentHeight/2 + 80
        forma6.xScale = 0.5
        forma6.yScale = 0.5
        group:insert(forma6)


        forma7 = display.newImage( "images/questao01/forma7.png" )
        forma7.x = display.contentWidth/2 - 10
        forma7.y = display.contentHeight/2 - 40
        forma7.xScale = 0.7
        forma7.yScale = 0.7
        group:insert(forma7)


        forma8 = display.newImage( "images/questao01/triangulo.png" )
        forma8.x = display.contentWidth/2 
        forma8.y = display.contentHeight/2 + 180
        forma8.xScale = 0.5
        forma8.yScale = 0.5
        group:insert(forma8)


        --Adiciona o cronômetro
        local tempo = display.newText( "10", 0, 0, "Marker Felt", 70 )   
        tempo.x = display.contentWidth/2
        tempo.y = 40
        tempo:setTextColor( 1, 0, 0 )
        group:insert(tempo)

        local number = 10
        local modf = math.modf

        function timerDown()
            number = number - 1
            local start_seconds = number

            local start_minutes = modf(start_seconds/60)
            local seconds       = start_seconds - start_minutes*60

            local start_hours = modf(start_minutes/60)
            local minutes     = start_minutes - start_hours*60

            local min = minutes < 10 and (minutes) or minutes
            local sec = seconds < 10 and (seconds) or seconds

            tempo.text = sec

            if(number == 0)then

                clock = audio.loadStream( "sounds/clock/timeup.mp3" )
                audio.play( clock )

                audio.stop( 1 )

                forma1:removeEventListener( "tap", forma01 )

                forma2:removeEventListener( "tap", forma02 )

                forma3:removeEventListener( "tap", forma03 )

                forma4:removeEventListener( "tap", forma04 )

                forma5:removeEventListener( "tap", forma05 )

                forma6:removeEventListener( "tap", forma06 )

                forma7:removeEventListener( "tap", forma07 )

                forma8:removeEventListener( "tap", forma08 )


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

                forma1:removeEventListener( "tap", forma01 )

                forma2:removeEventListener( "tap", forma02 )

                forma3:removeEventListener( "tap", forma03 )

                forma4:removeEventListener( "tap", forma04 )

                forma5:removeEventListener( "tap", forma05 )

                forma6:removeEventListener( "tap", forma06 )

                forma7:removeEventListener( "tap", forma07 )

                forma8:removeEventListener( "tap", forma08 )
    
    
                --display.remove( bg )
                display.remove( quest )
                display.remove( forma1 )
                display.remove( forma2 )
                display.remove( forma3 )
                display.remove( forma4 ) 
                display.remove( forma5 )
                display.remove( forma6 )
                display.remove( forma7 )
                display.remove( forma8 )
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

                audio.stop( 1 )


                storyboard.gotoScene("over_questao01", {effect = "slideUp"})


              end

            end

        end

        timerDown = timer.performWithDelay(1000, timerDown, number)

  function forma08()

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

        forma1:removeEventListener( "tap", forma01 )

        forma2:removeEventListener( "tap", forma02 )

        forma3:removeEventListener( "tap", forma03 )

        forma4:removeEventListener( "tap", forma04 )
 
        forma5:removeEventListener( "tap", forma05 )

        forma6:removeEventListener( "tap", forma06 )

        forma7:removeEventListener( "tap", forma07 )

        forma8:removeEventListener( "tap", forma08 )

        timer.cancel( timerDown )

        transition.to(logo1, {time = 2000, alpha = 1, onComplete = showoff}) 
    end
    

    function showoff( )

        forma1:removeEventListener( "tap", forma01 )

        forma2:removeEventListener( "tap", forma02 )

        forma3:removeEventListener( "tap", forma03 )

        forma4:removeEventListener( "tap", forma04 )

        forma5:removeEventListener( "tap", forma05 )

        forma6:removeEventListener( "tap", forma06 )

        forma7:removeEventListener( "tap", forma07 )

        forma8:removeEventListener( "tap", forma08 )

        timer.cancel( timerDown )

        transition.to(logo1, {time = 1900, alpha = -1, onComplete = fim}) 

        like1.alpha = -1
    end

    showon()
    
  end

end

-- Comando responsável por ativar a função createscene
scene:addEventListener( "createScene", scene )

function forma01()

    audio.play(som2)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )
    
    
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    storyboard.gotoScene("erro1")


end  

function forma02()

    audio.play(som3)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 )

    storyboard.gotoScene("erro1")

end 

function forma03()

    audio.play(som4)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 )

    storyboard.gotoScene("erro1")

end     

function forma04()

    audio.play(som5)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 )

    storyboard.gotoScene("erro1")

end  

function forma05()

    audio.play(som6)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 ) 

    storyboard.gotoScene("erro1")

end  

function forma06()

    audio.play(som7)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 )  

    storyboard.gotoScene("erro1")

end 

function forma07()

    audio.play(som8)

    audio.stop(1)

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 )

    storyboard.gotoScene("erro1")

end   

  function fim()

    audio.stop(1)
    
    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )
        
    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
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

    audio.stop( 1 )

    storyboard.gotoScene("2quest")

  end 


-- Função enterScene do storyboard que irá ativar o objeto iniciar
function scene:enterScene( event )

   forma1:addEventListener( "tap", forma01 )

   forma2:addEventListener( "tap", forma02 )

   forma3:addEventListener( "tap", forma03 )

   forma4:addEventListener( "tap", forma04 )

   forma5:addEventListener( "tap", forma05 )

   forma6:addEventListener( "tap", forma06 )

   forma7:addEventListener( "tap", forma07 )

   forma8:addEventListener( "tap", forma08 )

end

-- Comando responsável por ativar a função enterscene
scene:addEventListener( "enterScene", scene )

-- Função exitscene do storyboard onde removerá o objeto iniciar e parar o audio
function scene:exitScene( event )

    forma1:removeEventListener( "tap", forma01 )

    forma2:removeEventListener( "tap", forma02 )

    forma3:removeEventListener( "tap", forma03 )

    forma4:removeEventListener( "tap", forma04 )

    forma5:removeEventListener( "tap", forma05 )

    forma6:removeEventListener( "tap", forma06 )

    forma7:removeEventListener( "tap", forma07 )

    forma8:removeEventListener( "tap", forma08 )

    --display.remove( bg )
    display.remove( quest )
    display.remove( forma1 )
    display.remove( forma2 )
    display.remove( forma3 )
    display.remove( forma4 ) 
    display.remove( forma5 )
    display.remove( forma6 )
    display.remove( forma7 )
    display.remove( forma8 )
    display.remove( tempo )
    display.remove( bg2 )
    display.remove( crono )
    display.remove( over )
    display.remove( bg1 )
    display.remove( like1 )
    display.remove( logo1 )

    audio.stop( 1 )

    transition.cancel( over )
    transition.cancel( logo1 )
        
    timer.cancel( timerDown )

end

-- Comando responsável por ativar a função exitscene
scene:addEventListener( "exitScene", scene )

return scene