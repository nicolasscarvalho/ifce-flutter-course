// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map toJson() => {
    'nome': _nome
  };
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map toJson() => {
    'nome': _nome,
    'dependentes': _dependentes
  };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map toJson() => {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios
  };
}

void main() {
  // 1. Criar varios objetos Dependentes
  List<Dependente> dependentes_jose = [Dependente('André'), Dependente('Bernado'), Dependente('Carla'), Dependente('Duda')];
  List<Dependente> dependentes_francisco = [Dependente('Eduardo'), Dependente('Fernando'), Dependente('Gabriela'), Dependente('Heloísa')];

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [
    Funcionario('José', dependentes_jose), 
    Funcionario('Francisco', dependentes_francisco)
  ];

  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  EquipeProjeto equipe_projeto = EquipeProjeto('Projeto Flutter', funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  print( jsonDecode(jsonEncode(equipe_projeto)) );
}