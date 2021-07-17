Esse repositório está arquivado. Veja [ABNT-Phi](https://github.com/bcdavasconcelos/ABNT-Phi) para a nova versão.

---


# CSL ABNT para Autores Antigos

[![DOI](zenodo.4305064.svg)](https://zenodo.org/badge/latestdoi/303481460)

Esse é um estilo que adaptei para facilitar a citação de textos antigos utilizando o filtro CITEPROC do Pandoc. O arquivo do estilo pode ser baixado [aqui](https://github.com/bcdavasconcelos/CSL-ABNT-para-Autores-Antigos/blob/main/abnt.csl).


![Esq: fonte | Dir: versão renderizada](./img/biblio.png)

- Para citar a ed. Bekker (ed. crítica de referência que contém a numeração a a partir da qual o texto de Aristóteles é citado), utilizo o tipo `chapter`.
- Para citar as demais edições críticas, utilizo o tipo `legislation`.
- Para citar traduções modernas, utilizo o tipo `report`.

**Justificativa:** Sem algum tipo de adaptação aos arquivos CSL no formato ABNT, seria impossível utilizar de modo satisfatório o processamento automatizado da bibliografia do [Pandoc](https://pandoc.org/MANUAL.html#citation-rendering). Uma citação da ed. Bekker, de uma outra edição crítica qualquer ou de uma tradução do texto, traria sempre o nome do autor para a citação em linha. 

Para corrigir isso, fiz algumas modificações de modo a trazer para a citação em linha a abreviação da obra, no caso da ed. Bekker; o nome do editor, no caso das edições críticas; e o nome do tradutor, no caso das traduções modernas. De modo a evitar interferência na formatação da bibliografia dos tipos tradicionais e mais comuns — como `book` e `journal article` — optei por re-aproveitar outros tipos menos utilizados e de pouca utilidade para os estudos clássicos, como `legislation` e `report`.


| Tipo de referência | Em linha (ABNT tradicional) | Em linha (ABNT modificado) | Tipo utilizado |
| ------------------ | ------------------------ | ------------------------- | -------------- |
| Ed. Bekker         | Aristóteles 1834         | EN                        | chapter        |
| Ed. Crítica        | Aristóteles 1900         | Bywater 1900              | legislation    |
| Tradução           | Aristóteles 2012         | Reeve 2012                | report         |


## Ed. crítica de referência (e.g. Bekker, Stephanus)
**Obj:** Trazer a abreviação da obra para a citação em linha.  
**Obs.:** A abreviação da obra deve estar contida no campo `annote`.  
**Tipo:** `chapter`  

**Citekey:** `@EN` | Exemplo com nr da pág: `@EN 1025b09`  
**Cit em linha:** `EN` | `EN 1025b09`  
**Ref:** `ARISTÓTELES. “Ethica Nicomachea”. In: BEKKER, I. (Ed). Aristotelis Opera. Berlim: Reimer, 1831. (1094a01–1181b23).`   


## Demais edições críticas
**Obj:** Trazer o nome do editor para a citação em linha.  
**Tipo:** `report`  

**Citekey:** `@EN_Bywater`  
**Cit em linha:** `BYWATER 1900`   
**Ref:** `ARISTÓTELES. Ethica Nicomachea (I. Bywater, Ed.). Oxford: Clarendon, 1890.`  

## Traduções modernas
**Obj:** Trazer o nome do tradutor para a citação em linha.  
**Tipo:** `report`  

**Citekey:** `@EN_Reeve` | Exemplo com número da página `@EN_Reeve, p.10`   
**Cit em linha:** `REEVE 2014` | `REEVE 2014, p.10`  
**Ref:** `ARISTÓTELES. Nicomachean ethics. Tradução: C. D. C. Reeve. Indianápolis: Hackett, 2014.`

# Instruções

O Pandoc, além de ser uma ferramenta extremamente útil (por acaso, criada e mantida por um professor de filosofia), tem uma excelente [documentação](https://pandoc.org/MANUAL.html). Por isso, eis apenas algumas direções sobre o arquivo CSL em particular:


- Baixe o conteúdo deste repositório e adicione o estilo à pasta de estilos CSL do Pandoc ou a alguma outra pasta de sua preferência.
- Ao comando de conversão do Pandoc, acrescente o comando `-C --csl=` e o endereço do arquivo CSL.  

No meu caso, o arquivo está na seguinte localização:  

 `~/Dropbox/Application Support/BBEdit/Pandoc/config/refs/ABNT.csl`

Portanto, devo acrescentar:

```bash
-C "--csl=$HOME/Dropbox/Application Support/BBEdit/Pandoc/config/refs/ABNT.csl" 
```

- Não se esqueça, é claro, de acrescentar também o arquivo com a bibliografia (que pode estar em formato json ou BibTeX).

Novamente, no meu caso, está na seguinte localização:

`~/Dropbox/Application Support/BBEdit/Pandoc/config/refs/All.json`

Acrescento, portanto:

```bash
"--bibliography=$HOME/Dropbox/Application Support/BBEdit/Pandoc/config/refs/All.json"
```

## Zotero

Veja a pasta com instruções sobre o Zotero do repositório.


# Exemplo de referência (em formato json):

```json
[
 {
    "annote": "EN",
    "author": [
      {
        "family": "Aristóteles"
      }
    ],
    "container-title": "Aristotelis opera",
    "editor": [
      {
        "family": "Bekker",
        "given": "Immanuel"
      }
    ],
    "id": "EN",
    "issued": {
      "date-parts": [
        [
          1831
        ]
      ]
    },
    "page": "1094a01-1181b23",
    "publisher": "Reimer",
    "publisher-place": "Berlim",
    "title": "Ethica nicomachea",
    "type": "chapter"
  },
  {
    "author": [
      {
        "family": "Aristóteles"
      }
    ],
    "editor": [
      {
        "family": "Bywater",
        "given": "Ingram"
      }
    ],
    "id": "EN_Bywater",
    "issued": {
      "date-parts": [
        [
          1890
        ]
      ]
    },
    "page": "1094a1-1181b23",
    "publisher": "Clarendon",
    "publisher-place": "Oxford",
    "title": "Ethica nicomachea",
    "type": "legislation"
  },
  {
    "author": [
      {
        "family": "Aristóteles"
      }
    ],
    "id": "EN_Reeve",
    "issued": {
      "date-parts": [
        [
          2014
        ]
      ]
    },
    "publisher": "Hackett",
    "publisher-place": "Indianápolis",
    "title": "Nicomachean ethics",
    "translator": [
      {
        "family": "Reeve",
        "given": "C. D. C."
      }
    ],
    "type": "report"
  }
]
```
