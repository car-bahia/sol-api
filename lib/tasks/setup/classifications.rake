namespace :setup do
  namespace :classifications do
    desc 'Create default classifications'
    task load: :environment do |task|

      CLASSIFICATIONS = [
        ["BENS", 1, nil],
        ["SERVIÇOS", 2, nil],
        ["OBRAS", 3, nil],
        ["AGROPECUÁRIA", 100, 1],
        ["VEÍCULOS", 101, 1],
        ["EQUIPAMENTO DE SEGURANÇA", 102, 1],
        ["EQUIPAMENTO PARA ESCRITÓRIOS", 103, 1],
        ["ELETRODOMÉSTICO", 104, 1],
        ["MÚSICA", 105, 1],
        ["PAPELARIA E ACESSÓRIOS", 106, 1],
        ["MAQUINAS E FERRAMENTAS", 107, 1],
        ["ENERGIA", 108, 1],
        ["AUDIO VISUAL", 109, 1],
        ["INFORMÁTICA", 110, 1],
        ["MATERIAL PARA CONSTRUÇÃO", 111, 1],
        ["AUTOMAÇÃO", 112, 1],
        ["SEMOVENTES", 113, 1],
        ["MATERIAL PARA LABORATÓRIO DE ANALISE", 114, 1],
        ["ASSESSORAMENTO TÉCNICO", 200, 2],
        ["SERVIÇOS DE ENGENHARIA", 201, 2],
        ["SERVIÇOS DE FRETAMENTO E TRANSPORTE", 202, 2],
        ["SERVIÇOS PUBLICITÁRIOS E GRÁFICOS", 203, 2],
        ["SEGURO", 204, 2],
        ["CONSTRUÇÃO PESADA", 300, 3],
        ["CONSTRUÇÃO CIVIL", 301, 3],
        ["OBRAS AGROPECUÁRIAS", 302, 3],
        ["INSUMOS", 100000, 100],
        ["MÁQUINAS", 100001, 100],
        ["MATÉRIA PRIMA", 100002, 100],
        ["MATERIAL", 100003, 100],
        ["TRATORES", 100004, 100],
        ["VEÍCULOS PESADOS", 100005, 100],
        ["CÂMERAS FRIAS", 100006, 100],
        ["EQUIPAMENTOS DE IRRIGAÇÃO", 100007, 100],
        ["FERTILIZANTES", 100008, 100],
        ["FRIGORÍFICOS E ABATEDOUROS", 100009, 100],
        ["INSUMOS AGRÍCOLAS", 100010, 100],
        ["LATICÍNIOS E HORTIFRÚTI", 100011, 100],
        ["PLANTAS E MUDAS", 100012, 100],
        ["PRODUTOS ORGÂNICOS", 100013, 100],
        ["SEMENTES", 100014, 100],
        ["ACESSÓRIOS", 101001, 101],
        ["CARROS E CAMINHONETAS", 101002, 101],
        ["MOTOCICLETAS", 101003, 101],
        ["CAMINHÕES", 101004, 101],
        ["ÔNIBUS", 101005, 101],
        ["VANS", 101006, 101],
        ["VEÍCULOS PESADOS", 101007, 101],
        ["EQUIPAMENTO DE PROTEÇÃO INDIVIDUAL", 102001, 102],
        ["EQUIPAMENTO DE PROTEÇÃO COLETIVA", 102002, 102],
        ["UNIFORMES", 102003, 102],
        ["INSUMOS", 103001, 103],
        ["MÁQUINAS PARA ESCRITÓRIOS", 103002, 103],
        ["MÓVEIS PARA ESCRITÓRIO", 103003, 103],
        ["AR E VENTILAÇÃO", 104001, 104],
        ["BEBEDOUROS E PURIFICADORES", 104002, 104],
        ["COIFAS E DEPURADORES", 104003, 104],
        ["ELETROPORTÁTEIS", 104004, 104],
        ["FORNO E FOGÕES", 104005, 104],
        ["GELADEIRAS E FREEZERS", 104006, 104],
        ["PEÇAS E ACESSÓRIOS", 104007, 104],
        ["INSTRUMENTOS MUSICAIS", 105001, 105],
        ["ACESSÓRIOS", 105002, 105],
        ["AGENDAS", 106001, 106],
        ["ALMOFADAS E CARIMBOS", 106002, 106],
        ["CAIXA ARQUIVO MORTO", 106003, 106],
        ["CAIXAS DE CORRESPONDÊNCIA", 106004, 106],
        ["CANETAS", 106005, 106],
        ["CHAVEIROS PORTA CRACHÁS", 106006, 106],
        ["CLIPS E PRENDEDORES", 106007, 106],
        ["CORDÕES TIRANTES", 106008, 106],
        ["ELÁSTICOS DE BORRACHA", 106009, 106],
        ["ESTOJOS", 106010, 106],
        ["FICHÁRIOS", 106011, 106],
        ["GRAMPOS", 106012, 106],
        ["MOCHILAS", 106013, 106],
        ["MOLHA DEDOS", 106014, 106],
        ["PERCEVEJOS", 106015, 106],
        ["PORTA-FOLHETOS", 106016, 106],
        ["FERRAMENTAS ELÉTRICAS", 107001, 107],
        ["FERRAMENTAS MANUAIS", 107002, 107],
        ["ACESSÓRIOS PARA FERRAMENTAS", 107003, 107],
        ["MEDIÇÕES E INSTRUMENTAÇÃO", 107004, 107],
        ["MAQUINA/EQUIPAMENTO PARA TÊXTIL E CONFECÇÃO", 107005, 107],
        ["MAQUINA/EQUIPAMENTO PARA INDÚSTRIA ALIMENTÍCIA", 107006, 107],
        ["GERAÇÃO DE ENERGIA SOLAR", 108001, 108],
        ["GERAÇÃO DE ENERGIA EÓLICA", 108002, 108],
        ["GERAÇÃO DE ENERGIA HIDRÁULICA", 108003, 108],
        ["GERAÇÃO DE ENERGIA TÉRMICA", 108004, 108],
        ["PROJEÇÃO", 109001, 109],
        ["CAIXAS E AMPLIFICADORES", 109002, 109],
        ["MATERIAIS", 109003, 109],
        ["COMPUTADOR", 110001, 110],
        ["NOTEBOOK", 110002, 110],
        ["IMPRESSORA", 110003, 110],
        ["ESCÂNERES", 110004, 110],
        ["PROJETORES E TELAS", 110005, 110],
        ["ACESSÓRIOS DE PC", 110006, 110],
        ["ACESSÓRIOS PARA NOTEBOOK", 110007, 110],
        ["COMPUTADOR APPLE", 110008, 110],
        ["PEÇAS E MATERIAIS", 110009, 110],
        ["PROGRAMAS E SOFTWARE", 110010, 110],
        ["TABLETES E ACESSÓRIOS", 110011, 110],
        ["COMUNICAÇÃO E TELECOMUNICAÇÃO", 111001, 111],
        ["ACÚSTICO E CARPETE", 111002, 111],
        ["ARAMES GALVANIZADOS", 111003, 111],
        ["DIVISÓRIA E FORRO", 111004, 111],
        ["FERRO PARA CONSTRUÇÃO", 111005, 111],
        ["FIOS E CABOS ELÉTRICOS", 111006, 111],
        ["INSTALAÇÃO ELÉTRICA", 111007, 111],
        ["JARDINAGEM E PAISAGISMO", 111008, 111],
        ["MÁRMORE E GRANITO", 111009, 111],
        ["MATERIAIS ELÉTRICOS", 111010, 111],
        ["PISO E REVESTIMENTO", 111011, 111],
        ["PORTAS E JANELAS", 111012, 111],
        ["TELHADOS DE COBERTURAS", 111013, 111],
        ["TINTA E SOLVENTE", 111014, 111],
        ["TUBOS E CONEXÕES", 111015, 111],
        ["VIDROS E ESQUADRIAS", 111016, 111],
        ["AUTOMAÇÃO COMERCIAL", 112001, 112],
        ["AUTOMAÇÃO INDUSTRIAL", 112002, 112],
        ["AUTOMAÇÃO RESIDENCIAL", 112003, 112],
        ["BALANÇAS COMERCIAIS", 112004, 112],
        ["BOBINA DE PAPEL PDV", 112005, 112],
        ["CAIXA REGISTRADORA", 112006, 112],
        ["ENERGIA SOLAR", 112007, 112],
        ["EQUIPAMENTOS PARA AUTOMAÇÃO", 112008, 112],
        ["IMPRESSORA DE CARTÃO", 112009, 112],
        ["IMPRESSORA FISCAL", 112010, 112],
        ["INSTRUMENTO DE MEDIÇÃO", 112011, 112],
        ["LEITOR DE CÓDIGO DE BARRAS", 112012, 112],
        ["SEGURANÇA ELETRÔNICA", 112013, 112],
        ["SISTEMA DE ESTOQUE", 112014, 112],
        ["MATRIZ BOVINA", 113001, 113],
        ["MATRIZ CAPRINA", 113002, 113],
        ["REPRODUTOR BOVINO", 113003, 113],
        ["REPRODUTOR CAPRINO", 113004, 113],
        ["EQUIPAMENTOS", 114001, 114],
        ["INSUMOS", 114002, 114],
        ["MATERIAIS", 114003, 114],
        ["ASSISTÊNCIA TÉCNICA RURAL", 200001, 200],
        ["ASSESSORIA CONTÁBIL", 200002, 200],
        ["ASSESSORIA DE MARKETING", 200003, 200],
        ["CAPACITAÇÃO", 200004, 200],
        ["TOPOGRAFIA E ESTUDOS GEOTÉCNICOS", 201001, 201],
        ["INSTALAÇÃO ELÉTRICA E HIDRÁULICA", 201002, 201],
        ["PEDREIRO", 201003, 201],
        ["TRANSPORTE", 202001, 202],
        ["MATERIAL IMPRESSO", 203001, 203],
        ["CONFECÇÃO DE BRINDES", 203002, 203],
        ["ELABORAÇÃO DE MATERIAL PUBLICITÁRIO", 203003, 203],
        ["SEGURO PARA VEÍCULOS", 204001, 204],
        ["SEGURO PARA MOTOCICLETAS", 204002, 204],
        ["ESTRADAS, PONTES E VIADUTOS", 300001, 300],
        ["BARRAGENS", 300002, 300],
        ["GEOTÉCNICA", 300003, 300],
        ["CONSTRUÇÃO/REFORMA DE PRÉDIOS", 301001, 301],
        ["INSTALAÇÕES ELETRICAS", 301002, 301],
        ["INSTALAÇÕES SANITÁRIAS", 301003, 301],
        ["INSTALAÇÕES HIDRAULICAS", 301004, 301],
        ["PERFURAÇÃO E INSTALAÇÃO DE POÇOS", 301005, 301],
        ["OBRAS HIDROAMBIENTAIS (BARRAGENS,SUBMERSAS, CISTERNA, ETC)", 301006, 301],
        ["INSTALAÇÃO DE SISTEMAS DE IRRIGAÇÃO", 302001, 302]
      ].freeze

      CLASSIFICATIONS.each do |data|
        Classification.find_or_create_by!(code: data[1]) do |classification|
          classification.name = data[0]
          classification.classification = Classification.find_by(code: data[2]) if data[2].present?
        end
      end
    end
  end
end