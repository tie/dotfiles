--------------------------------------------------------------------------------
-- Author: Ivan Trubach
-- Copyright (c) 2016 Ivan Trubach
--------------------------------------------------------------------------------

local os = require("os")

local def = {}

def.terminal = "uxterm"
def.editor = os.getenv("EDITOR") or "nano"
def.editor_cmd = def.terminal .. " -e " .. def.editor

def.browser = "chrome"
def.gui_editor = "gvim"
def.graphics = "meh"

return def
