preklady = {
  cz: {
    meno_value: "Anička Mrkvičková",
    meno: "Jméno a příjmení osoby",
    datum_narodenia: "Datum narození",
    miesto_narodenia: "Místo narození",
    rodne_cislo: "Rodné číslo",
    nazov_objektu: "Název objektu",
    druh_trestneho_cinu: "Druh trestného činu",
    adresa_objektu: "Adresa objektu",
    miesto_trestneho_cinu: "Místo trestného činu",
    druh_zvazku: "Druh svazku",
    utvar: "Útvar, odbor oddelení",
    utvar_value: "XII-2-3",
    registracne: "Registrační",
    cislo: "číslo",
    registracne_cislo_value: "37581",
    zaznamy: "Záznamy o kontrole svazku - spisu nebo seznámení se s jeho obsahem",
    dovernik: "Důverník",
    datum: "Datum",
    datum_value: "28.5.1978"
  }
}

require 'erubis'
load 'helper_methods.rb'

zvazok_template = Erubis::Eruby.new(File.read("zvazok.erb"))
puts "V priečinku sa nachádza #{get_fotky.size} fotiek"
html_array = get_fotky.map do |filename|
  meno = ask "Meno pre #{filename}:"
  zvazok_template.result(preklady[:cz].merge fotka: filename, meno_value: meno)
end
joined_html = html_array.join page_break
main_template = Erubis::Eruby.new(File.read("template.erb"))
full_html = main_template.result joined_html: joined_html
File.write("zvazky.html", full_html)