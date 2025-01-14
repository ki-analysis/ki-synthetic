---
title: "Risk Factor Analysis"
output: 
  html_document:
    keep_md: TRUE
    self_contained: true
required_packages:  ['github://HBGD-UCB/longbowRiskFactors','github://jeremyrcoyle/skimr@vector_types', 'github://tlverse/delayed']
params:
  roles:
    value:
      - exclude
      - strata
      - id
      - W
      - A
      - Y
  data: 
    value: 
      type: 'web'
      uri: 'https://raw.githubusercontent.com/HBGD-UCB/longbowRiskFactors/master/inst/sample_data/birthwt_data.rdata'
  nodes:
    value:
      strata: ['study_id', 'mrace']
      id: ['subjid']
      W: ['apgar1', 'apgar5', 'gagebrth', 'mage', 'meducyrs', 'sexn']
      A: ['parity_cat']
      Y: ['haz01']
  script_params:
    value:
      parallelize:
        input: checkbox
        value: FALSE
      count_A:
        input: checkbox
        value: TRUE
      count_Y:
        input: checkbox
        value: TRUE        
      baseline_level:
        input: 'character'
        value: "[1,2)"
  output_directory:
    value: ''
editor_options: 
  chunk_output_type: console
---







## Methods
## Outcome Variable

**Outcome Variable:** sstunted

## Predictor Variables

**Intervention Variable:** impfloor

**Adjustment Set:**

unadjusted

## Stratifying Variables

The analysis was stratified on these variable(s):

* agecat
* studyid
* country

## Data Summary

