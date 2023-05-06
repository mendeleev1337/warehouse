local ui = {}
--ok lets do some shit guys

-- who dont know - making rn sample ui lib

function ui:NewMenu(name,var) --var for api <3
    local Main = Instance.new("Frame")
    Main.Parent = game.CoreGui.RobloxGui

    local LabelFrame = Instance.new("TextLabel")
    LabelFrame.Parent = Main
    LabelFrame.Text = tostring(name) -- if some stupid will do fucking bool or smh shit

    local TabsFrame = Instance.new("Frame") -- making ftame for tabs
    TabsFrame.Parent = Main

    local Tabs = {}

    function Tabs:NewTab(name,var)
        local Tab = Instance.new("Frame")
        Tab.Parent = TabsFrame
        local LabelFrame = Instance.new("TextLabel")
        LabelFrame.Parent = Tab
        LabelFrame.Text = tostring(name)

        local Sections = {}
        -- making sections
        function Sections:NewSection(tabvar,name,var)
            -- writing a same, but parent will be Tab
            -- its easy
            local Section = Instance.new("Frame")
            Section.Parent = Tab
            local LabelFrame = Instance.new("TextLabel")
            LabelFrame.Parent = Section
            LabelFrame.Text = tostring(name)
            
            -- making function with elements like toggle, binds, sliders and others
            -- i will write only toggle
            local Elements = {}
            function Elements:Element(type,name,var,defVal)
                if type == "Toggle" then
                    local Element = Instance.new("Frame")
                    Element.Parent = Section
                    local LabelFrame = Instance.new("TextLabel")
                    LabelFrame.Parent = Element
                    LabelFrame.Text = tostring(name)
                    local Tab = Instance.new("Frame")
                    Tab.Parent = TabsFrame
                else
                    warn('ERROR - NOT FINDED ELEMENT: '..tostring(type))
                end
                Elements[tostring(var)].Status = defVal or false -- if no defVal then false or 0
            end
            return Elements
        end

        return Sections
    end

    return Tabs
end

-- return ui

local NewMenu = ui:NewMenu("New menu!","newmenu")
local NewTab = NewMenu:NewTab("New Tab!","newtab")
local NewSection = NewTab:NewSection("left","New Section!","newsection") -- i forgot about side... anyway idc
local NewElement = NewSection:Element("Toggle","New Toggle!","newtoggle")

-- thats all! i think
-- we can also add callback to elements