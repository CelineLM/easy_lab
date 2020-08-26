# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning analyses..."
Analysis.destroy_all

puts "Cleaning categories..."
Category.destroy_all

puts "Creating categories..."

immuno_hematologie = Category.new(name: "Immuno-Hématologie")
immuno_hematologie.save!

biochimie_des_urines = Category.new(name: "Biochimie des urines")
biochimie_des_urines.save!

hematologie = Category.new(name: "Hématologie")
hematologie.save!

biochimie_du_sang = Category.new(name: "Biochimie du sang")
biochimie_du_sang.save!

serologie_infectieuse = Category.new(name: "Sérologie infectieuse")
serologie_infectieuse.save!

puts 'Finished creating categories'

puts "Creating analyses..."

leucocytes = Analysis.new(name: "Leucocytes", description: "Les globules blancs ont en charge la défense du corps contre les micro-organismes (virus, bactéries, champignons). On en distingue 3 variétés : Les polynucléaires, Les lymphocytes et Les lymphocytes. Les polynucléaires sont de trois types : polynucléaires neutrophiles : ils augmentent en cas d’infection bactérienne (ex. : pneumonie); polynucléaires éosinophiles : ils augmentent en cas d’allergie, ou d’infection parasitaires (ex. : oxyurose…) et polynucléaires basophiles : leur taux peut être augmenté en cas de réaction allergique, infectieuse… . Les lymphocytes se multiplient face à une infection virale ou à une maladie auto-immune. Les monocytes deviennent plus nombreux durant certaines maladies infectieuses (ex. : mononucléose, toxoplasmose). Le nombre de leucocytes peut aussi varier en cas de trouble du fonctionnement de la moelle osseuse, ou suite à la prise de certains médicaments.", min_value: 4.0, max_value: 11.0, category: hematologie, unit: "G/L")
leucocytes.save!

hematies = Analysis.new(name: "Hematies", description: "Les globules rouges servent à transporter l’oxygène des poumons vers les tissus. On évalue leur nombre, par exemple pour détecter une polyglobulie (taux d’hématies trop élevé) ou une anémie (taux d'hématies trop bas). On étudie aussi plusieurs autres caractéristiques des globules rouges : Le volume globulaire moyen (VGM) est un indicateur de la taille des globules rouges, L’hématocrite est le pourcentage du volume sanguin occupé par les hématies. Il diminue en cas d’anémie, et augmente par exemple lors d’un épisode de déshydratation et Le taux de réticulocytes correspond au nombre de jeunes globules rouges nouvellement produits par la moelle osseuse. Il donne donc des indications sur le fonctionnement de cette dernière. On étudie aussi l'hémoglobine que les hématies contiennent, sous plusieurs aspects : Le taux d’hémoglobine dans le sang est normalement de 13 grammes par décilitre (g/dl) chez l’homme, et 12 chez la femme. À partir du deuxième trimestre de grossesse, il tombe à 10,5 g/dl, La concentration corpusculaire (ou globulaire) moyenne en hémoglobine (CCMH ou CGMH) est la quantité d’hémoglobine contenue dans 100 millilitres de globules rouges et La teneur corpusculaire (ou globulaire) moyenne en hémoglobine (TCMH ou TGMH) est la quantité moyenne d’hémoglobine contenue dans un globule rouge.", min_value: 4.0, max_value: 5.2, category: hematologie, unit: "T/L")
hematies.save!
file_hematies = URI.open('https://idata.over-blog.com/5/13/60/16/hematie-apparence.png')
hematies.photo.attach(io: file_hematies, filename: 'hematies.png', content_type: 'image/png')

hemoglobine = Analysis.new(name: "hemoglobine", description: "Composant des globules rouges, qui donne la couleur rouge au sang et qui, à l’aide du fer, permet de fixer successivement l’oxygène et le gaz carbonique.", min_value: 11.5, max_value: 15.0, category: hematologie, unit: "g/dl")
hemoglobine.save!
file_hemoglobine = URI.open('https://optimaltkosthold.files.wordpress.com/2015/09/shutterstock_166034111.jpg')
hemoglobine.photo.attach(io: file_hemoglobine, filename: 'hemoglobine.jpg', content_type: 'image/jpg')

