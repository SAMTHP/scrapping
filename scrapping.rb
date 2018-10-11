require 'nokogiri'
require 'open-uri'
require 'pry'

########################################       Scrapping       ###########################################

### Route de la mairie ###

##########################################################################################################

def get_the_email_of_a_townhal_from_its_webpage (url_vaureal)

	page = Nokogiri::HTML(open(url_vaureal)) 
	mail = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	puts mail.text

	# print "Pour retourner au menu : appuyer sur entrer "
	# gets.chomp
	# return menu

end

def get_all_the_urls_of_val_doise_townhalls (url_valdoise)

	page = Nokogiri::HTML(open(url_valdoise))
	site = []
	site = page.css('a')

	array = []
# binding.pry
	site.map do |y|
		if rege = y['href'] =~ (/95/)
			array << y['href']
		end
	end
	puts array

	print "Pour retourner au menu : appuyer sur entrer "
	gets.chomp
	return menu
end


def all_mails_val_doise (url_valdoise)

	page = Nokogiri::HTML(open(url_valdoise))
	site = []
	site = page.css('a')

	array = []

	site.map do |y|
		if rege = y['href'] =~ (/95/)
			array << y['href']
		end
	end
	
	array.each do |adresse| 
		adresse[0] = "http://annuaire-des-mairies.com"

		get_the_email_of_a_townhal_from_its_webpage(adresse)

	end

	print "Pour retourner au menu : appuyer sur entrer "
	gets.chomp
	return menu
end

########################################       Scrapping       ###########################################

### Trader du dimanche ###

##########################################################################################################

def trading
	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	crypto = page.css('a.currency-name-container.link-secondary')
	price = page.css("a.price")
	
	tab_crypto = []
	tab_price = []

	crypto.each do |nom|
		tab_crypto << nom.text
	end

	price.each do |num|
		tab_price << num.text
	end
	
	cours = Hash[tab_crypto.zip(tab_price)]

	cours.each do |k, v|
		puts "La crypto #{k} a une valeur de : #{v}"
	end


end

def boucle_chain
	trading
	puts "Rafraîchissement du cours dans 10 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 09 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 08 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 07 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 06 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 05 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 04 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 03 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 02 secondes"
	sleep 1
	puts "Rafraîchissement du cours dans 01 secondes"
	sleep 1

	trading
end
##########################################################################################################

### Menu ###

##########################################################################################################

def menu

page_vaureal = "http://annuaire-des-mairies.com/95/vaureal.html"
page_val_doise = "http://annuaire-des-mairies.com/val-d-oise.html"

	puts ""
	puts "##########################################################"
	puts "###                      Scrapping                    ###"
	puts "##########################################################"
	puts ""
	puts "Listes des méthodes:"
	puts ""
	puts "Exercice : 'Route de la Mairie'"
	puts "1 - Récupération de l'adresse mail de Vauréal"
	puts "2 - Récupération de toutes les url des villes du Val d'Oise"
	puts "3 - Récupération de tous les mails dex villes du Val d'Oise."
	puts ""
	puts "Exercice : 'Trader de l'obscur'"
	puts "4 - Cours des cryptomonnaies"
	puts "5 - .............."
	puts "6 - .............."
	puts "7 - .............."
	puts ""
	puts "# - Pour sortir : appuyer sur entrer"
	puts ""
	puts "Choisissez la méthode à executer en tapant le numéro correspondant :"
	
	choix = gets.chomp.to_i
	puts "##################    SIMULATION    ######################"
	puts""
	if choix == 1
		get_the_email_of_a_townhal_from_its_webpage(page_vaureal)
	elsif choix == 2
		get_all_the_urls_of_val_doise_townhalls(page_val_doise)
	elsif choix == 3
		all_mails_val_doise (page_val_doise)
	elsif choix == 4
		boucle_chain
	elsif choix == 'y'
		puts "A bientôt :)"
	end
end

menu