|agecat    |studyid        |country      |impfloor | sstunted| n_cell|     n|
|:---------|:--------------|:------------|:--------|--------:|------:|-----:|
|Birth     |CMC-V-BCS-2002 |INDIA        |1        |        0|     61|    64|
|Birth     |CMC-V-BCS-2002 |INDIA        |1        |        1|      3|    64|
|Birth     |CMC-V-BCS-2002 |INDIA        |0        |        0|      0|    64|
|Birth     |CMC-V-BCS-2002 |INDIA        |0        |        1|      0|    64|
|Birth     |CONTENT        |PERU         |1        |        0|      2|     2|
|Birth     |CONTENT        |PERU         |1        |        1|      0|     2|
|Birth     |CONTENT        |PERU         |0        |        0|      0|     2|
|Birth     |CONTENT        |PERU         |0        |        1|      0|     2|
|Birth     |GMS-Nepal      |NEPAL        |1        |        0|     93|   555|
|Birth     |GMS-Nepal      |NEPAL        |1        |        1|      1|   555|
|Birth     |GMS-Nepal      |NEPAL        |0        |        0|    440|   555|
|Birth     |GMS-Nepal      |NEPAL        |0        |        1|     21|   555|
|Birth     |JiVitA-3       |BANGLADESH   |1        |        0|   1574| 22400|
|Birth     |JiVitA-3       |BANGLADESH   |1        |        1|    167| 22400|
|Birth     |JiVitA-3       |BANGLADESH   |0        |        0|  18385| 22400|
|Birth     |JiVitA-3       |BANGLADESH   |0        |        1|   2274| 22400|
|Birth     |JiVitA-4       |BANGLADESH   |1        |        0|    336|  2821|
|Birth     |JiVitA-4       |BANGLADESH   |1        |        1|     16|  2821|
|Birth     |JiVitA-4       |BANGLADESH   |0        |        0|   2252|  2821|
|Birth     |JiVitA-4       |BANGLADESH   |0        |        1|    217|  2821|
|Birth     |MAL-ED         |INDIA        |1        |        0|     39|    46|
|Birth     |MAL-ED         |INDIA        |1        |        1|      2|    46|
|Birth     |MAL-ED         |INDIA        |0        |        0|      5|    46|
|Birth     |MAL-ED         |INDIA        |0        |        1|      0|    46|
|Birth     |MAL-ED         |BANGLADESH   |1        |        0|    191|   212|
|Birth     |MAL-ED         |BANGLADESH   |1        |        1|      5|   212|
|Birth     |MAL-ED         |BANGLADESH   |0        |        0|     13|   212|
|Birth     |MAL-ED         |BANGLADESH   |0        |        1|      3|   212|
|Birth     |MAL-ED         |PERU         |1        |        0|     34|   217|
|Birth     |MAL-ED         |PERU         |1        |        1|      1|   217|
|Birth     |MAL-ED         |PERU         |0        |        0|    180|   217|
|Birth     |MAL-ED         |PERU         |0        |        1|      2|   217|
|Birth     |MAL-ED         |NEPAL        |1        |        0|     11|    26|
|Birth     |MAL-ED         |NEPAL        |1        |        1|      1|    26|
|Birth     |MAL-ED         |NEPAL        |0        |        0|     14|    26|
|Birth     |MAL-ED         |NEPAL        |0        |        1|      0|    26|
|Birth     |MAL-ED         |BRAZIL       |1        |        0|     51|    55|
|Birth     |MAL-ED         |BRAZIL       |1        |        1|      3|    55|
|Birth     |MAL-ED         |BRAZIL       |0        |        0|      1|    55|
|Birth     |MAL-ED         |BRAZIL       |0        |        1|      0|    55|
|Birth     |MAL-ED         |TANZANIA     |1        |        0|      4|   117|
|Birth     |MAL-ED         |TANZANIA     |1        |        1|      0|   117|
|Birth     |MAL-ED         |TANZANIA     |0        |        0|    105|   117|
|Birth     |MAL-ED         |TANZANIA     |0        |        1|      8|   117|
|Birth     |MAL-ED         |SOUTH AFRICA |1        |        0|     91|   107|
|Birth     |MAL-ED         |SOUTH AFRICA |1        |        1|      2|   107|
|Birth     |MAL-ED         |SOUTH AFRICA |0        |        0|     14|   107|
|Birth     |MAL-ED         |SOUTH AFRICA |0        |        1|      0|   107|
|Birth     |NIH-Birth      |BANGLADESH   |1        |        0|    519|   606|
|Birth     |NIH-Birth      |BANGLADESH   |1        |        1|     18|   606|
|Birth     |NIH-Birth      |BANGLADESH   |0        |        0|     68|   606|
|Birth     |NIH-Birth      |BANGLADESH   |0        |        1|      1|   606|
|Birth     |NIH-Crypto     |BANGLADESH   |1        |        0|    569|   732|
|Birth     |NIH-Crypto     |BANGLADESH   |1        |        1|      9|   732|
|Birth     |NIH-Crypto     |BANGLADESH   |0        |        0|    153|   732|
|Birth     |NIH-Crypto     |BANGLADESH   |0        |        1|      1|   732|
|Birth     |PROVIDE        |BANGLADESH   |1        |        0|    490|   539|
|Birth     |PROVIDE        |BANGLADESH   |1        |        1|      4|   539|
|Birth     |PROVIDE        |BANGLADESH   |0        |        0|     45|   539|
|Birth     |PROVIDE        |BANGLADESH   |0        |        1|      0|   539|
|Birth     |Vellore Crypto |INDIA        |1        |        0|    283|   295|
|Birth     |Vellore Crypto |INDIA        |1        |        1|     12|   295|
|Birth     |Vellore Crypto |INDIA        |0        |        0|      0|   295|
|Birth     |Vellore Crypto |INDIA        |0        |        1|      0|   295|
|6 months  |CMC-V-BCS-2002 |INDIA        |1        |        0|    241|   267|
|6 months  |CMC-V-BCS-2002 |INDIA        |1        |        1|     26|   267|
|6 months  |CMC-V-BCS-2002 |INDIA        |0        |        0|      0|   267|
|6 months  |CMC-V-BCS-2002 |INDIA        |0        |        1|      0|   267|
|6 months  |CONTENT        |PERU         |1        |        0|    194|   215|
|6 months  |CONTENT        |PERU         |1        |        1|      1|   215|
|6 months  |CONTENT        |PERU         |0        |        0|     20|   215|
|6 months  |CONTENT        |PERU         |0        |        1|      0|   215|
|6 months  |GMS-Nepal      |NEPAL        |1        |        0|     77|   445|
|6 months  |GMS-Nepal      |NEPAL        |1        |        1|      1|   445|
|6 months  |GMS-Nepal      |NEPAL        |0        |        0|    354|   445|
|6 months  |GMS-Nepal      |NEPAL        |0        |        1|     13|   445|
|6 months  |JiVitA-3       |BANGLADESH   |1        |        0|   1401| 16770|
|6 months  |JiVitA-3       |BANGLADESH   |1        |        1|     75| 16770|
|6 months  |JiVitA-3       |BANGLADESH   |0        |        0|  14354| 16770|
|6 months  |JiVitA-3       |BANGLADESH   |0        |        1|    940| 16770|
|6 months  |JiVitA-4       |BANGLADESH   |1        |        0|    578|  4827|
|6 months  |JiVitA-4       |BANGLADESH   |1        |        1|     28|  4827|
|6 months  |JiVitA-4       |BANGLADESH   |0        |        0|   3978|  4827|
|6 months  |JiVitA-4       |BANGLADESH   |0        |        1|    243|  4827|
|6 months  |MAL-ED         |INDIA        |1        |        0|    200|   227|
|6 months  |MAL-ED         |INDIA        |1        |        1|      8|   227|
|6 months  |MAL-ED         |INDIA        |0        |        0|     18|   227|
|6 months  |MAL-ED         |INDIA        |0        |        1|      1|   227|
|6 months  |MAL-ED         |BANGLADESH   |1        |        0|    200|   224|
|6 months  |MAL-ED         |BANGLADESH   |1        |        1|      7|   224|
|6 months  |MAL-ED         |BANGLADESH   |0        |        0|     16|   224|
|6 months  |MAL-ED         |BANGLADESH   |0        |        1|      1|   224|
|6 months  |MAL-ED         |PERU         |1        |        0|     42|   255|
|6 months  |MAL-ED         |PERU         |1        |        1|      2|   255|
|6 months  |MAL-ED         |PERU         |0        |        0|    204|   255|
|6 months  |MAL-ED         |PERU         |0        |        1|      7|   255|
|6 months  |MAL-ED         |NEPAL        |1        |        0|    103|   228|
|6 months  |MAL-ED         |NEPAL        |1        |        1|      0|   228|
|6 months  |MAL-ED         |NEPAL        |0        |        0|    124|   228|
|6 months  |MAL-ED         |NEPAL        |0        |        1|      1|   228|
|6 months  |MAL-ED         |BRAZIL       |1        |        0|    184|   187|
|6 months  |MAL-ED         |BRAZIL       |1        |        1|      0|   187|
|6 months  |MAL-ED         |BRAZIL       |0        |        0|      3|   187|
|6 months  |MAL-ED         |BRAZIL       |0        |        1|      0|   187|
|6 months  |MAL-ED         |TANZANIA     |1        |        0|      6|   240|
|6 months  |MAL-ED         |TANZANIA     |1        |        1|      0|   240|
|6 months  |MAL-ED         |TANZANIA     |0        |        0|    220|   240|
|6 months  |MAL-ED         |TANZANIA     |0        |        1|     14|   240|
|6 months  |MAL-ED         |SOUTH AFRICA |1        |        0|    204|   230|
|6 months  |MAL-ED         |SOUTH AFRICA |1        |        1|      6|   230|
|6 months  |MAL-ED         |SOUTH AFRICA |0        |        0|     20|   230|
|6 months  |MAL-ED         |SOUTH AFRICA |0        |        1|      0|   230|
|6 months  |NIH-Birth      |BANGLADESH   |1        |        0|    443|   535|
|6 months  |NIH-Birth      |BANGLADESH   |1        |        1|     31|   535|
|6 months  |NIH-Birth      |BANGLADESH   |0        |        0|     57|   535|
|6 months  |NIH-Birth      |BANGLADESH   |0        |        1|      4|   535|
|6 months  |NIH-Crypto     |BANGLADESH   |1        |        0|    550|   715|
|6 months  |NIH-Crypto     |BANGLADESH   |1        |        1|     16|   715|
|6 months  |NIH-Crypto     |BANGLADESH   |0        |        0|    142|   715|
|6 months  |NIH-Crypto     |BANGLADESH   |0        |        1|      7|   715|
|6 months  |PROVIDE        |BANGLADESH   |1        |        0|    545|   604|
|6 months  |PROVIDE        |BANGLADESH   |1        |        1|     14|   604|
|6 months  |PROVIDE        |BANGLADESH   |0        |        0|     45|   604|
|6 months  |PROVIDE        |BANGLADESH   |0        |        1|      0|   604|
|6 months  |Vellore Crypto |INDIA        |1        |        0|    289|   312|
|6 months  |Vellore Crypto |INDIA        |1        |        1|     23|   312|
|6 months  |Vellore Crypto |INDIA        |0        |        0|      0|   312|
|6 months  |Vellore Crypto |INDIA        |0        |        1|      0|   312|
|24 months |CMC-V-BCS-2002 |INDIA        |1        |        0|    184|   268|
|24 months |CMC-V-BCS-2002 |INDIA        |1        |        1|     84|   268|
|24 months |CMC-V-BCS-2002 |INDIA        |0        |        0|      0|   268|
|24 months |CMC-V-BCS-2002 |INDIA        |0        |        1|      0|   268|
|24 months |CONTENT        |PERU         |1        |        0|    148|   164|
|24 months |CONTENT        |PERU         |1        |        1|      1|   164|
|24 months |CONTENT        |PERU         |0        |        0|     15|   164|
|24 months |CONTENT        |PERU         |0        |        1|      0|   164|
|24 months |GMS-Nepal      |NEPAL        |1        |        0|     61|   390|
|24 months |GMS-Nepal      |NEPAL        |1        |        1|      9|   390|
|24 months |GMS-Nepal      |NEPAL        |0        |        0|    291|   390|
|24 months |GMS-Nepal      |NEPAL        |0        |        1|     29|   390|
|24 months |JiVitA-3       |BANGLADESH   |1        |        0|    603|  8610|
|24 months |JiVitA-3       |BANGLADESH   |1        |        1|     87|  8610|
|24 months |JiVitA-3       |BANGLADESH   |0        |        0|   6663|  8610|
|24 months |JiVitA-3       |BANGLADESH   |0        |        1|   1257|  8610|
|24 months |JiVitA-4       |BANGLADESH   |1        |        0|    560|  4748|
|24 months |JiVitA-4       |BANGLADESH   |1        |        1|     42|  4748|
|24 months |JiVitA-4       |BANGLADESH   |0        |        0|   3736|  4748|
|24 months |JiVitA-4       |BANGLADESH   |0        |        1|    410|  4748|
|24 months |MAL-ED         |INDIA        |1        |        0|    175|   218|
|24 months |MAL-ED         |INDIA        |1        |        1|     26|   218|
|24 months |MAL-ED         |INDIA        |0        |        0|     13|   218|
|24 months |MAL-ED         |INDIA        |0        |        1|      4|   218|
|24 months |MAL-ED         |BANGLADESH   |1        |        0|    157|   195|
|24 months |MAL-ED         |BANGLADESH   |1        |        1|     22|   195|
|24 months |MAL-ED         |BANGLADESH   |0        |        0|     14|   195|
|24 months |MAL-ED         |BANGLADESH   |0        |        1|      2|   195|
|24 months |MAL-ED         |PERU         |1        |        0|     28|   185|
|24 months |MAL-ED         |PERU         |1        |        1|      2|   185|
|24 months |MAL-ED         |PERU         |0        |        0|    144|   185|
|24 months |MAL-ED         |PERU         |0        |        1|     11|   185|
|24 months |MAL-ED         |NEPAL        |1        |        0|     95|   220|
|24 months |MAL-ED         |NEPAL        |1        |        1|      4|   220|
|24 months |MAL-ED         |NEPAL        |0        |        0|    118|   220|
|24 months |MAL-ED         |NEPAL        |0        |        1|      3|   220|
|24 months |MAL-ED         |BRAZIL       |1        |        0|    145|   148|
|24 months |MAL-ED         |BRAZIL       |1        |        1|      1|   148|
|24 months |MAL-ED         |BRAZIL       |0        |        0|      2|   148|
|24 months |MAL-ED         |BRAZIL       |0        |        1|      0|   148|
|24 months |MAL-ED         |TANZANIA     |1        |        0|      5|   209|
|24 months |MAL-ED         |TANZANIA     |1        |        1|      1|   209|
|24 months |MAL-ED         |TANZANIA     |0        |        0|    134|   209|
|24 months |MAL-ED         |TANZANIA     |0        |        1|     69|   209|
|24 months |MAL-ED         |SOUTH AFRICA |1        |        0|    173|   215|
|24 months |MAL-ED         |SOUTH AFRICA |1        |        1|     23|   215|
|24 months |MAL-ED         |SOUTH AFRICA |0        |        0|     18|   215|
|24 months |MAL-ED         |SOUTH AFRICA |0        |        1|      1|   215|
|24 months |NIH-Birth      |BANGLADESH   |1        |        0|    295|   428|
|24 months |NIH-Birth      |BANGLADESH   |1        |        1|     83|   428|
|24 months |NIH-Birth      |BANGLADESH   |0        |        0|     38|   428|
|24 months |NIH-Birth      |BANGLADESH   |0        |        1|     12|   428|
|24 months |NIH-Crypto     |BANGLADESH   |1        |        0|    381|   514|
|24 months |NIH-Crypto     |BANGLADESH   |1        |        1|     24|   514|
|24 months |NIH-Crypto     |BANGLADESH   |0        |        0|     97|   514|
|24 months |NIH-Crypto     |BANGLADESH   |0        |        1|     12|   514|
|24 months |PROVIDE        |BANGLADESH   |1        |        0|    487|   578|
|24 months |PROVIDE        |BANGLADESH   |1        |        1|     49|   578|
|24 months |PROVIDE        |BANGLADESH   |0        |        0|     39|   578|
|24 months |PROVIDE        |BANGLADESH   |0        |        1|      3|   578|
|24 months |Vellore Crypto |INDIA        |1        |        0|    282|   314|
|24 months |Vellore Crypto |INDIA        |1        |        1|     32|   314|
|24 months |Vellore Crypto |INDIA        |0        |        0|      0|   314|
|24 months |Vellore Crypto |INDIA        |0        |        1|      0|   314|


