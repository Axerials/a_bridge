fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Axerials'
description 'Bridge resource for My Skills Script to add custom skills'
version '1.0.0'

-- a_skills must be started before this resource
dependency 'a_skills'

shared_scripts {
    '@es_extended/imports.lua',
    'skills_config.lua',  
}

client_scripts {
    'client.lua'           
}

server_scripts {
    'server.lua'            
}