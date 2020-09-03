# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require "open-uri"

# puts 'cleaning laboratories'
# Laboratory.destroy_all

# puts 'Creating laboratories'

# filepath = './json/laboratoires_paris.json'
# labs_paris_file = File.read(filepath)
# labs_paris = JSON.parse(labs_paris_file)
# labs_paris.each { |lab|
#   Laboratory.create!(
#     name: lab["fields"]["raison_sociale"],
#     address: "#{lab["fields"]["adresse_complete"]}, #{lab["fields"]["cp_ville"]}"
#   )
# }

puts 'Laboratories created'

puts "Cleaning user"
User.destroy_all

puts "creating users ..."

user1 = User.create!(
  last_name: "Michel",
  first_name: "Michel",
  email: "michel@gmail.com",
  password: "Michel"
)
file_user1 = URI.open('https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
user1.photo.attach(io: file_user1, filename: 'michel.jpg', content_type: 'image/jpg')

user2 = User.create!(
  last_name: "Julie",
  first_name: "Julie",
  email: "julie@gmail.com",
  password: "Juliee"
)
file_user2 = URI.open('https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80')
user2.photo.attach(io: file_user2, filename: 'julie.jpg', content_type: 'image/jpg')

user3 = User.create!(
  last_name: "Jessica",
  first_name: "Jessica",
  email: "jessica@gmail.com",
  password: "Jessica"
)
file_user3 = URI.open('https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
user3.photo.attach(io: file_user3, filename: 'jessica.jpg', content_type: 'image/jpg')

puts "users created"

puts "Cleaning users analyses..."
UserAnalysis.destroy_all

puts "Cleaning analyses..."
Analysis.destroy_all

puts "Cleaning categories..."
Category.destroy_all

puts "Cleaning checkups..."
Checkup.destroy_all


puts "Creating categories..."

hematologie = Category.create!(name: "Hématologie")

biochimie_du_sang = Category.create!(name: "Biochimie du sang")

vitamines = Category.create!(name: "Vitamines")

serologie = Category.create!(name: "Sérologie")

hormonologie = Category.create!(name: "Hormonologie")

puts 'Finished creating categories'

puts "Creating analyses..."

# hematologie

hematies = Analysis.create!(name: "Hématies", description: "Les hématies ou globules rouges sont des cellules sans noyaux qui se présentent sous la forme de petits disques biconcaves. Ils contiennent une solution d'hémoglobine(Hb): c'est ce pigment respiratoire qui transporte l'oxygène des poumons vers les tissus et est responsable de la fonction de l'hématie. /n On évalue leur nombre, par exemple pour détecter une polyglobulie (taux d’hématies trop élevé) ou une anémie (taux d'hématies trop bas). /n On étudie aussi plusieurs autres caractéristiques des globules rouges : Le volume globulaire moyen (VGM) est un indicateur de la taille des globules rouges, L’hématocrite est le pourcentage du volume sanguin occupé par les hématies. Il diminue en cas d’anémie, et augmente par exemple lors d’un épisode de déshydratation et Le taux de réticulocytes correspond au nombre de jeunes globules rouges nouvellement produits par la moelle osseuse. Il donne donc des indications sur le fonctionnement de cette dernière.", min_value: 4.0, max_value: 5.2, category: hematologie, unit: "t/l")

file_hematies = URI.open('https://res.cloudinary.com/drj1uqyhz/image/upload/v1599043816/p1cyeur5gqg19amiuipz.jpg')
hematies.photo.attach(io: file_hematies, filename: 'hematies.jpg', content_type: 'image/jpg')

hemoglobine = Analysis.create!(name: "Hémoglobine", description: "Composant des globules rouges, qui donne la couleur rouge au sang et qui, à l’aide du fer, permet de fixer successivement l’oxygène et le gaz carbonique.", min_value: 11.5, max_value: 15.0, category: hematologie, unit: "g/dl")

file_hemoglobine = URI.open('https://optimaltkosthold.files.wordpress.com/2015/09/shutterstock_166034111.jpg')
hemoglobine.photo.attach(io: file_hemoglobine, filename: 'hemoglobine.jpg', content_type: 'image/jpg')

hematocrite = Analysis.create!(name: "Hématocrite", description: "L'hématrocrite correspond au rapport du volume des globules rouges par rapport au volume sanguin total. Le sang est composé de plasma (eau et sel minéraux) dans lequel circulent les globules blancs, composant essentiel du système immunitaire, les globules rouges, permettant le transport de l'oxygène dans l'ensemble du corps et les plaquettes, chargées de la coagulation sanguine. Ainsi, plus le nombre de globules par litre de sang est élevé, plus l'hématocrite augmente. L'hématocrite est dosé de manière simple et accessible dans la numération formule sanguine (NFS), par le biais d'une prise de sang. L'hématocrite est compris entre 40 et 55 % chez l'homme. Chez la femme, il varie entre 35 et 50 %.", min_value: 34.0, max_value: 45.0, category: hematologie, unit: "%")

file_hematocrite = URI.open('http://christophe.laborie1.free.fr/le%20dopage%20sanguin/sources/hematocrite/sang2.jpg')
hematocrite.photo.attach(io: file_hematocrite, filename: 'hematocrite.jpg', content_type: 'image/jpg')

vgm = Analysis.create!(name: "V.G.M.", description: "Le VGM, volume globulaire moyen est une valeur reflétant la taille moyenne des globules rouges circulant dans notre sang.
Elle est utilisée comme indicateur pour dépister certaines pathologies ou pour mettre en évidence une consommation régulière excessive d'alcool.", min_value: 76, max_value: 96, category: hematologie, unit: "fl")

tcmh = Analysis.create!(name: "T.C.M.H.", description: "La mesure de la teneur corpusculaire moyenne en hémoglobine (TCMH) représente la quantité d'hémoglobine contenue dans un globule rouge, la molécule qui transporte l'oxygène jusqu'aux organes. Cette mesure est souvent comparée à la concentration corpusculaire moyenne en hémoglobine (CCMH), qui est plus précise. Le TCMH se calcule en divisant la concentration d'hémoglobine dans le sang par le nombre de globules rouges.", min_value: 24.0, max_value: 33.0, category: hematologie, unit: "pg")

ccmh = Analysis.create!(name: "C.C.M.H.", description: "La concentration corpusculaire moyenne en hémoglobine (CCMH), ou concentration globulaire moyenne en hémoglobine (CGMH), est un paramètre sanguin donnant la concentration massique moyenne d'hémoglobine contenue dans un certain volume de globules rouges. Elle est calculée par le rapport entre le taux d'hémoglobine (concentration de l'hémoglobine dans le sang) et l'hématocrite. La CCMH est généralement exprimée en g/100mL. C'est l'une des trois principales constantes globulaires (ou érythrocytaires) avec le volume globulaire moyen (VGM) et la teneur corpusculaire moyenne en hémoglobine (TCMH).", min_value: 32.0, max_value: 36.0, category: hematologie, unit: "g/dl")


idr = Analysis.create!(name: "I.D.R.", description: "Le test IDR tuberculine ou Intra Dermo Réaction à la tuberculine est un petit test permettant le diagnostic de la tuberculose. Ce test est également largement utilisé pour vérifier le bon fonctionnement du vaccin BCG (Bilié de Calmette et Guérin) qui protège de la tuberculose. La tuberculose est une maladie infectieuse due à une bactérie plus communément appelé bacille de Koch. Cette maladie est extrêmement contagieuse. Elle se transmet facilement par voie aérienne. L'OMS estime que le tiers de la population mondiale est infectée par la tuberculose. Il existe néanmoins un vaccin, appelé BCG capable de protéger contre l'infection. Afin de vérifier si le vaccin est efficace sur un sujet donné (on estime qu'une partie de la population ne réagit pas au vaccin) on peut effectuer un test permettant de vérifier l’efficacité du vaccin. Ce test est également largement utilisé comme outil de diagnostic pour déterminer si une personne est infectée par la tuberculose. Il existe actuellement en France deux tests commercialisés. Le monotest dit test multipuncture ou « bague » et l'IDR à la tuberculine.", min_value: 11.0, max_value: 17.0, category: hematologie, unit: "%")

leucocytes = Analysis.create!(name: "Leucocytes", description: "Les globules blancs ont en charge la défense du corps contre les micro-organismes (virus, bactéries, champignons). On en distingue 3 variétés : Les polynucléaires, Les lymphocytes et Les lymphocytes. Les polynucléaires sont de trois types : polynucléaires neutrophiles : ils augmentent en cas d’infection bactérienne (ex. : pneumonie); polynucléaires éosinophiles : ils augmentent en cas d’allergie, ou d’infection parasitaires (ex. : oxyurose…) et polynucléaires basophiles : leur taux peut être augmenté en cas de réaction allergique, infectieuse… . Les lymphocytes se multiplient face à une infection virale ou à une maladie auto-immune. Les monocytes deviennent plus nombreux durant certaines maladies infectieuses (ex. : mononucléose, toxoplasmose). Le nombre de leucocytes peut aussi varier en cas de trouble du fonctionnement de la moelle osseuse, ou suite à la prise de certains médicaments.", min_value: 4.0, max_value: 11.0, category: hematologie, unit: "g/l")


plaquettes = Analysis.create!(name: "Plaquettes", description: "Les plaquettes sont des cellules qui participent à la coagulation du sang et en particulier à la formation de caillots en cas d’hémorragie (écoulement sanguin). Leur taux anormal peut avoir de multiples causes. Une valeur basse révèle par exemple une infection ou un problème de coagulation (avec un risque de saignement prolongé, d’épistaxis ou d’apparition de bleus). Une valeur élevée signale un risque d’obstruction d’un vaisseau sanguin par un caillot de sang (thrombose).", min_value: 150.0, max_value: 450.0, category: hematologie, unit: "g/l")

file_plaquettes = URI.open('https://i.pinimg.com/236x/a1/c9/f1/a1c9f166053156c53cea104971c1bc08--edinburgh-definitions.jpg')
plaquettes.photo.attach(io: file_plaquettes, filename: 'plaquettes.jpg', content_type: 'image/jpg')

# biochimie du sang

uree = Analysis.create!(name: "Urée", description: "L’urée est une substance éliminée dans les urines et qui provient de la dégradation des protéines des muscles et de l’alimentation. On la retrouve dans le sang et dans les urines. La mesure de l’urée sanguine permet d’estimer en partie le fonctionnement des reins, mais cette mesure est moins précise que celle de la créatinine. Elle est donc assez rarement prescrite désormais.", min_value: 0.15, max_value: 0.40, category: biochimie_du_sang, unit: "g/l")


glycemie = Analysis.create!(name: "Glycémie à jeun", description: "La glycémie est l’évaluation de la concentration de glucose (principale source d’énergie de l’organisme) dans le sang. Elle peut révéler : un taux de glucose trop faible par rapport à la valeur de référence (hypoglycémie ) ou un taux de glucose trop élevé (hyperglycémie , caractéristique du diabète). Le diagnostic de diabète est posé lorsque la glycémie à jeun est égale ou supérieure à 1,26 g/l (ou 7 mmol/l) et est constatée à 2 reprises. La glycémie est souvent mesurée à la fois à jeun et après les repas. Le médecin peut aussi demander un test d’hyperglycémie provoquée par voie orale (HGPO). Cette analyse repose sur un premier prélèvement sanguin à jeun. On effectue ensuite plusieurs autres prises de sang, à intervalles réguliers, après absorption d’un liquide contenant une quantité connue de glucose. Cet examen peut être prescrit par exemple lorsque le médecin ou la sage femme suspecte un diabète gestationnel chez une femme enceinte.", min_value: 0.74, max_value: 1.10, category: biochimie_du_sang, unit: "g/l")

file_glycemie = URI.open('https://www.santepourtous.nc/images/sampledata/thematiques/diabete/espace-grand-public/solutions-au-quotidien/glycemie-a-jeun.jpg')
glycemie.photo.attach(io: file_glycemie, filename: 'glycemie.jpg', content_type: 'image/jpg')

cholesterol = Analysis.create!(name: "Cholestérol total", description: "Le cholestérol est un lipide (corps gras) de la famille des stérols. Son rôle est essentiel dans l’organisme puisqu’il sert à la fabrication des hormones produites  par les glandes génitales et surrénales. Il est en partie fabriqué par le foie, le reste provient de notre alimentation. Il existe deux types de cholestérol : Le LDL est connu comme le 'mauvais cholestérol' car il correspond à l’excès de cholestérol qui se dépose sur les parois des vaisseaux sanguins ; Le  HDL  connu comme le 'bon cholestérol' élimine le cholestérol des artères et l’entraîne vers le foie pour être détruit.", min_value: 1.60, max_value: 2.20, category: biochimie_du_sang, unit: "g/l")
file_cholesterol = URI.open('https://cdn.lostempireherbs.com/wp-content/uploads/2015/04/Cholesterol_plaque1_shutterstock_1083808715-600x322.png')
cholesterol.photo.attach(io: file_cholesterol, filename: 'cholesterol.png', content_type: 'image/png')

triglycerides = Analysis.create!(name: "Triglycerides", description: "Les triglycérides font partie comme le cholestérol des composés lipidiques ou graisses de l'organisme. Ils constituent la principale réserve énergétique de l’organisme et sont donc bénéfiques pour rester en forme, à condition que les taux dans le sang soient dans la normale. Quand les taux de triglycérides sont élevés, le risque cardiovasculaire augmente. Les triglycérides sont composés d’acides gras et de glycérol. Ils sont stockés dans les tissus adipeux et nous fournissent de l’énergie. Ces molécules lipidiques se forment dans l'intestin grêle à partir de graisses que nous consommons. Elles sont également produites dans le foie à partir de l' excès de sucre dans notre alimentation. Les triglycérides transportent également les  vitamines A,  D,  E et  K dans le sang.", max_value: 1.50, category: biochimie_du_sang, unit: "g/l")


sodium = Analysis.create!(name: "Sodium", description: "Le sodium est un élément minéral très présent dans l'organisme, notamment dans le plasma. Il est apporté par l'alimentation sous forme de chlorure de sodium (le sel). Des apports trop importants sont un facteur de risque d'hypertension artérielle. Découvrez le rôle de ce sel minéral, ses apports nutritionnels recommandés, les risques de carences ou de surdosage ainsi que ses applications médicales. Le sodium (symbole Na dans le tableau périodique des éléments) compte parmi les sels minéraux. Au sein de l’organisme, il se situe principalement dans le sang et le liquide interstitiel (liquide situé autour des cellules). Sa concentration dans le sang est contrôlée par plusieurs hormones, notamment l’ aldostérone et l’hormone anti-diurétique1. Au sein des aliments, le sodium est généralement présent sous forme de chlorure de sodium, c’est-à-dire de sel : 1 g de sel = 400 mg de sodium. Rôles dans l’organisme: Le sodium est indispensable à la transmission de l’influx nerveux et à la contraction musculaire. Sa concentration dans le sang et le liquide interstitiel conditionne la quantité d’eau présente dans les cellules et le volume sanguin. Chez les personnes sensibles à l’apport de sel, l’excès de sodium peut augmenter le volume sanguin et ainsi favoriser la survenue d’une hypertension artérielle1.", min_value: 136.0, max_value: 145.0, category: biochimie_du_sang, unit: "mmol/l")


potassium = Analysis.create!(name: "Potassium", description: "Le potassium est un sel minéral présent à l’intérieur de chacun des cellules de l’organisme. Il participe à la régulation de l’eau corporelle, mais aussi de l’influx nerveux. Découvrez le rôle de ce sel minéral, ses apports nutritionnels recommandés, les risques de carences ou de surdosage ainsi que ses applications médicales. Le potassium (symbole K dans le tableau périodique des éléments) compte parmi les sels minéraux. Il est présent à l’intérieur de chacune des cellules de l’organisme. Rôles dans l’organisme : Le potassium conditionne la quantité d’eau présente dans les cellules. Essentiel à l’action de nombreuses enzymes, il participe notamment à la synthèse de protéines et du glycogène (forme de stockage du sucre). Il intervient dans la sécrétion du suc gastrique et la production d’ aldostérone (une hormone qui régule les quantités de sodium et de potassium présentes dans l’organisme). Il est essentiel au bon fonctionnement du système nerveux et des muscles. Il régule le rythme cardiaque et module les variations de la tension artérielle liées aux apports de sodium. Le métabolisme du potassium est contrôlé par plusieurs hormones : aldostérone, cortisol, hormone anti-diurétique (vasopressine), catécholamines1-2.", min_value: 3.5, max_value: 5.1, category: biochimie_du_sang, unit: "mmol/l")


calcium = Analysis.create!(name: "Calcium", description: "Le calcium et la vitamine D sont des nutriments essentiels au maintien d’une bonne santé osseuse. La vitamine D favorise l’absorption du calcium, contribuant à la formation d’une ossature solide. Elle soutient également la fonction musculaire, ce qui améliore l’équilibre et réduit le risque de chutes pouvant causer des fractures. Moins de la moitié des personnes de 40 ans ou plus déclarent prendre des suppléments de calcium et de vitamine D. Les experts recommandent que tous les adultes canadiens prennent un supplément de vitamine D (particulièrement de vitamine D3, ou cholécalciférol) toute l’année. Il s’agit du type de vitamine D contenu dans la plupart des suppléments au Canada. Les adultes en santé de 19 à 50 ans, y compris les femmes enceintes et allaitantes, ont besoin de 400 à 1 000 UI par jour. Les personnes de plus de 50 ans et les jeunes adultes à risque élevé (souffrant d’ostéoporose, ayant subi plusieurs fractures ou vivant avec une maladie inhibant l’absorption de la vitamine D) devraient consommer entre 800 et 2 000 UI par jour.", min_value: 84.0, max_value: 102.0, category: biochimie_du_sang, unit: "mg/l")


ferritine = Analysis.create!(name: "Ferritine", description: "La ferritine est une protéine essentielle pour réguler le stockage de fer dans l'organisme, en régulant son absorption au niveau intestinal. Son dosage permet de dépister un certain nombre d'anomalies ou de maladies dont des carences en fer, à l'origine d'une anémie. La ferritine est une protéine de stockage du fer que l’on trouve en grande quantité au niveau intracellulaire (dans le foie et les cellules appartenant aux globules blancs). Elle régule l’absorption intestinale du fer, en fonction des besoins de l'organisme. Au niveau sanguin, la ferritine est présente de façon transitoire. Pourquoi prescrire un dosage de la ferritine ? Le dosage de la ferritine mesure la quantité de fer présent dans le sang. Cet examen peut être prescrit pour : Trouver une cause d’ anémie; Détecter la présence d’une inflammation; Ou une hémochromatose (excès de fer dans l’organisme). Mesurer la ferritine permet aussi de vérifier l’efficacité d’un traitement visant à augmenter ou diminuer le taux de fer dans le sang.", min_value: 15.0, max_value: 204.0, category: biochimie_du_sang, unit: "ng/ml")


fer = Analysis.create!(name: "Fer sérique", description: "Le fer est un constituant essentiel de l’hémoglobine, protéine présente dans les globules rouges et dont la principale fonction est de transporter l’oxygène dans l’organisme. Il est également indispensable à d’autres fonctions de l’organisme, comme la synthèse de l’ADN ou certaines réactions enzymatiques. Environ 70% du fer de l’organisme est lié à l’hémoglobine, tandis que le reste est fixé à des protéines de transport (la ferritine ou la transferrine) ou stocké dans certains tissus du corps. Par exemple, dans la moelle osseuse, le fer est stocké et il est utilisé si besoin pour fabriquer de nouveaux globules rouges. Le fer provient de l’alimentation (le foie et autres viandes, les œufs, le poisson, ou encore les légumes verts). Il est particulièrement nécessaire pendant la croissance, la grossesse, l’allaitement ou encore après un important saignement.", min_value: 50.0, max_value: 170.0, category: biochimie_du_sang, unit: "ug/dl")


asat = Analysis.create!(name: "Transaminase ASAT (TGO)", description: "Les transaminases sont des enzymes se trouvant dans les cellules de l'organisme. On distingue deux types de transaminases : Les transaminases ALAT ou SGPT (Alanine-Amino-Transférase ou Sérum GlutamoPyruvate Transféraseaussi pour SGPT, ) qui se trouvent essentiellement dans les cellule du foie, des reins et en faible quantité dans les muscles striés et les globules rouges; Les transaminases ASAT (Aspartate-Amino-Transférase ou SGOT, Sérum GlutamoOxaloacétate Transférase) qui se trouvent essentiellement dans les cellules des muscles striés (squelettique et cardiaque), les globules rouges et les cellule du foie.", min_value: 5.0, max_value: 34.0, category: biochimie_du_sang, unit: "u/l")


alat = Analysis.create!(name: "Transaminase ALAT (TGP)", description: "Les transaminases sont des enzymes se trouvant dans les cellules de l'organisme. On distingue deux types de transaminases :


Les transaminases ALAT ou SGPT (Alanine-Amino-Transférase ou Sérum GlutamoPyruvate Transféraseaussi pour SGPT, ) qui se trouvent essentiellement dans les cellule du foie, des reins et en faible quantité dans les muscles striés et les globules rouges; Les transaminases ASAT (Aspartate-Amino-Transférase ou SGOT, Sérum GlutamoOxaloacétate Transférase) qui se trouvent essentiellement dans les cellules des muscles striés (squelettique et cardiaque), les globules rouges et les cellule du foie.", max_value: 55.0, category: biochimie_du_sang, unit: "u/l")


# vitamines

b12 = Analysis.create!(name: "Vitamine B12", description: "La vitamine B12 est essentielle au bon renouvellement cellulaire et à la fabrication des globules rouges. Elle est aussi très importante chez les femmes enceintes pour le bon développement du fœtus. Découvrez le rôle de cette vitamine, ses apports nutritionnels recommandés, les risques de carences ou de surdosage ainsi que ses applications médicales. Description de la vitamine B12 : La vitamine B12 ou cobalamine, compte parmi les vitamines hydrosolubles (solubles dans l’eau). Elle doit son nom à l’atome de cobalt qu’elle renferme dans sa structure. Rôles dans l’organisme : La vitamine B12 est indispensable au renouvellement cellulaire. Elle contribue ainsi au bon état de la peau. Elle participe à la formation des globules rouges. Elle est essentielle au bon fonctionnement des neurones (cellules nerveuses). En association avec la vitamine B9, elle permet de réduire le taux sanguin d’ homocystéine, un composé dont l’excès est impliqué dans les maladies cardiovasculaires. Chez la femme, durant une grossesse, la vitamine B12 est importante pour l’expansion du volume sanguin, tout comme le développement du système nerveux du fœtus1.", min_value: 187.0, max_value: 883.0, category: vitamines, unit: "pg/ml")


d = Analysis.create!(name: "Vitamine D", description: "La vitamine D est une vitamine liposoluble (soluble dans les lipides). Elle existe sous deux formes : D2 (ergocalciférol), produite par les végétaux, et D3 (cholécalciférol), présente dans les produits d'origine animale. Le corps humain synthétise aussi la vitamine D3 au niveau de la peau, sous l'effet des rayons ultraviolets. La vitamine D intervient dans l'absorption du calcium et du phosphore par les intestins, ainsi que dans leur réabsorption par les reins. Ses effets sont contrebalancés par la calcitonine. Elle intervient dans la minéralisation osseuse du squelette et des articulations, ainsi que sur la tonicité musculaire.", min_value: 30.0, max_value: 60.0, category: vitamines, unit: "ng/ml")

file_d = URI.open('https://res.cloudinary.com/drj1uqyhz/image/upload/v1599045833/bfoe4wy777sns9rh12xq.jpg')
d.photo.attach(io: file_d, filename: 'd.jpg', content_type: 'image/jpg')

b9 = Analysis.create!(name: "Vitamine B9 (Acide folique)", description: "Définition, fonctions et rôles de la vitamine B9
L'acide folique ou la vitamine B9 a un rôle essentiel dans la production du matériel génétique (ADN, ARN) et des acides aminés nécessaires à la croissance cellulaire ce qui explique son caractère indispensable aux cours des différentes phases de la vie. Elle a un rôle important dans la formation des globules rouges, le fonctionnement du système nerveux (synthèse de neuromédiateurs) et du système immunitaire. Elle est nécessaire à la production de nouvelles cellules, ce qui la rend particulièrement importante durant les périodes d’activité métabolique intense comme l'enfance, l'adolescence, la grossesse (développement du fœtus). En France, l’incidence moyenne des anomalies de fermeture du tube neural (AFTN), une conséquence majeure de cette carence chez la femme en tout début de grossesse, est d’environ 1 grossesse sur 1000. Composition des aliments en vitamine B9 et sensibilité de la vitamine : Les aliments naturellement les plus riches en vitamine B9 sont les foies, la levure alimentaire, le jaune d’œuf, l’échalote, les légumes à feuilles vertes et les escalopes végétales à base de soja.", min_value: 3.1, max_value: 20.5, category: vitamines, unit: "ng/ml")


# serologie

syphilis = Analysis.create!(name: "Syphilis", description: "La syphilis est une infection sexuellement transmissible due à une bactérie : le tréponème pâle. En l’absence de traitement précoce, cette maladie devient chronique et le risque de transmission augmente. Très contagieuse, elle touche surtout les hommes ayant des rapports sexuels avec les hommes. La syphilis est une infection sexuellement transmissible (IST) très contagieuse. Elle est due à une bactérie de type spirochète appelée treponema pallidum, ou tréponème pâle. En l’absence de traitement précoce, la syphilis évolue par phases, peut progresser vers une maladie chronique, expose le malade à des complications et est transmise à d’autres partenaires sexuels. À tous ses stades d’évolution, même tardifs, la syphilis est traitée par antibiotiques, permettant la guérison du patient.", max_value: 0.99, category: serologie, unit: "UA")

file_syphilis = URI.open('https://i2.wp.com/images-prod.healthline.com/hlcmsresource/images/Image-Galleries/Secondary-Syphilis/SYPH021-01-EarlyStages.jpg?resize=648%2C488&ssl=1')
syphilis.photo.attach(io: file_syphilis, filename: 'syphilis.jpg', content_type: 'image/jpg')

hepatiteb = Analysis.create!(name: "Hépatite B", description: "m", max_value: 1.0, category: serologie, unit: "s/co")


vih = Analysis.create!(name: "VIH", description: "Le virus de l’immunodéficience humaine, ou VIH, affaiblit le système immunitaire. À un stade avancé, il rend donc l’organisme vulnérable aux infections. Il se transmet par voie sexuelle ou sanguine, ou encore de la femme enceinte à son enfant. Le VIH est un rétrovirus (virus dont le génome est constitué d'ARN).  Ce virus posséde une enzyme qui permet de transcrire son ARN viral en ADN pro-viral. Cet ADN pro-viral peut ensuite s'intégrer dans le noyau de la cellule hôte infectée. Le VIH colonise les cellules porteuses à leur surface de la molécule CD4 et en particulier une catégorie de lymphocytes appelée lymphocytes T CD4. Ces cellules ont pour rôle de coordonner la réponse immunitaire en cas d'infection. Le VIH utilise les cellules humaines hôtes présentant le marqueur CD4 pour se multiplier, s'y accumuler (constituant ainsi des réservoirs de virus persistant à vie) et aussi diffuser dans l'organisme. Il détruit les lymphocytes T CD4 ; il est ainsi responsable d'un affaiblissement chronique du système immunitaire qui rend les personnes atteintes vulnérables aux infections et à certains cancers.", max_value: 0.99, category: serologie)

file_vih = URI.open('https://www.actions-traitements.org/wp-content/uploads/2014/06/Capture-d%E2%80%99%C3%A9cran-2014-07-29-%C3%A0-16.21.02.png')
vih.photo.attach(io: file_vih, filename: 'vih.png', content_type: 'image/png')

hepatitec = Analysis.create!(name: "Hépatite C", description: "L’hépatite C est une maladie infectieuse du foie qui se transmet par le sang. Elle guérit spontanément pour 20 % des personnes infectées. Pour les autres, elle devient chronique et doit être soignée. Des traitements sont possibles mais il n’existe pas de vaccin. Le VHC a été identifié en 1989 et observé au microscope en 2016 par une équipe de chercheurs français. Ce virus transmissible par le sang déclenche une infection chronique du foie. Elle provoque des lésions inflammatoires du foie et des altérations des cellules appelées hépatocytes. Selon que l'hépatite est récente ou qu'elle a plus de six mois, on parle respectivement d'hépatite aiguë ou d'hépatite chronique. Sans dépistage, l'hépatite C peut être ignorée par une personne infectée pendant des dizaines d'années. Une personne sur trois ne sait pas qu'elle est infectée. A cause de cette maladie asymptomatique, des complications peuvent apparaître : cirrhose du foie et, plus rarement, cancer du foie. On estime à 230.000 personnes sont infectées par le VHC en France.", max_value: 0.99, category: serologie)


# hormonologie



tsh = Analysis.create!(name: "TSH (Thyreostimuline)", description: "La TSH ou thyréostimuline est une hormone produite par la partie antérieure de l' hypophyse (une glande située à la base du crâne). Elle intervient dans la boucle d'une série d'hormones qui régulent le niveau de sécrétion des hormones thyroïdiennes ( T3 et  T4) par la glande  thyroïde (située à la face antérieure du cou), en fonction des besoins corporels. Le dosage de la TSH se fait en général dans le cadre d'une exploration biologique à la recherche d'altérations de la fonction thyroïdienne (  hypothyroïdie, hyperthyroïdie ou autres  dysthyroïdies comme les goitres ou les  cancers de la thyroïde), ou encore pour surveiller la réponse au traitement d'une de ces maladies. La production de cette hormone est soumise à une régulation qui fait intervenir différents facteurs dont une autre hormone, la TRH (Thyrotropin Releasing Factor) ainsi que les hormones thyroïdiennes elles-mêmes (T3 et T4). Ces hormones thyroïdiennes ont un rôle de chef d’orchestre de l’organisme : régulant de nombreuses fonctions de base (digestion, température, fatigue, fertilité…). Un niveau élevé de TSH va entraîner une production excessive d’hormones thyroïdiennes (hyperthyroïdie), un niveau bas de TSH va entraîner une production insuffisance d’hormones thyroïdiennes (hypothyroïdie).", min_value: 0.35, max_value: 4.94, category: hormonologie, unit: "mui/l")
file_tsh = URI.open('https://res.cloudinary.com/drj1uqyhz/image/upload/v1599041077/zydtm0gt8uhahvbhs51r.jpg')
tsh.photo.attach(io: file_tsh, filename: 'tsh.jpg', content_type: 'image/jpg')

puts 'Finished creating analyses'


puts "Creating checkups..."

checkup_1 = Checkup.create!(realized_on: Date.new(2019,02,23), user: user3, laboratory_name: "Super labo, Bordeaux")

checkup_2 = Checkup.create!(realized_on: Date.new(2019,8,20), user: user3, laboratory_name: "Super labo, Bordeaux")

checkup_3 = Checkup.create!(realized_on: Date.new(2020,2,13), user: user3, laboratory_name: "Super labo, Bordeaux")

puts 'Finished creating checkups'

puts "Creating user_analyses..."

UserAnalysis.create!(name: "Leucocytes", checkup: checkup_1, analysis: leucocytes, value: 4.3)
UserAnalysis.create!(name: "Hématies", checkup: checkup_1, analysis: hematies, value: 4.3)
UserAnalysis.create!(name: "Hémoglobine", checkup: checkup_1, analysis: hemoglobine, value: 13.2)
UserAnalysis.create!(name: "V.G.M.", checkup: checkup_1, analysis: vgm, value: 13.2)
UserAnalysis.create!(name: "T.C.M.H.", checkup: checkup_1, analysis: tcmh, value: 30)
UserAnalysis.create!(name: "C.C.M.H.", checkup: checkup_1, analysis: ccmh, value: 31.6)
UserAnalysis.create!(name: "Plaquettes", checkup: checkup_1, analysis: plaquettes, value: 178.0)
UserAnalysis.create!(name: "Glycémie à jeun", checkup: checkup_1, analysis: glycemie, value: 0.96)
UserAnalysis.create!(name: "Cholestérol total", checkup: checkup_1, analysis: cholesterol, value: 1.86)

UserAnalysis.create!(name: "Leucocytes", checkup: checkup_2, analysis: leucocytes, value: 4.4)
UserAnalysis.create!(name: "Hématies", checkup: checkup_2, analysis: hematies, value: 4.6)
UserAnalysis.create!(name: "Hémoglobine", checkup: checkup_2, analysis: hemoglobine, value: 13.0)
UserAnalysis.create!(name: "V.G.M.", checkup: checkup_2, analysis: vgm, value: 13.5)
UserAnalysis.create!(name: "T.C.M.H.", checkup: checkup_2, analysis: tcmh, value: 31.6)
UserAnalysis.create!(name: "C.C.M.H.", checkup: checkup_2, analysis: ccmh, value: 33)
UserAnalysis.create!(name: "Plaquettes", checkup: checkup_2, analysis: plaquettes, value: 188.0)
UserAnalysis.create!(name: "Glycémie à jeun", checkup: checkup_2, analysis: glycemie, value: 1.05)
UserAnalysis.create!(name: "Cholestérol total", checkup: checkup_2, analysis: cholesterol, value: 2.10)

UserAnalysis.create!(name: "Leucocytes", checkup: checkup_3, analysis: leucocytes, value: 4.3)
UserAnalysis.create!(name: "Hématies", checkup: checkup_3, analysis: hematies, value: 4.4)
UserAnalysis.create!(name: "Hémoglobine", checkup: checkup_3, analysis: hemoglobine, value: 13.0)
UserAnalysis.create!(name: "V.G.M.", checkup: checkup_3, analysis: vgm, value: 14.0)
UserAnalysis.create!(name: "T.C.M.H.", checkup: checkup_3, analysis: tcmh, value: 31.2)
UserAnalysis.create!(name: "C.C.M.H.", checkup: checkup_3, analysis: ccmh, value: 33.6)
UserAnalysis.create!(name: "Plaquettes", checkup: checkup_3, analysis: plaquettes, value: 180.0)
UserAnalysis.create!(name: "Glycémie à jeun", checkup: checkup_3, analysis: glycemie, value: 1.20)
UserAnalysis.create!(name: "Cholestérol total", checkup: checkup_3, analysis: cholesterol, value: 2.30)


puts 'Finished creating user_analyses'

puts 'Seeds OK!'



