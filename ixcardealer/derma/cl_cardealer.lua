net.Receive("CarDealerUsed", function(len, player)
    local client = LocalPlayer()
    local character = client:GetCharacter()

    local DealerMainFrame = vgui.Create("DFrame")
    DealerMainFrame:SetSize(ScrW()/3, ScrH()/1.5) 
    DealerMainFrame:SetTitle(L("cardealerName")) 
    DealerMainFrame:SetVisible(true) 
    DealerMainFrame:SetDraggable(false) 
    DealerMainFrame:ShowCloseButton(true) 
    DealerMainFrame:SetBackgroundBlur(true)
    DealerMainFrame:Center()
    DealerMainFrame:MakePopup()

    local DScrollPanel = DealerMainFrame:Add("DScrollPanel")
    DScrollPanel:Dock(FILL)

    for k,v in pairs(IxCarDealer.Cars) do
        local CarFrame = DScrollPanel:Add("DPanel")
        CarFrame:Dock(TOP) 
        CarFrame:SetSize(100, 100) 
        CarFrame:SetVisible(true)
        CarFrame:DockMargin(10, 5, 10, 0)

        local ModelPanel = CarFrame:Add("DModelPanel")
        ModelPanel:Dock(LEFT)
        ModelPanel:SetFOV(120)
        ModelPanel:SetSize(300, 100)
        ModelPanel:SetModel(v.model)

        local BuyButton = CarFrame:Add("ixMenuButton")
        BuyButton:Dock(RIGHT) 
        BuyButton:SetText(L("carRent"))
        BuyButton:SetContentAlignment(5)
        BuyButton:SizeToContents()
        BuyButton.DoClick = function()

        Derma_Query(L("carPurch").." ".. v["price"].. ix.currency.symbol.."?\n".. L("serverRestart"), L("carPurchTitle"),
            L("yes"), function() 
                net.Start("ixMoneyTake")
                net.WriteUInt(k, 32)
                net.SendToServer()
             end,
            L("no"), function() end)
        end

        BuyButton:SetHelixTooltip(function(tooltip)
            local name = tooltip:AddRow("name")
            name:SetImportant()
            name:SetText(L("carName")..": "..v["name"])
            name:SizeToContents()

            local desc = tooltip:AddRow("desc")
            desc:SetText(L("carDesc")..": "..v["description"])
            desc:SizeToContents()

            local price = tooltip:AddRow("price")
            price:SetText(L("carPrice")..": "..v["price"]..ix.currency.symbol)
            price:SizeToContents()

            tooltip:SizeToContents()
        end)
    end
end)
