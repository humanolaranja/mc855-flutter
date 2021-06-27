import 'package:mc855/entities/class.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/entities/time.dart';

class Mocks {
  static List<Subject> getMySubjects() {
    return [
      Subject(
        "MC855",
        "Projeto em Sistema de Computação",
        [
          Class(
            "A",
            [
              Time(5, 18, 19),
            ],
          )
        ],
        "Instituto de Computação",
        12,
      ),
      Subject(
        "MA311",
        "Cálculo III",
        [
          Class(
            "E",
            [
              Time(1, 18, 19),
              Time(3, 18, 19),
            ],
          ),
          Class(
            "G",
            [
              Time(2, 18, 19),
              Time(4, 18, 19),
            ],
          )
        ],
        "Instituto de Matemática, Estatística e Computação Científica",
        06,
      ),
      Subject(
        "MC504",
        "Sistemas Operacionais",
        [
          Class(
            "A",
            [
              Time(2, 17, 19),
            ],
          )
        ],
        "Instituto de Computação",
        04,
      ),
    ];
  }

  static List<Subject> getSubjects() {
    return [
      Subject(
        "MC855",
        "Projeto em Sistema de Computação",
        [
          Class(
            "A",
            [
              Time(5, 18, 19),
            ],
          )
        ],
        "Instituto de Computação",
        12,
      ),
      Subject(
        "CE304",
        "Direito",
        [],
        "Instituto de Economia",
        02,
      ),
      Subject(
        "CE539",
        "Mét. Quant. Aplic. Admin. Empresas I",
        [],
        "Instituto de Economia",
        03,
      ),
      Subject(
        "CE639",
        "Mét. Quant. Aplic. Admin. Empresas II",
        [],
        "Instituto de Economia",
        03,
      ),
      Subject(
        "CE738",
        "Economia para Engenharia",
        [],
        "Instituto de Economia",
        04,
      ),
      Subject(
        "CE838",
        "Contabilidade para Engenharia",
        [],
        "Instituto de Economia",
        02,
      ),
      Subject(
        "CE839",
        "Intr. à Administração p/ Computação",
        [],
        "Instituto de Economia",
        02,
      ),
      Subject(
        "EA953",
        "Introdução à Otimização de Sistemas",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "EF101",
        "Educação Física Desportiva",
        [],
        "Faculdade de Educação Física",
        02,
      ),
      Subject(
        "F 128",
        "Física Geral I",
        [],
        "Instituto de Física Gleb Wataghin",
        04,
      ),
      Subject(
        "F 129",
        "Física Experimental I",
        [],
        "Instituto de Física Gleb Wataghin",
        02,
      ),
      Subject(
        "F 228",
        "Física Geral II",
        [],
        "Instituto de Física Gleb Wataghin",
        04,
      ),
      Subject(
        "F 229",
        "Física Experimental II",
        [],
        "Instituto de Física Gleb Wataghin",
        02,
      ),
      Subject(
        "LA122",
        "Inglês Instrumental I",
        [],
        "Centro de Ensino de Línguas",
        04,
      ),
      Subject(
        "LA222",
        "Inglês Instrumental II",
        [],
        "Centro de Ensino de Línguas",
        04,
      ),
      Subject(
        "MA111",
        "Cálculo I",
        [],
        "Instituto de Matemática, Estatística e Computação Científica",
        06,
      ),
      Subject(
        "MA141",
        "Geometria Analítica e Vetores",
        [],
        "Instituto de Matemática, Estatística e Computação Científica",
        04,
      ),
      Subject(
        "MA211",
        "Cálculo II",
        [],
        "Instituto de Matemática, Estatística e Computação Científica",
        06,
      ),
      Subject(
        "MA311",
        "Cálculo III",
        [
          Class(
            "E",
            [
              Time(1, 18, 19),
              Time(3, 18, 19),
            ],
          ),
          Class(
            "G",
            [
              Time(2, 18, 19),
              Time(4, 18, 19),
            ],
          )
        ],
        "Instituto de Matemática, Estatística e Computação Científica",
        06,
      ),
      Subject(
        "MA327",
        "Algebra Linear",
        [],
        "Instituto de Matemática, Estatística e Computação Científica",
        04,
      ),
      Subject(
        "MC102",
        "Algorítmos e Programação de Computadores",
        [],
        "Instituto de Computação",
        06,
      ),
      Subject(
        "MC202",
        "Estruturas de Dados",
        [],
        "Instituto de Computação",
        06,
      ),
      Subject(
        "MC326",
        "Estruturas de Arquivos",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC404",
        "Organ. Básica de Comp e Ling de Montagem",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC426",
        "Engenharia de Software",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC427",
        "Laboratório de Engenharia de Software",
        [],
        "Instituto de Computação",
        02,
      ),
      Subject(
        "MC438",
        "Análise de Algoritmos I",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC504",
        "Sistemas Operacionais",
        [
          Class(
            "A",
            [
              Time(2, 17, 19),
            ],
          )
        ],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC505",
        "Laboratório de Sistemas Operacionais",
        [],
        "Instituto de Computação",
        03,
      ),
      Subject(
        "MC522",
        "Organização de Computadores",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC526",
        "Bancos de Dados",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC527",
        "Laboratório de Bancos de Dados",
        [],
        "Instituto de Computação",
        03,
      ),
      Subject(
        "MC538",
        "Análise de Algoritmos II",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC600",
        "Estudo Compar. de Ling. de Programação",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC626",
        "Análise e Projeto de Sist. de Informação",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC627",
        "Lab. de Projeto de Sist. de Informação",
        [],
        "Instituto de Computação",
        03,
      ),
      Subject(
        "MC726",
        "Análise e Proj.de Sist.de Informação II",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC750",
        "Const.de Interfaces Homem-Computador",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC822",
        "Teleprocessamento e Redes",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC906",
        "Introdução à Inteligência Artificial",
        [],
        "Instituto de Computação",
        04,
      ),
      Subject(
        "MC917",
        "Automação de Escritório",
        [],
        "Instituto de Computação",
        02,
      ),
      Subject(
        "ME203",
        "Estatística Elementar",
        [],
        "Instituto de Matemática, Estatística e Computação Científica",
        04,
      ),
      Subject(
        "MS211",
        "Cálculo Numérico",
        [],
        "Instituto de Matemática, Estatística e Computação Científica",
        04,
      ),
    ];
  }
}
