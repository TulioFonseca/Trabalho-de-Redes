#!/usr/bin/env ruby

class Arquivo
    
 def lerArquivo (caminho)
	file = caminho
	states_file = File.open(file)
	states = []

	while ! states_file.eof?
	  first = states_file.gets.chomp
	  states << first
	end
	
	states_file.close
	
	return states
 end
 
 def escreverArquivo(caminho, dados)
	File.open(caminho, 'w') do |f2|
		f2.puts dados
		f2.close
	end	
 end
        
end	