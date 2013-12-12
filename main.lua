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
label1:setTextColor( 190, 190, 255 )
local label2 = display.newText( "Creates or opens a local database", 20, 50, native.systemFont, 14 )
label2:setTextColor( 190, 190, 255 )
local label3 = display.newText( "(Data is shown below)", 20, 90, native.systemFont, 14 )
label3:setTextColor( 255, 255, 190 )

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
local tablesetup = [[CREATE TABLE IF NOT EXISTS hrcp (id INTEGER PRIMARY KEY, content, content2);]]
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
for row in db:nrows("SELECT * FROM hrcp") do
  local text = row.content.." "..row.content2
  local t = display.newText(text, 20, 120 + (20 * row.id), native.systemFont, 16)
  print ("aa" ..row.id)
  t:setTextColor(255,0,255)
end 

print( "-------------------- " .. sqlite3.version() )
 
--print all the table contents
for row in db:nrows("SELECT * FROM dat") do
  local text = row.data_datas.." "..row.descricao_datas
  local t = display.newText(text, 20, 120 + (40 * row.id_datas), native.systemFont, 16)
  print ("aa" ..row.id_datas)
  t:setTextColor(255,0,255)
end  
 
--setup the system listener to catch applicationExit
Runtime:addEventListener( "system", onSystemEvent )