hematocrite = Analysis.new(name: "Hématocrite", description: "L'hématrocrite correspond au rapport du volume des globules rouges par rapport au volume sanguin total. Le sang est composé de plasma (eau et sel minéraux) dans lequel circulent les globules blancs, composant essentiel du système immunitaire, les globules rouges, permettant le transport de l'oxygène dans l'ensemble du corps et les plaquettes, chargées de la coagulation sanguine. Ainsi, plus le nombre de globules par litre de sang est élevé, plus l'hématocrite augmente. L'hématocrite est dosé de manière simple et accessible dans la numération formule sanguine (NFS), par le biais d'une prise de sang. L'hématocrite est compris entre 40 et 55 % chez l'homme. Chez la femme, il varie entre 35 et 50 %.", min_value: 34.0, max_value: 45.0, category: hematologie, unit: "%")
hematocrite.save!
file_hematocrite = URI.open('http://christophe.laborie1.free.fr/le%20dopage%20sanguin/sources/hematocrite/sang2.jpg')
hematocrite.photo.attach(io: file_hematocrite, filename: 'hematocrite.jpg', content_type: 'image/jpg')

tcmh = Analysis.new(name: "T.C.M.H.", description: "La mesure de la teneur corpusculaire moyenne en hémoglobine (TCMH) représente la quantité d'hémoglobine contenue dans un globule rouge, la molécule qui transporte l'oxygène jusqu'aux organes. Cette mesure est souvent comparée à la concentration corpusculaire moyenne en hémoglobine (CCMH), qui est plus précise. Le TCMH se calcule en divisant la concentration d'hémoglobine dans le sang par le nombre de globules rouges.", min_value: 24.0, max_value: 33.0, category: hematologie, unit: "pg")
tcmh.save!

ccmh = Analysis.new(name: "C.C.M.H.", description: "La concentration corpusculaire moyenne en hémoglobine (CCMH), ou concentration globulaire moyenne en hémoglobine (CGMH), est un paramètre sanguin donnant la concentration massique moyenne d'hémoglobine contenue dans un certain volume de globules rouges. Elle est calculée par le rapport entre le taux d'hémoglobine (concentration de l'hémoglobine dans le sang) et l'hématocrite. La CCMH est généralement exprimée en g/100mL. C'est l'une des trois principales constantes globulaires (ou érythrocytaires) avec le volume globulaire moyen (VGM) et la teneur corpusculaire moyenne en hémoglobine (TCMH).", min_value: 32.0, max_value: 36.0, category: hematologie, unit: "g/dl")
ccmh.save!

idr = Analysis.new(name: "I.D.R.", description: "Le test IDR tuberculine ou Intra Dermo Réaction à la tuberculine est un petit test permettant le diagnostic de la tuberculose. Ce test est également largement utilisé pour vérifier le bon fonctionnement du vaccin BCG (Bilié de Calmette et Guérin) qui protège de la tuberculose. La tuberculose est une maladie infectieuse due à une bactérie plus communément appelé bacille de Koch. Cette maladie est extrêmement contagieuse. Elle se transmet facilement par voie aérienne. L'OMS estime que le tiers de la population mondiale est infectée par la tuberculose. Il existe néanmoins un vaccin, appelé BCG capable de protéger contre l'infection. Afin de vérifier si le vaccin est efficace sur un sujet donné (on estime qu'une partie de la population ne réagit pas au vaccin) on peut effectuer un test permettant de vérifier l’efficacité du vaccin. Ce test est également largement utilisé comme outil de diagnostic pour déterminer si une personne est infectée par la tuberculose. Il existe actuellement en France deux tests commercialisés. Le monotest dit test multipuncture ou « bague » et l'IDR à la tuberculine.", min_value: 11.0, max_value: 17.0, category: hematologie, unit: "%")
idr.save!

plaquettes = Analysis.new(name: "Plaquettes", description: "Les plaquettes sont des cellules qui participent à la coagulation du sang et en particulier à la formation de caillots en cas d’hémorragie (écoulement sanguin). Leur taux anormal peut avoir de multiples causes. Une valeur basse révèle par exemple une infection ou un problème de coagulation (avec un risque de saignement prolongé, d’épistaxis ou d’apparition de bleus). Une valeur élevée signale un risque d’obstruction d’un vaisseau sanguin par un caillot de sang (thrombose).", min_value: 150.0, max_value: 450.0, category: hematologie, unit: "G/L")
plaquettes.save!
file_plaquettes = URI.open('https://i.pinimg.com/236x/a1/c9/f1/a1c9f166053156c53cea104971c1bc08--edinburgh-definitions.jpg')
plaquettes.photo.attach(io: file_plaquettes, filename: 'plaquettes.jpg', content_type: 'image/jpg')

