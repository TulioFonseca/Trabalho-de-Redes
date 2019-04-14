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
 
 def separarCabecalho(arquivo)
	return arquivo[0..2]
 end
 
 def escreverArquivo(caminho, dados)
	File.open(caminho, 'w') do |f2|
		f2.puts dados
		f2.close
	end	
 end
 
	def converterBinario(mensagem)
	return mensagem.unpack("B*")[0]
	end

	def desconverterMensagemBinario(mensagem)
	return mensagem.pack("B*")
	end
	
	def getMensagem(arquivo)
		return arquivo[4..-1]
	 end
        
end	