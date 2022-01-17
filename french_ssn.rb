require 'date'
require 'yaml'

# 1 ) coder la regexp ☑
PATTERN = /^(?<gender>[12])\s?(?<birth_year>\d{2})\s?(?<birth_month>0[1-9]|1[0-2])\s?(?<departement>\d{2}|2[AB])\s?(?<random_digits>(\d{3}\s?){2})(?<key>\d{2})$/

def french_ssn_info(ssn)
  return "The number is invalid" if ssn == ""

  # 2 ) On récupère l'objet MatchData avec lequel on peut integragir comme un hash
  match_data = ssn.match(PATTERN)

  # 3 ) Methode pour vérifier si le SSN est valide.
  # ssn_check?(match_data)

  # 4 ) Trouver le genre
  # p ssn_gender(match_data)

  # 5 ) Trouver le mois
  # p ssn_month(match_data)

  # 6 ) Trouver l'année
  # p ssn_year(match_data)

  # 7 ) Trouver le département
  # p ssn_dep(match_data)

  if ssn_check?(match_data)
    "a #{ssn_gender(match_data)}, born in #{ssn_month(match_data)}, #{ssn_year(match_data)} in #{ssn_dep(match_data)}."
  else
    "The number is invalid"
  end
end

def ssn_check?(match_data)
  key = match_data[:key].to_i
  first_13_number = match_data[0].delete(' ')[0..12].to_i
  # (97 - 1 84 12 76 451 089) % 97 = 46
  (97 - first_13_number) % 97 == key
end

def ssn_gender(match_data)
    match_data[:gender].to_i == 1 ? "man" : "woman"
end

def ssn_month(match_data)
  Date::MONTHNAMES[match_data[:birth_month].to_i]
end

def ssn_year(match_data)
  "19#{match_data[:birth_year]}"
end

def ssn_dep(match_data)
  YAML.load_file('data/french_departments.yml')[match_data[:departement]]
end

 p french_ssn_info("1 84 12 76 451 089 46")