The following strata were considered:

* agecat: 24 months, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: 24 months, studyid: CONTENT, country: PERU
* agecat: 24 months, studyid: GMS-Nepal, country: NEPAL
* agecat: 24 months, studyid: JiVitA-3, country: BANGLADESH
* agecat: 24 months, studyid: JiVitA-4, country: BANGLADESH
* agecat: 24 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 24 months, studyid: MAL-ED, country: BRAZIL
* agecat: 24 months, studyid: MAL-ED, country: INDIA
* agecat: 24 months, studyid: MAL-ED, country: NEPAL
* agecat: 24 months, studyid: MAL-ED, country: PERU
* agecat: 24 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 24 months, studyid: MAL-ED, country: TANZANIA
* agecat: 24 months, studyid: NIH-Birth, country: BANGLADESH
* agecat: 24 months, studyid: NIH-Crypto, country: BANGLADESH
* agecat: 24 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 24 months, studyid: Vellore Crypto, country: INDIA
* agecat: 6 months, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: 6 months, studyid: CONTENT, country: PERU
* agecat: 6 months, studyid: GMS-Nepal, country: NEPAL
* agecat: 6 months, studyid: JiVitA-3, country: BANGLADESH
* agecat: 6 months, studyid: JiVitA-4, country: BANGLADESH
* agecat: 6 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 6 months, studyid: MAL-ED, country: BRAZIL
* agecat: 6 months, studyid: MAL-ED, country: INDIA
* agecat: 6 months, studyid: MAL-ED, country: NEPAL
* agecat: 6 months, studyid: MAL-ED, country: PERU
* agecat: 6 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 6 months, studyid: MAL-ED, country: TANZANIA
* agecat: 6 months, studyid: NIH-Birth, country: BANGLADESH
* agecat: 6 months, studyid: NIH-Crypto, country: BANGLADESH
* agecat: 6 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 6 months, studyid: Vellore Crypto, country: INDIA
* agecat: Birth, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: Birth, studyid: CONTENT, country: PERU
* agecat: Birth, studyid: GMS-Nepal, country: NEPAL
* agecat: Birth, studyid: JiVitA-3, country: BANGLADESH
* agecat: Birth, studyid: JiVitA-4, country: BANGLADESH
* agecat: Birth, studyid: MAL-ED, country: BANGLADESH
* agecat: Birth, studyid: MAL-ED, country: BRAZIL
* agecat: Birth, studyid: MAL-ED, country: INDIA
* agecat: Birth, studyid: MAL-ED, country: NEPAL
* agecat: Birth, studyid: MAL-ED, country: PERU
* agecat: Birth, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: Birth, studyid: MAL-ED, country: TANZANIA
* agecat: Birth, studyid: NIH-Birth, country: BANGLADESH
* agecat: Birth, studyid: NIH-Crypto, country: BANGLADESH
* agecat: Birth, studyid: PROVIDE, country: BANGLADESH
* agecat: Birth, studyid: Vellore Crypto, country: INDIA

