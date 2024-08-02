TriggerEvent("chat:addTemplate", "big", [[
    <div style="background: {0};">
        <p><span style="font-size: 0.75rem;">{1}</span><br>{2}</p>
    </div>
]])

TriggerEvent("chat:addTemplate", "message", [[
    <div class="message" style="background: linear-gradient(90deg, rgba({0}, 0.9), transparent);"><div class="icon" style="background-color: rgba({0}, 255);"><i class="{1}"></i></div><span class="text"><span style='font-weight: 600; display: contents;'>{2}:</span> {3}</span></div>
]])