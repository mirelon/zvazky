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
template = Erubis::Eruby.new(File.read("template.erb"))
File.write('zvazky.html', template.result(
  preklady[:cz]
))