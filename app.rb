require 'sinatra'

get '/api/:teacher' do
  content_type :json
  user_response(params["teacher"])
end

post '/api' do
  content_type :json
  user_response(params["text"])
end

require 'json'
def user_response(teacher_name)
  matches = LOOKUP.select{ |name, _code| name.include?(teacher_name) }

  return "Unknown" if matches.empty?

  lines = matches.inject([]) do |array, (name, code)|
    array << "#{name} - http://www.swingplanit.com/#{code}"
  end

  text_lines = lines.map{ |line| Hash(text: line) }

  {
    text: "We found the following links",
    attachments: text_lines
  }.to_json
end

LOOKUP = {
  "Adamo Ciarallo and Vicci Moore"           => "C804",
  "Ali Taghavi and Katja Uckermann"          => "C364",
  "Andreas Olsson and Mette Herlitz"         => "C837",
  "Annette Kuhnle"                           => "C143",
  "Audun Kveberg and Kris Blindert"          => "C917",
  "Bernard Cavasa and Anne-Helene Carvasa"   => "C468",
  "Bobby White and Kate Hedin"               => "C382",
  "Brenda Russell"                           => "C157",
  "Cedric Clerc and Caroline Faivre"         => "C834",
  "Catherine Palmier"                        => "C504",
  "Dan Repsch and Jenny Sowden"              => "C900",
  "Evita Arce"                               => "C184",
  "Fabien Vrillon and Lisa Clarke"           => "C781",
  "Hasse Mattson and Marie Mattson"          => "C427",
  "Henric and Joanna Stillman"               => "C604",
  "Isabella Gregorio"                        => "C27",
  "JB Mino and Tatiana Udry"                 => "C619",
  "Jeremy Otth"                              => "C30",
  "Jeremy Otth and Laura Keat"               => "C398",
  "Jon Tigert and Jenna Applegarth"          => "C932",
  "Justin Riley"                             => "C521",
  "Kevin St. Laurent and Jo Hoffberg"        => "C368",
  "Ksenia Parkhatskaya"                      => "C326",
  "Laura Glaess"                             => "C105",
  "Laura Keat"                               => "C23",
  "Lennart Westerlund"                       => "C228",
  "Mattias and Hanna Lundmark"               => "C447",
  "Maeva Truntzer"                           => "C34",
  "Max Pitruzzella"                          => "C18",
  "Michael Jagger"                           => "C183",
  "Michael Jagger and Evita Arce"            => "C443",
  "Mickey Fortanasce and Kelly Arsenault"    => "C410",
  "Mike Faltesek and Casey Schneider"        => "C414",
  "Mike Grosser and Ruth Hoffman"            => "C617",
  "Mike Roberts and Laura Glaess"            => "C371",
  "Nicolas Deniau and Mikaela Hellsten"      => "C426",
  "Nick Williams"                            => "C22",
  "Nick Williams and Sylvia Sykes"           => "C411",
  "Olivier Harouard and Natasha Devyatkina " => "C488",
  "Peter Strom and Naomi Uyama"              => "C402",
  "Pontus Persson and Isabella Gregorio"     => "C387",
  "Remy Kouakou-Kouame"                      => "C161",
  "Remy Kouakou-Kouame and Moe Sakan"        => "C442",
  "Remy Kouakou Kouame and Ramona Staffeld"  => "C1020",
  "Ron Dobrovinsky and Sharon Guzman"        => "C785",
  "Shane McCarthy and Ruth Jeffery"          => "C602",
  "Sharon Davis"                             => "C64",
  "Skye Humphries"                           => "C20",
  "Skye Humphries and Frida Segerdahl"       => "C370",
  "Stephen Sayer and Chandrae Roettig "      => "C436",
  "Steven Mitchell"                          => "C204",
  "Sylvia Sykes"                             => "C46",
  "Thomas Blacharz and Alice Mei"            => "C381",
  "Todd Yannacone"                           => "C241",
  "Vincenzo Fesi and Katja Hrastar"          => "C778",
  "William Mauvais and Maeva Truntzer"       => "C493",
}

