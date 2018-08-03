require './config/environment'
require './app/models/model'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/' do
    session[:currentplanet] = :earth
    session[:tier] = 0
    session[:wood] = 0
    session[:iron] = 0
    session[:clay] = 0
    session[:bed] = 0
    session[:crystal] = 0
    session[:letters] = ("a".."z").to_a
    session[:vowels] = ["a","e","i","o","u","y","t","n","r","s"]

    session[:energy] = 10
    session[:img] = "images/planet1.png"
    session[:planets] = 
    {
      :earth => {"energy"=>1,"wood"=>3,"iron"=>3,"clay"=>3,"crystal"=>0},
      :gleeb => {"energy"=>3,"wood"=>0,"iron"=>0,"clay"=>0,"crystal"=>2},
    }
    13.times do
      createplanet(session[:tier],session[:letters],session[:vowels])
    end  
    
    puts session[:planets]
    return erb :index
  end
  
  get '/home' do
    
    return erb :home
  end
  
  get '/resources' do
    return erb :resources
  end
  
  get '/starscope' do
    return erb :starscope
  end
  
  get '/about' do
    return erb :about
  end
  
  get '/mobile' do
    return erb :mobile
  end
  
  get '/workshop' do
    return erb :workshop
  end
  
  post '/rocket1' do
    if session[:iron] >= 30 && session[:tier] == 0
      session[:tier] = 1
      session[:iron] += -30
    end
    return erb :workshop
  end
  
  post '/rocket2' do
    if session[:iron] >= 50 && session[:crystal] >= 10 && session[:tier] == 1
      session[:tier] = 2
      session[:iron] += -50
      session[:crystal] += -10
    end
    return erb :workshop
  end
   
  post '/rocket3' do
    if session[:iron] >= 150 && session[:crystal] >= 30 && session[:tier] == 2
      session[:tier] = 3
      session[:iron] += -150
      session[:crystal] += -30
    end
    return erb :workshop
  end
  
  post '/bed1' do
    if session[:wood] >= 10 && session[:clay] >= 10 && session[:bed] == 0
      session[:bed] += 5
      session[:wood] += -10
      session[:clay] += -10
    end
    return erb :workshop
  end
  
  post '/bed2' do
    if session[:wood] >= 50 && session[:clay] >= 50 && session[:bed] == 5
      session[:bed] += 10
      session[:wood] += -50
      session[:clay] += -50
    end
    return erb :workshop
  end
  
  post '/sleep' do
    session[:energy] = 10 + session[:bed].to_i
    return erb :home
  end
  
  post '/earth' do
    session[:currentplanet] = :earth
    return erb :home
  end
  
  post '/gleeb' do
    if session[:tier] >= 1
      session[:currentplanet] = :gleeb
      return erb :home
    else
      return erb :starscope
    end
    
  end
  
  post '/planet1' do
    if session[:tier] >= 1
      session[:currentplanet] = session[:planets].keys[2]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet2' do
    if session[:tier] >= 2
      session[:currentplanet] = session[:planets].keys[3]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet3' do
    if session[:tier] >= 2
      session[:currentplanet] = session[:planets].keys[4]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet4' do
    if session[:tier] >= 2
      session[:currentplanet] = session[:planets].keys[5]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet5' do
    if session[:tier] >= 2
      session[:currentplanet] = session[:planets].keys[6]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet6' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[7]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet7' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[8]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet8' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[9]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet9' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[10]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet10' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[11]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet11' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[12]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet12' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[13]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/planet13' do
    if session[:tier] >= 3
      session[:currentplanet] = session[:planets].keys[14]
      return erb :home
    else
      return erb :starscope
    end
  end
  
  post '/wood' do
    resourcechange("wood")  # session[:planets][session[:currentplanet]][:wood] += -1
    return erb :resources
  end
  
  post '/iron' do
    resourcechange("iron")
    return erb :resources
  end
  
  post '/clay' do
    resourcechange("clay")
    return erb :resources
  end
  
  post '/crystal' do
    resourcechange("crystal")
#
    return erb :resources
  end
  
end
