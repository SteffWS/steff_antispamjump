fx_version 'adamant'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'Prevents players from spamming the jump button, triggering ragdolling if attempted too soon after a jump.'
version '1.0.0'
author '@steff'

client_scripts {
    'client/client.lua'
}

shared_scripts {
    'config.lua'
}

lua54 'yes'