### Dropped Strata

Some strata were dropped due to rare outcomes:

* agecat: Birth, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: Birth, studyid: CONTENT, country: PERU
* agecat: Birth, studyid: GMS-Nepal, country: NEPAL
* agecat: Birth, studyid: MAL-ED, country: INDIA
* agecat: Birth, studyid: MAL-ED, country: BANGLADESH
* agecat: Birth, studyid: MAL-ED, country: PERU
* agecat: Birth, studyid: MAL-ED, country: NEPAL
* agecat: Birth, studyid: MAL-ED, country: BRAZIL
* agecat: Birth, studyid: MAL-ED, country: TANZANIA
* agecat: Birth, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: Birth, studyid: NIH-Birth, country: BANGLADESH
* agecat: Birth, studyid: NIH-Crypto, country: BANGLADESH
* agecat: Birth, studyid: PROVIDE, country: BANGLADESH
* agecat: Birth, studyid: Vellore Crypto, country: INDIA
* agecat: 6 months, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: 6 months, studyid: CONTENT, country: PERU
* agecat: 6 months, studyid: GMS-Nepal, country: NEPAL
* agecat: 6 months, studyid: MAL-ED, country: INDIA
* agecat: 6 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 6 months, studyid: MAL-ED, country: PERU
* agecat: 6 months, studyid: MAL-ED, country: NEPAL
* agecat: 6 months, studyid: MAL-ED, country: BRAZIL
* agecat: 6 months, studyid: MAL-ED, country: TANZANIA
* agecat: 6 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 6 months, studyid: NIH-Birth, country: BANGLADESH
* agecat: 6 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 6 months, studyid: Vellore Crypto, country: INDIA
* agecat: 24 months, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: 24 months, studyid: CONTENT, country: PERU
* agecat: 24 months, studyid: MAL-ED, country: INDIA
* agecat: 24 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 24 months, studyid: MAL-ED, country: PERU
* agecat: 24 months, studyid: MAL-ED, country: NEPAL
* agecat: 24 months, studyid: MAL-ED, country: BRAZIL
* agecat: 24 months, studyid: MAL-ED, country: TANZANIA
* agecat: 24 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 24 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 24 months, studyid: Vellore Crypto, country: INDIA





```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_mean is not a
## cv-aware learner, so self$predict_fold reverts to self$predict
```

```
## Warning in learner$predict_fold(learner_task, fold_number): Lrnr_glm_TRUE is not
## a cv-aware learner, so self$predict_fold reverts to self$predict
```


