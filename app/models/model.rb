
def resourcechange(resource)
    if resource == "wood"
        if session[:energy] >= session[:planets][session[:currentplanet]]["energy"]
            session[:wood] += 2 * session[:planets][session[:currentplanet]]["wood"]
            session[:energy] += -1 * session[:planets][session[:currentplanet]]["energy"]
        end
    elsif resource == "iron" 
        if session[:energy] >= 3 * session[:planets][session[:currentplanet]]["energy"] && session[:clay] >= 2 * session[:planets][session[:currentplanet]]["clay"]
            session[:iron] += session[:planets][session[:currentplanet]]["iron"]
            session[:energy] += -3 * session[:planets][session[:currentplanet]]["energy"]
            session[:clay] += -2 * session[:planets][session[:currentplanet]]["clay"]
        end
    elsif resource == "clay"
        if session[:energy] >= session[:planets][session[:currentplanet]]["energy"] && session[:wood] >= session[:planets][session[:currentplanet]]["wood"]
            session[:clay] += session[:planets][session[:currentplanet]]["clay"]
            session[:energy] += -1 * session[:planets][session[:currentplanet]]["energy"]
            session[:wood] += -1 * session[:planets][session[:currentplanet]]["wood"]
        end
    elsif resource == "crystal"
        if session[:energy] >= 3 * session[:planets][session[:currentplanet]]["energy"] && session[:clay] >= 5 * session[:planets][session[:currentplanet]]["clay"] && session[:iron] >= 2 * session[:planets][session[:currentplanet]]["iron"]
            session[:crystal] += session[:planets][session[:currentplanet]]["crystal"]
            session[:iron] += -2 * session[:planets][session[:currentplanet]]["iron"]
            session[:clay] += -5 * session[:planets][session[:currentplanet]]["clay"]
            session[:energy] += -3 * session[:planets][session[:currentplanet]]["energy"]
            
        end
    else
        return "error :("
    end
end

def createplanet(tier,letters,vowels)
    
    session[:planets].merge!(createname(session[:tier],letters,vowels) => {
    "energy"=>rand(0..(session[:tier] + 4)),
    "wood"=>rand(0..(session[:tier] + 4)),
    "iron"=>rand(0..(session[:tier] + 4)),
    "clay"=>rand(0..(session[:tier] + 4)),
    "crystal"=>rand(0..(session[:tier] + 3))})
end

def createname(tier,letters,vowels)
    name = ""
    random = rand(1)
    ((tier / 2) + 2).times do
        if random == 0
            name << (letters.sample)
            name << (vowels.sample)
        else
            name << (vowels.sample)    
            name << (letters.sample)
            name << (vowels.sample) 
        end
    end
    return name
end