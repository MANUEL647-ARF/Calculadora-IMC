display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background",9/255,3/255,33/255  )

--titulo
local titulo=display.newText({
    text="Calculadora de IMC",
    x=160,
    y=40,
    font=native.systemFontBold,
    fontSize=28
})
titulo:setFillColor(39/255,245/255,224/255)

--barra de peso
local peso=native.newTextField(display.contentCenterX, 100,220,40)
peso.placeholder="Peso (kg)"
peso.inputType="decimal"

--barra de altura
local altura=native.newTextField(display.contentCenterX, 160, 220, 40)
altura.placeholder="Altura (m)"
altura.inputType="decimal"

--resultado
local resultado=display.newText({
    text="IMC",
    x=160,
    y=220,
    font=native.systemFont,
    fontSize=22
})
resultado:setFillColor(1)

local medidor=display.newCircle(display.contentCenterX,270,40)
medidor:setFillColor(0.7)

local textMedidor=display.newText({
    text="Clasificacion",
    x=160,
    y=330,
    font=native.systemFontBold,
    fontSize=20
})
textMedidor:setFillColor(0/255,245/255,39/255)

local MensajePersonalizado=display.newText({
    text="Recomendacion",
    x=160,
    y=400,
    font=native.systemFontBold,
    fontSize=20
})

--funcion clasificacion
local function obtenerCategoria(imc)

    if imc<18.5 then
        medidor:setFillColor(0,0,1)
        resultado:setFillColor(0,0,1)
        textMedidor.text="Peso bajo"
        MensajePersonalizado.text="Come grasas saludables"
        return "Bajo peso"

    elseif imc<25 then
        medidor:setFillColor(0,1,0)
        resultado:setFillColor(0,1,0)
        textMedidor.text="Peso normal"
        MensajePersonalizado.text="Vas por buen camino"
        return "Peso normal"

    elseif imc<30 then
        medidor:setFillColor(1,0.5,0)
        resultado:setFillColor(1,0.5,0)
        textMedidor.text="Sobrepeso"
        MensajePersonalizado.text="Ten habitos saludables"
        return "Sobrepeso"

    else
        medidor:setFillColor(1,0,0)
        resultado:setFillColor(1,0,0)
        textMedidor.text="Obesidad"
        MensajePersonalizado.text="Mantente activo(caminar o trotar)"
        return "Obesidad"
    end

end


--calcular IMC
local function calcularIMC()

    local p=tonumber(peso.text)
    local h=tonumber(altura.text)

    if peso.text=="" or altura.text=="" then
        resultado.text="Completa todos los campos"
        return
    end

    if not p or not h then
        resultado.text="Usa solo numeros"
        return
    end

    if p<=0 or p>500 then
        resultado.text="Peso no valido"
        return
    end

    if h<=0.5 or h>2.5 then
        resultado.text="Altura invalida"
        return
    end

    local imc=p/(h*h)
    imc=math.floor(imc*10)/10
    local categoria=obtenerCategoria(imc)
    

end


--limpiar
local function limpiarCampos()

    peso.text=""
    altura.text=""
    resultado.text="IMC"
    MensajePersonalizado.text="Recomendacion"
    medidor:setFillColor(0.7)
    textMedidor.text="Clasificacion"
    resultado:setFillColor(1)

end



--boton Calcular
local btnCalcular=display.newText({
    text="Calcular",
    x=110,
    y=360,
    font=native.systemFontBold,
    fontSize=24
})
btnCalcular:setFillColor(39/255,245/255,224/255)
btnCalcular:addEventListener("tap", calcularIMC)

--boton Limpiar
local btnLimpiar=display.newText({
    text="Limpiar",
    x=220,
    y=360,
    font=native.systemFontBold,
    fontSize=22
})
btnLimpiar:setFillColor(60/255,245/255,39/255)
btnLimpiar:addEventListener("tap", limpiarCampos)