-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require "storyboard"

-- load scenetemplate.lua
storyboard.gotoScene( "scenetemplate" )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):


-- Add onscreen text
local label1 = display.newText( "SQLite demo", 20, 30, native.systemFontBold, 20 )
label1:setTextColor( red, cyan, 255 )
local label2 = display.newText( "Creates or opens a local database", 20, 50, native.systemFont, 14 )
label2:setTextColor( 190, 190, 255 )
local label3 = display.newText( "(Data is shown below)", 20, 90, native.systemFont, 14 )
label3:setTextColor( 255, 255, 190 )

-- Set the background to white
display.setDefault( "background", 255, 255, 255 )


----------------
-- Require the widget & storyboard libraries
local widget = require( "widget" )
local storyboard = require( "storyboard" )
----------------


--Include sqlite
require "sqlite3"
--Open data.db.  If the file doesn't exist it will be created
-- local path = system.pathForFile("data.db", system.DocumentsDirectory)
local path = system.pathForFile("data.db", system.DocumentsDirectory)
db = sqlite3.open( path )   
 
--Handle the applicationExit event to close the db
local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
end
 
--Setup the table if it doesn't exist
--local tablesetup = [[CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, content, content2, content3);]]
--print(tablesetup)
--db:exec( tablesetup )

local datassetup = [[CREATE TABLE IF NOT EXISTS dat (id_datas INTEGER PRIMARY KEY, data_datas TEXT, descricao_datas TEXT);]]
print(datassetup)
db:exec( datassetup )

--local horoscoposetup = [[CREATE TABLE IF NOT EXISTS Horoscopo (id_Horoscopo INTEGER PRIMARY KEY, nome_horoscopo TEXT, inicio_horoscopo TEXT, final_horoscopo TEXT, descricao_horoscopo TEXT, ascendente_horoscopo TEXT);]]
--local tablesetup = [[CREATE TABLE IF NOT EXISTS horoscopo (id INTEGER PRIMARY KEY, nome_horoscopo, inicio_horoscopo, final_horoscopo, descricao_horoscopo, ascendente_horoscopo);]]

local tablesetup = [[CREATE TABLE IF NOT EXISTS hrcpo (id INTEGER PRIMARY KEY, nome TEXT, descricao TEXT, tipo TEXT);]]
print(tablesetup)
db:exec( tablesetup )

local previsaosetup = [[CREATE TABLE IF NOT EXISTS Previsao (id_previsao INTEGER PRIMARY KEY, inicio_previsao TEXT, final_previsao TEXT, descricao_previsao TEXT);]]
print(previsaosetup)
db:exec( previsaosetup )

--local tipohoroscoposetup = [[CREATE TABLE  IF NOT EXISTS Tipo_Horoscopo (id_tipoHoros INTEGER PRIMARY KEY, nome_tipoHoros TEXT);]]
--print(tipohoroscoposetup)
--db:exec( tipohoroscoposetup )

--local usuariosetup = [[CREATE TABLE IF NOT EXISTS Usuario (id_usr INTEGER PRIMARY KEY, nome_usr TEXT, email_usr TEXT, facebook_usr TEXT, dataNasc_usr TEXT, horaNasc_usr TEXT);]]
--print(usuariosetup)
--db:exec( usuariosetup )


--CREATE TABLE Datas (id_datas INTEGER PRIMARY KEY, data_datas TEXT, descricao_datas TEXT);
--CREATE TABLE Horoscopo (id_Horoscopo INTEGER PRIMARY KEY, nome_horoscopo TEXT, inicio_horoscopo TEXT, final_horoscopo TEXT, descricao_horoscopo TEXT, ascendente_horoscopo TEXT);
--CREATE TABLE Previsao (id_previsao INTEGER PRIMARY KEY, inicio_previsao TEXT, final_previsao TEXT, descricao_previsao TEXT);
--CREATE TABLE Tipo_Horoscopo (id_tipoHoros INTEGER PRIMARY KEY, nome_tipoHoros TEXT);
--CREATE TABLE Usuario (id_usr INTEGER PRIMARY KEY, nome_usr TEXT, email_usr TEXT, facebook_usr TEXT, dataNasc_usr TEXT, horaNasc_usr TEXT);
--COMMIT; 
 