glycemie = Analysis.new(name: "Glycémie à jeun", description: "La glycémie est l’évaluation de la concentration de glucose (principale source d’énergie de l’organisme) dans le sang. Elle peut révéler : un taux de glucose trop faible par rapport à la valeur de référence (hypoglycémie ) ou un taux de glucose trop élevé (hyperglycémie , caractéristique du diabète). Le diagnostic de diabète est posé lorsque la glycémie à jeun est égale ou supérieure à 1,26 g/l (ou 7 mmol/l) et est constatée à 2 reprises. La glycémie est souvent mesurée à la fois à jeun et après les repas. Le médecin peut aussi demander un test d’hyperglycémie provoquée par voie orale (HGPO). Cette analyse repose sur un premier prélèvement sanguin à jeun. On effectue ensuite plusieurs autres prises de sang, à intervalles réguliers, après absorption d’un liquide contenant une quantité connue de glucose. Cet examen peut être prescrit par exemple lorsque le médecin ou la sage femme suspecte un diabète gestationnel chez une femme enceinte.", min_value: 0.74, max_value: 1.10, category: biochimie_du_sang, unit: "g/L")
glycemie.save!
file_glycemie = URI.open('https://www.santepourtous.nc/images/sampledata/thematiques/diabete/espace-grand-public/solutions-au-quotidien/glycemie-a-jeun.jpg')
glycemie.photo.attach(io: file_glycemie, filename: 'glycemie.jpg', content_type: 'image/jpg')

syphilis = Analysis.new(name: "Sérologie de la Syphilis", description: "La syphilis est une infection sexuellement transmissible due à une bactérie : le tréponème pâle. En l’absence de traitement précoce, cette maladie devient chronique et le risque de transmission augmente. Très contagieuse, elle touche surtout les hommes ayant des rapports sexuels avec les hommes. La syphilis est une infection sexuellement transmissible (IST) très contagieuse. Elle est due à une bactérie de type spirochète appelée treponema pallidum, ou tréponème pâle. En l’absence de traitement précoce, la syphilis évolue par phases, peut progresser vers une maladie chronique, expose le malade à des complications et est transmise à d’autres partenaires sexuels. À tous ses stades d’évolution, même tardifs, la syphilis est traitée par antibiotiques, permettant la guérison du patient.", max_value: 0.99, category: serologie_infectieuse)
syphilis.save!
file_syphilis = URI.open('https://i2.wp.com/images-prod.healthline.com/hlcmsresource/images/Image-Galleries/Secondary-Syphilis/SYPH021-01-EarlyStages.jpg?resize=648%2C488&ssl=1')
syphilis.photo.attach(io: file_syphilis, filename: 'syphilis.jpg', content_type: 'image/jpg')

vih = Analysis.new(name: "Sérologie de l'infection à VIH", description: "Le virus de l’immunodéficience humaine, ou VIH, affaiblit le système immunitaire. À un stade avancé, il rend donc l’organisme vulnérable aux infections. Il se transmet par voie sexuelle ou sanguine, ou encore de la femme enceinte à son enfant. Le VIH est un rétrovirus (virus dont le génome est constitué d'ARN).  Ce virus posséde une enzyme qui permet de transcrire son ARN viral en ADN pro-viral. Cet ADN pro-viral peut ensuite s'intégrer dans le noyau de la cellule hôte infectée. Le VIH colonise les cellules porteuses à leur surface de la molécule CD4 et en particulier une catégorie de lymphocytes appelée lymphocytes T CD4. Ces cellules ont pour rôle de coordonner la réponse immunitaire en cas d'infection. Le VIH utilise les cellules humaines hôtes présentant le marqueur CD4 pour se multiplier, s'y accumuler (constituant ainsi des réservoirs de virus persistant à vie) et aussi diffuser dans l'organisme. Il détruit les lymphocytes T CD4 ; il est ainsi responsable d'un affaiblissement chronique du système immunitaire qui rend les personnes atteintes vulnérables aux infections et à certains cancers.", max_value: 0.99, category: serologie_infectieuse)
vih.save!
file_vih = URI.open('https://www.actions-traitements.org/wp-content/uploads/2014/06/Capture-d%E2%80%99%C3%A9cran-2014-07-29-%C3%A0-16.21.02.png')
vih.photo.attach(io: file_vih, filename: 'vih.png', content_type: 'image/png')

puts 'Finished creating analyses'

puts 'Seeds OK!'



