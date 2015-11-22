--------------------------------------------MAIN QUE IRÁ REDIRECIONAR PARA O STORYBOARD MENU--------------------------------------------

-- Esconde a barra de status e define as posições X e Y das telas do jogo
display.setStatusBar(display.HiddenStatusBar)

-- Requisita o storyboard e vai para a tela do menu
local storyboard = require "storyboard"
storyboard.gotoScene( "apresentacao")