-- limpa dados
--local limpa = [[DELETE * FROM horos;]] 
 
 
--Add rows with a auto index in 'id'. You don't need to specify a set of values because we're populating all of them
local testvalue = {}
testvalue[1] = 'Escorpiao'
testvalue[2] = 'Peixes'
testvalue[3] = 'Leao'
testvalue[4] = 'Sagitario'
local tablefill =[[INSERT INTO hrcp VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[1]..[['); ]]
local tablefill2 =[[INSERT INTO hrcp VALUES (NULL, ']]..testvalue[2]..[[',']]..testvalue[2]..[['); ]]
local tablefill3 =[[INSERT INTO hrcp VALUES (NULL, ']]..testvalue[3]..[[',']]..testvalue[3]..[['); ]]
local tablefill4 =[[INSERT INTO hrcp VALUES (NULL, ']]..testvalue[4]..[[',']]..testvalue[4]..[['); ]]
db:exec( tablefill )
db:exec( tablefill2 )
db:exec( tablefill3 )
db:exec( tablefill4 ) 

-----------------

local horoscopo =
{
{
name = "Lua",
description = "Rege as viagens; as mudanças teporárias; a água e os líquidos em geral, bem como seu respectivo comércio; o comércio varejista; os artigos de primeira necessidade; a pesca; os assuntos domésticos; a saúde; as comissões e o cotidiano.",
type = "1"
},
{
name = "Cão",
description = "O Cão é magnânimo, nobre e leal. Muito responsável, gosta de analisar tudo antes de agir, é muito discreto e lúcido. Por outro lado, sua exagerada reserva natural o leva a perder oportunidades e sua introversão também não contribui para o sucesso. Bastante moralista, um pouco pessimista, por vezes é dotado de um otimismo mordaz. A hiprocrisia fera a alma do Cão.",
type = "3"
},
{
name = "Ascendente Aquário",
description = "Possuem uma característica física imprevisível e elétrica. São indivíduos espontâneos, criativos, sendo que para eles o espaço físico é fundamental, pois são amantes da liberdade, em todos os níveis. Têm geralmente uma natureza altruísta e humanitária, adoram experiências inovadoras, pois seu espírito é aberto e pouco disciplinado. Precisam muito do contato humano e ideias ligadas ao futuro e à evolução de todos, mas muitas vezes sentem-se solitários e incompreendidos com sua visão mais aberta e visionária do mundo. Têm sensibilidade nos olhos, os tornozelos são seu ponto fraco, assim como a parte circulatória. São tipos assimétricos, esbeltos e altos, as sobrancelhas podem ser afastadas, os olhos se sobressaem, são grandes e abertos. O cabelo em geral tem muita eletricidade, é cacheado ou cheios; os gestos podem ser abruptos e imprevisíveis.",
type = "2"
}
}

for i=1,#horoscopo do
local q = [[INSERT INTO hrcpo VALUES (NULL, ']] .. horoscopo[i].name .. [[',']] .. horoscopo[i].description .. [[', ']] .. horoscopo[i].type .. [['); ]]
db:exec( q )
end
-----------------

local datas =
{
{
name = "1 de janeiro",
description = "Dia da Fraternidade Universal, Dia Mundial da Paz"
},
{
name = "4 de janeiro",
description = "Dia do Alquimista"
},
{
name = "1 de janeiro",
description = "Maria Mãe de Deus, Martinho, Magno"
}
}

for i=1,#datas do
local q = [[INSERT INTO Datas VALUES (NULL, ']] .. datas[i].name .. [[',']] .. datas[i].description .. [['); ]]
db:exec( q )
end



-----------------

--Add rows with a auto index in 'id'. You don't need to specify a set of values because we're populating all of them
local testvaluedat = {}
testvaluedat[1] = '1 jan'
testvaluedat[2] = 'Feriado nacional'
testvaluedat[3] = '20 fev'
testvaluedat[4] = 'Carnaval'
local tablefill =[[INSERT INTO dat VALUES (NULL, ']]..testvaluedat[1]..[[',']]..testvaluedat[2]..[['); ]]
local tablefill2 =[[INSERT INTO dat VALUES (NULL, ']]..testvaluedat[3]..[[',']]..testvaluedat[4]..[['); ]]
local tablefill3 =[[INSERT INTO dat VALUES (NULL, ']]..testvaluedat[1]..[[',']]..testvaluedat[4]..[['); ]]
local tablefill4 =[[INSERT INTO dat VALUES (NULL, ']]..testvaluedat[2]..[[',']]..testvaluedat[3]..[['); ]]
db:exec( tablefill )
db:exec( tablefill2 )
db:exec( tablefill3 )
db:exec( tablefill4 ) 
 
 
 
--Add rows with a auto index in 'id'. You don't need to specify a set of values because we're populating all of them
--local testvalue = {}
--testvalue[1] = 'Hello'
--testvalue[2] = 'World'
--testvalue[3] = 'Lua'
--testvalue[4] = 'Opa!!!'
--local tablefill =[[INSERT INTO test VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[['); ]]
--local tablefill2 =[[INSERT INTO test VALUES (NULL, ']]..testvalue[2]..[[',']]..testvalue[1]..[['); ]]
--local tablefill3 =[[INSERT INTO test VALUES (NULL, ']]..testvalue[3]..[[',']]..testvalue[3]..[['); ]]
--local tablefill4 =[[INSERT INTO test VALUES (NULL, ']]..testvalue[4]..[[',']]..testvalue[4]..[['); ]]
--db:exec( tablefill )
--db:exec( tablefill2 )
--db:exec( tablefill3 )
--db:exec( tablefill4 )
 
--print the sqlite version to the terminal
print( "version " .. sqlite3.version() )
 
--print all the table contents
--for row in db:nrows("SELECT * FROM test") do
--  local text = row.content.." "..row.content2
--  local t = display.newText(text, 20, 120 + (20 * row.id), native.systemFont, 16)
--  t:setTextColor(255,0,255)
--end

print( "Horoscopo ... " .. sqlite3.version() )

--print all the table contents
for row in db:nrows("SELECT * FROM hrcpo where id = 2") do
  local text = "No horóscopo Chinês "..row.nome.." "..row.descricao
  local t = display.newText(text, 20, 120 + (20 * row.id), 300, 300, native.systemFont, 12)
  print ("aa" ..row.id)
  t:setTextColor(0,0,0)
end 

print( "-------------------- " .. sqlite3.version() )
 
--print all the table contents
for row in db:nrows("SELECT * FROM Datas where id_Datas = 1") do
  local text = "Data: "..row.data_datas.." "..row.descricao_datas
  local t = display.newText(text, 20, 120 + (160 * row.id_datas), 300, 300, native.systemFont, 12)
  print ("aa" ..row.id_datas)
  t:setTextColor(255,0,255)
end  
 
-------------

-- The gradient used by the title bar
local titleGradient = graphics.newGradient( 
	{ 189, 203, 220, 255 }, 
	{ 89, 116, 152, 255 }, "down" )
	
-- Create a title bar
local titleBar = display.newRect( 0, 0, display.contentWidth, 32 )
titleBar.y = titleBar.contentHeight * 0.5
titleBar:setFillColor( titleGradient )	

-- Create the title bar text
local titleBarText = display.newText( "Widget Demo", 0, 0, native.systemFontBold, 16 )
titleBarText.x = titleBar.x
titleBarText.y = titleBar.y
	
-- Create buttons table for the tab bar
local tabButtons = 
{
	{
		width = 32, 
		height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "TableView",
		onPress = function() storyboard.gotoScene( "tab1" ); end,
		selected = true
	},
	{
		width = 32, 
		height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "ScrollView",
		onPress = function() storyboard.gotoScene( "tab2" ); end,
	},
	{
		width = 32, 
		height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "Nascimento",
		onPress = function() storyboard.gotoScene( "tab3" ); end,
	},
	{
		width = 32, 
		height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "Other",
		onPress = function() storyboard.gotoScene( "tab4" ); end,
	}
}

-- Create a tab-bar and place it at the bottom of the screen
local tabBar = widget.newTabBar
{
	top = display.contentHeight - 50,
	width = display.contentWidth,
	buttons = tabButtons
}

-- Start at tab1
---storyboard.gotoScene( "tab3" )



-------------
 
 
 
--setup the system listener to catch applicationExit
Runtime:addEventListener( "system", onSystemEvent )