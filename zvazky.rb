# encoding: utf-8
Encoding.default_external = "UTF-8"
Encoding.default_internal = "UTF-8"
preklady = {
  cz: {
    meno_value: "Anička Mrkvičková",
    meno: "Jméno a příjmení osoby/",
    menoENDE: "Full name/Vollständiger Name",
    datum_narodenia: "Datum narození/Born/Geburtsdatum",
    miesto_narodenia: "Místo narození/Place/Ort",
    rodne_cislo: "Rodné číslo/ID num/Persönliche ID",
    nazov_objektu: "Název objektu/Object name/",
    nazov_objektuDE: "Objektnamen",
    druh_trestneho_cinu: "Druh trestného činu",
    druh_trestneho_cinuENDE: "Crime type/Straftat",
    adresa_objektu: "Adresa objektu",
    adresa_objektuENDE: "Address/Adresse",
    miesto_trestneho_cinu: "Místo trestného činu",
    miesto_trestneho_cinuENDE: "Crime scene/Tatort",
    druh_zvazku: "Druh svazku",
    druh_zvazkuENDE: "File type/Dateityp",
    utvar: "Útvar, odbor, oddel./",
    utvarENDE: "Department/Abteilung",
    utvar_value: "XII-8-3",
    registracne: "Registrační číslo/",
    cislo: "Registration Num.",
    registracne_cislo_value: "315681",
    zaznamy: "Záznamy o kontrole svazku - spisu nebo seznámení se s jeho obsahem/", 
    zaznamyEN: "Records on file review or familiarization with its content/",
    zaznamyDE: "Überprüfung von Dateien oder Vertrautmachen mit dessen Inhalt ",
    dovernik1: "D",
    dovernik2: "ů",
    dovernik3: "vern",
    dovernik4: "í",
    dovernik5: "k",
    dovernik: "Důverník",
    datum: "Datum/ Date",
    datum_value: "28.2.1980"
  }
}
 
require 'erubis'
load 'helper_methods.rb'
 
zvazok_template = Erubis::Eruby.new(File.read("zvazok.erb"))
puts "V priečinku sa nachádza #{get_fotky.size} fotiek"
html_array = get_fotky.map do |filename|
  meno = ask "Meno pre #{filename}:"
  safe_meno = meno.encode("UTF-8", :undef => :replace)
  zvazok_template.result(preklady[:cz].merge fotka: filename, meno_value: safe_meno)
end
joined_html = html_array.join page_break
main_template = Erubis::Eruby.new(File.read("template.erb"))
full_html = main_template.result joined_html: joined_html
File.write("zvazky.html", full_html)