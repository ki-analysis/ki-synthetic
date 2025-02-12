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

**Outcome Variable:** stunted

## Predictor Variables

**Intervention Variable:** pers_wast

**Adjustment Set:**

unadjusted

## Stratifying Variables

The analysis was stratified on these variable(s):

* agecat
* studyid
* country

## Data Summary

|agecat    |studyid        |country      |pers_wast | stunted| n_cell|    n|
|:---------|:--------------|:------------|:---------|-------:|------:|----:|
|Birth     |CMC-V-BCS-2002 |INDIA        |0         |       0|     68|   92|
|Birth     |CMC-V-BCS-2002 |INDIA        |0         |       1|     12|   92|
|Birth     |CMC-V-BCS-2002 |INDIA        |1         |       0|      7|   92|
|Birth     |CMC-V-BCS-2002 |INDIA        |1         |       1|      5|   92|
|Birth     |CMIN           |BANGLADESH   |0         |       0|     14|   18|
|Birth     |CMIN           |BANGLADESH   |0         |       1|      2|   18|
|Birth     |CMIN           |BANGLADESH   |1         |       0|      1|   18|
|Birth     |CMIN           |BANGLADESH   |1         |       1|      1|   18|
|Birth     |CONTENT        |PERU         |0         |       0|      2|    2|
|Birth     |CONTENT        |PERU         |0         |       1|      0|    2|
|Birth     |CONTENT        |PERU         |1         |       0|      0|    2|
|Birth     |CONTENT        |PERU         |1         |       1|      0|    2|
|Birth     |EE             |PAKISTAN     |0         |       0|    130|  240|
|Birth     |EE             |PAKISTAN     |0         |       1|     94|  240|
|Birth     |EE             |PAKISTAN     |1         |       0|     10|  240|
|Birth     |EE             |PAKISTAN     |1         |       1|      6|  240|
|Birth     |GMS-Nepal      |NEPAL        |0         |       0|    435|  585|
|Birth     |GMS-Nepal      |NEPAL        |0         |       1|     86|  585|
|Birth     |GMS-Nepal      |NEPAL        |1         |       0|     55|  585|
|Birth     |GMS-Nepal      |NEPAL        |1         |       1|      9|  585|
|Birth     |Keneba         |GAMBIA       |0         |       0|   1303| 1419|
|Birth     |Keneba         |GAMBIA       |0         |       1|     71| 1419|
|Birth     |Keneba         |GAMBIA       |1         |       0|     43| 1419|
|Birth     |Keneba         |GAMBIA       |1         |       1|      2| 1419|
|Birth     |MAL-ED         |INDIA        |0         |       0|     33|   45|
|Birth     |MAL-ED         |INDIA        |0         |       1|     10|   45|
|Birth     |MAL-ED         |INDIA        |1         |       0|      2|   45|
|Birth     |MAL-ED         |INDIA        |1         |       1|      0|   45|
|Birth     |MAL-ED         |BANGLADESH   |0         |       0|    180|  229|
|Birth     |MAL-ED         |BANGLADESH   |0         |       1|     40|  229|
|Birth     |MAL-ED         |BANGLADESH   |1         |       0|      7|  229|
|Birth     |MAL-ED         |BANGLADESH   |1         |       1|      2|  229|
|Birth     |MAL-ED         |PERU         |0         |       0|    207|  233|
|Birth     |MAL-ED         |PERU         |0         |       1|     26|  233|
|Birth     |MAL-ED         |PERU         |1         |       0|      0|  233|
|Birth     |MAL-ED         |PERU         |1         |       1|      0|  233|
|Birth     |MAL-ED         |NEPAL        |0         |       0|     24|   27|
|Birth     |MAL-ED         |NEPAL        |0         |       1|      2|   27|
|Birth     |MAL-ED         |NEPAL        |1         |       0|      1|   27|
|Birth     |MAL-ED         |NEPAL        |1         |       1|      0|   27|
|Birth     |MAL-ED         |BRAZIL       |0         |       0|     56|   65|
|Birth     |MAL-ED         |BRAZIL       |0         |       1|      9|   65|
|Birth     |MAL-ED         |BRAZIL       |1         |       0|      0|   65|
|Birth     |MAL-ED         |BRAZIL       |1         |       1|      0|   65|
|Birth     |MAL-ED         |TANZANIA     |0         |       0|    101|  123|
|Birth     |MAL-ED         |TANZANIA     |0         |       1|     22|  123|
|Birth     |MAL-ED         |TANZANIA     |1         |       0|      0|  123|
|Birth     |MAL-ED         |TANZANIA     |1         |       1|      0|  123|
|Birth     |MAL-ED         |SOUTH AFRICA |0         |       0|    102|  113|
|Birth     |MAL-ED         |SOUTH AFRICA |0         |       1|      9|  113|
|Birth     |MAL-ED         |SOUTH AFRICA |1         |       0|      2|  113|
|Birth     |MAL-ED         |SOUTH AFRICA |1         |       1|      0|  113|
|Birth     |PROVIDE        |BANGLADESH   |0         |       0|    470|  539|
|Birth     |PROVIDE        |BANGLADESH   |0         |       1|     46|  539|
|Birth     |PROVIDE        |BANGLADESH   |1         |       0|     21|  539|
|Birth     |PROVIDE        |BANGLADESH   |1         |       1|      2|  539|
|Birth     |ResPak         |PAKISTAN     |0         |       0|     21|   34|
|Birth     |ResPak         |PAKISTAN     |0         |       1|      9|   34|
|Birth     |ResPak         |PAKISTAN     |1         |       0|      2|   34|
|Birth     |ResPak         |PAKISTAN     |1         |       1|      2|   34|
|Birth     |Vellore Crypto |INDIA        |0         |       0|    279|  387|
|Birth     |Vellore Crypto |INDIA        |0         |       1|     40|  387|
|Birth     |Vellore Crypto |INDIA        |1         |       0|     63|  387|
|Birth     |Vellore Crypto |INDIA        |1         |       1|      5|  387|
|6 months  |CMC-V-BCS-2002 |INDIA        |0         |       0|    219|  365|
|6 months  |CMC-V-BCS-2002 |INDIA        |0         |       1|     94|  365|
|6 months  |CMC-V-BCS-2002 |INDIA        |1         |       0|     35|  365|
|6 months  |CMC-V-BCS-2002 |INDIA        |1         |       1|     17|  365|
|6 months  |CMIN           |BANGLADESH   |0         |       0|    146|  243|
|6 months  |CMIN           |BANGLADESH   |0         |       1|     86|  243|
|6 months  |CMIN           |BANGLADESH   |1         |       0|      4|  243|
|6 months  |CMIN           |BANGLADESH   |1         |       1|      7|  243|
|6 months  |CONTENT        |PERU         |0         |       0|    206|  215|
|6 months  |CONTENT        |PERU         |0         |       1|      9|  215|
|6 months  |CONTENT        |PERU         |1         |       0|      0|  215|
|6 months  |CONTENT        |PERU         |1         |       1|      0|  215|
|6 months  |EE             |PAKISTAN     |0         |       0|    181|  373|
|6 months  |EE             |PAKISTAN     |0         |       1|    166|  373|
|6 months  |EE             |PAKISTAN     |1         |       0|      9|  373|
|6 months  |EE             |PAKISTAN     |1         |       1|     17|  373|
|6 months  |GMS-Nepal      |NEPAL        |0         |       0|    392|  559|
|6 months  |GMS-Nepal      |NEPAL        |0         |       1|    107|  559|
|6 months  |GMS-Nepal      |NEPAL        |1         |       0|     46|  559|
|6 months  |GMS-Nepal      |NEPAL        |1         |       1|     14|  559|
|6 months  |Guatemala BSC  |GUATEMALA    |0         |       0|    189|  276|
|6 months  |Guatemala BSC  |GUATEMALA    |0         |       1|     78|  276|
|6 months  |Guatemala BSC  |GUATEMALA    |1         |       0|      2|  276|
|6 months  |Guatemala BSC  |GUATEMALA    |1         |       1|      7|  276|
|6 months  |Keneba         |GAMBIA       |0         |       0|   1583| 1897|
|6 months  |Keneba         |GAMBIA       |0         |       1|    253| 1897|
|6 months  |Keneba         |GAMBIA       |1         |       0|     38| 1897|
|6 months  |Keneba         |GAMBIA       |1         |       1|     23| 1897|
|6 months  |MAL-ED         |INDIA        |0         |       0|    177|  236|
|6 months  |MAL-ED         |INDIA        |0         |       1|     41|  236|
|6 months  |MAL-ED         |INDIA        |1         |       0|     14|  236|
|6 months  |MAL-ED         |INDIA        |1         |       1|      4|  236|
|6 months  |MAL-ED         |BANGLADESH   |0         |       0|    191|  241|
|6 months  |MAL-ED         |BANGLADESH   |0         |       1|     43|  241|
|6 months  |MAL-ED         |BANGLADESH   |1         |       0|      6|  241|
|6 months  |MAL-ED         |BANGLADESH   |1         |       1|      1|  241|
|6 months  |MAL-ED         |PERU         |0         |       0|    213|  273|
|6 months  |MAL-ED         |PERU         |0         |       1|     60|  273|
|6 months  |MAL-ED         |PERU         |1         |       0|      0|  273|
|6 months  |MAL-ED         |PERU         |1         |       1|      0|  273|
|6 months  |MAL-ED         |NEPAL        |0         |       0|    219|  236|
|6 months  |MAL-ED         |NEPAL        |0         |       1|     11|  236|
|6 months  |MAL-ED         |NEPAL        |1         |       0|      5|  236|
|6 months  |MAL-ED         |NEPAL        |1         |       1|      1|  236|
|6 months  |MAL-ED         |BRAZIL       |0         |       0|    202|  209|
|6 months  |MAL-ED         |BRAZIL       |0         |       1|      6|  209|
|6 months  |MAL-ED         |BRAZIL       |1         |       0|      1|  209|
|6 months  |MAL-ED         |BRAZIL       |1         |       1|      0|  209|
|6 months  |MAL-ED         |TANZANIA     |0         |       0|    188|  247|
|6 months  |MAL-ED         |TANZANIA     |0         |       1|     59|  247|
|6 months  |MAL-ED         |TANZANIA     |1         |       0|      0|  247|
|6 months  |MAL-ED         |TANZANIA     |1         |       1|      0|  247|
|6 months  |MAL-ED         |SOUTH AFRICA |0         |       0|    202|  254|
|6 months  |MAL-ED         |SOUTH AFRICA |0         |       1|     50|  254|
|6 months  |MAL-ED         |SOUTH AFRICA |1         |       0|      2|  254|
|6 months  |MAL-ED         |SOUTH AFRICA |1         |       1|      0|  254|
|6 months  |PROVIDE        |BANGLADESH   |0         |       0|    499|  604|
|6 months  |PROVIDE        |BANGLADESH   |0         |       1|     91|  604|
|6 months  |PROVIDE        |BANGLADESH   |1         |       0|      9|  604|
|6 months  |PROVIDE        |BANGLADESH   |1         |       1|      5|  604|
|6 months  |ResPak         |PAKISTAN     |0         |       0|    125|  227|
|6 months  |ResPak         |PAKISTAN     |0         |       1|     77|  227|
|6 months  |ResPak         |PAKISTAN     |1         |       0|     22|  227|
|6 months  |ResPak         |PAKISTAN     |1         |       1|      3|  227|
|6 months  |TanzaniaChild2 |TANZANIA     |0         |       0|   1776| 2019|
|6 months  |TanzaniaChild2 |TANZANIA     |0         |       1|    192| 2019|
|6 months  |TanzaniaChild2 |TANZANIA     |1         |       0|     47| 2019|
|6 months  |TanzaniaChild2 |TANZANIA     |1         |       1|      4| 2019|
|6 months  |Vellore Crypto |INDIA        |0         |       0|    246|  406|
|6 months  |Vellore Crypto |INDIA        |0         |       1|     91|  406|
|6 months  |Vellore Crypto |INDIA        |1         |       0|     60|  406|
|6 months  |Vellore Crypto |INDIA        |1         |       1|      9|  406|
|24 months |CMC-V-BCS-2002 |INDIA        |0         |       0|     92|  366|
|24 months |CMC-V-BCS-2002 |INDIA        |0         |       1|    219|  366|
|24 months |CMC-V-BCS-2002 |INDIA        |1         |       0|     12|  366|
|24 months |CMC-V-BCS-2002 |INDIA        |1         |       1|     43|  366|
|24 months |CMIN           |BANGLADESH   |0         |       0|     75|  242|
|24 months |CMIN           |BANGLADESH   |0         |       1|    158|  242|
|24 months |CMIN           |BANGLADESH   |1         |       0|      2|  242|
|24 months |CMIN           |BANGLADESH   |1         |       1|      7|  242|
|24 months |CONTENT        |PERU         |0         |       0|    151|  164|
|24 months |CONTENT        |PERU         |0         |       1|     13|  164|
|24 months |CONTENT        |PERU         |1         |       0|      0|  164|
|24 months |CONTENT        |PERU         |1         |       1|      0|  164|
|24 months |EE             |PAKISTAN     |0         |       0|     49|  167|
|24 months |EE             |PAKISTAN     |0         |       1|    107|  167|
|24 months |EE             |PAKISTAN     |1         |       0|      0|  167|
|24 months |EE             |PAKISTAN     |1         |       1|     11|  167|
|24 months |GMS-Nepal      |NEPAL        |0         |       0|    238|  479|
|24 months |GMS-Nepal      |NEPAL        |0         |       1|    192|  479|
|24 months |GMS-Nepal      |NEPAL        |1         |       0|     25|  479|
|24 months |GMS-Nepal      |NEPAL        |1         |       1|     24|  479|
|24 months |Keneba         |GAMBIA       |0         |       0|    931| 1442|
|24 months |Keneba         |GAMBIA       |0         |       1|    464| 1442|
|24 months |Keneba         |GAMBIA       |1         |       0|     23| 1442|
|24 months |Keneba         |GAMBIA       |1         |       1|     24| 1442|
|24 months |MAL-ED         |INDIA        |0         |       0|    116|  227|
|24 months |MAL-ED         |INDIA        |0         |       1|     93|  227|
|24 months |MAL-ED         |INDIA        |1         |       0|     14|  227|
|24 months |MAL-ED         |INDIA        |1         |       1|      4|  227|
|24 months |MAL-ED         |BANGLADESH   |0         |       0|    106|  212|
|24 months |MAL-ED         |BANGLADESH   |0         |       1|    100|  212|
|24 months |MAL-ED         |BANGLADESH   |1         |       0|      5|  212|
|24 months |MAL-ED         |BANGLADESH   |1         |       1|      1|  212|
|24 months |MAL-ED         |PERU         |0         |       0|    127|  201|
|24 months |MAL-ED         |PERU         |0         |       1|     74|  201|
|24 months |MAL-ED         |PERU         |1         |       0|      0|  201|
|24 months |MAL-ED         |PERU         |1         |       1|      0|  201|
|24 months |MAL-ED         |NEPAL        |0         |       0|    174|  228|
|24 months |MAL-ED         |NEPAL        |0         |       1|     48|  228|
|24 months |MAL-ED         |NEPAL        |1         |       0|      4|  228|
|24 months |MAL-ED         |NEPAL        |1         |       1|      2|  228|
|24 months |MAL-ED         |BRAZIL       |0         |       0|    161|  169|
|24 months |MAL-ED         |BRAZIL       |0         |       1|      7|  169|
|24 months |MAL-ED         |BRAZIL       |1         |       0|      1|  169|
|24 months |MAL-ED         |BRAZIL       |1         |       1|      0|  169|
|24 months |MAL-ED         |TANZANIA     |0         |       0|     59|  214|
|24 months |MAL-ED         |TANZANIA     |0         |       1|    155|  214|
|24 months |MAL-ED         |TANZANIA     |1         |       0|      0|  214|
|24 months |MAL-ED         |TANZANIA     |1         |       1|      0|  214|
|24 months |MAL-ED         |SOUTH AFRICA |0         |       0|    152|  238|
|24 months |MAL-ED         |SOUTH AFRICA |0         |       1|     84|  238|
|24 months |MAL-ED         |SOUTH AFRICA |1         |       0|      2|  238|
|24 months |MAL-ED         |SOUTH AFRICA |1         |       1|      0|  238|
|24 months |PROVIDE        |BANGLADESH   |0         |       0|    378|  578|
|24 months |PROVIDE        |BANGLADESH   |0         |       1|    187|  578|
|24 months |PROVIDE        |BANGLADESH   |1         |       0|     10|  578|
|24 months |PROVIDE        |BANGLADESH   |1         |       1|      3|  578|
|24 months |TanzaniaChild2 |TANZANIA     |0         |       0|      5|    6|
|24 months |TanzaniaChild2 |TANZANIA     |0         |       1|      1|    6|
|24 months |TanzaniaChild2 |TANZANIA     |1         |       0|      0|    6|
|24 months |TanzaniaChild2 |TANZANIA     |1         |       1|      0|    6|
|24 months |Vellore Crypto |INDIA        |0         |       0|    190|  408|
|24 months |Vellore Crypto |INDIA        |0         |       1|    149|  408|
|24 months |Vellore Crypto |INDIA        |1         |       0|     46|  408|
|24 months |Vellore Crypto |INDIA        |1         |       1|     23|  408|


The following strata were considered:

* agecat: 24 months, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: 24 months, studyid: CMIN, country: BANGLADESH
* agecat: 24 months, studyid: CONTENT, country: PERU
* agecat: 24 months, studyid: EE, country: PAKISTAN
* agecat: 24 months, studyid: GMS-Nepal, country: NEPAL
* agecat: 24 months, studyid: Keneba, country: GAMBIA
* agecat: 24 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 24 months, studyid: MAL-ED, country: BRAZIL
* agecat: 24 months, studyid: MAL-ED, country: INDIA
* agecat: 24 months, studyid: MAL-ED, country: NEPAL
* agecat: 24 months, studyid: MAL-ED, country: PERU
* agecat: 24 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 24 months, studyid: MAL-ED, country: TANZANIA
* agecat: 24 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 24 months, studyid: TanzaniaChild2, country: TANZANIA
* agecat: 24 months, studyid: Vellore Crypto, country: INDIA
* agecat: 6 months, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: 6 months, studyid: CMIN, country: BANGLADESH
* agecat: 6 months, studyid: CONTENT, country: PERU
* agecat: 6 months, studyid: EE, country: PAKISTAN
* agecat: 6 months, studyid: GMS-Nepal, country: NEPAL
* agecat: 6 months, studyid: Guatemala BSC, country: GUATEMALA
* agecat: 6 months, studyid: Keneba, country: GAMBIA
* agecat: 6 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 6 months, studyid: MAL-ED, country: BRAZIL
* agecat: 6 months, studyid: MAL-ED, country: INDIA
* agecat: 6 months, studyid: MAL-ED, country: NEPAL
* agecat: 6 months, studyid: MAL-ED, country: PERU
* agecat: 6 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 6 months, studyid: MAL-ED, country: TANZANIA
* agecat: 6 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 6 months, studyid: ResPak, country: PAKISTAN
* agecat: 6 months, studyid: TanzaniaChild2, country: TANZANIA
* agecat: 6 months, studyid: Vellore Crypto, country: INDIA
* agecat: Birth, studyid: CMC-V-BCS-2002, country: INDIA
* agecat: Birth, studyid: CMIN, country: BANGLADESH
* agecat: Birth, studyid: CONTENT, country: PERU
* agecat: Birth, studyid: EE, country: PAKISTAN
* agecat: Birth, studyid: GMS-Nepal, country: NEPAL
* agecat: Birth, studyid: Keneba, country: GAMBIA
* agecat: Birth, studyid: MAL-ED, country: BANGLADESH
* agecat: Birth, studyid: MAL-ED, country: BRAZIL
* agecat: Birth, studyid: MAL-ED, country: INDIA
* agecat: Birth, studyid: MAL-ED, country: NEPAL
* agecat: Birth, studyid: MAL-ED, country: PERU
* agecat: Birth, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: Birth, studyid: MAL-ED, country: TANZANIA
* agecat: Birth, studyid: PROVIDE, country: BANGLADESH
* agecat: Birth, studyid: ResPak, country: PAKISTAN
* agecat: Birth, studyid: Vellore Crypto, country: INDIA

### Dropped Strata

Some strata were dropped due to rare outcomes:

* agecat: Birth, studyid: CMIN, country: BANGLADESH
* agecat: Birth, studyid: CONTENT, country: PERU
* agecat: Birth, studyid: Keneba, country: GAMBIA
* agecat: Birth, studyid: MAL-ED, country: INDIA
* agecat: Birth, studyid: MAL-ED, country: BANGLADESH
* agecat: Birth, studyid: MAL-ED, country: PERU
* agecat: Birth, studyid: MAL-ED, country: NEPAL
* agecat: Birth, studyid: MAL-ED, country: BRAZIL
* agecat: Birth, studyid: MAL-ED, country: TANZANIA
* agecat: Birth, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: Birth, studyid: PROVIDE, country: BANGLADESH
* agecat: Birth, studyid: ResPak, country: PAKISTAN
* agecat: 6 months, studyid: CMIN, country: BANGLADESH
* agecat: 6 months, studyid: CONTENT, country: PERU
* agecat: 6 months, studyid: Guatemala BSC, country: GUATEMALA
* agecat: 6 months, studyid: MAL-ED, country: INDIA
* agecat: 6 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 6 months, studyid: MAL-ED, country: PERU
* agecat: 6 months, studyid: MAL-ED, country: NEPAL
* agecat: 6 months, studyid: MAL-ED, country: BRAZIL
* agecat: 6 months, studyid: MAL-ED, country: TANZANIA
* agecat: 6 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 6 months, studyid: ResPak, country: PAKISTAN
* agecat: 6 months, studyid: TanzaniaChild2, country: TANZANIA
* agecat: 24 months, studyid: CMIN, country: BANGLADESH
* agecat: 24 months, studyid: CONTENT, country: PERU
* agecat: 24 months, studyid: EE, country: PAKISTAN
* agecat: 24 months, studyid: MAL-ED, country: INDIA
* agecat: 24 months, studyid: MAL-ED, country: BANGLADESH
* agecat: 24 months, studyid: MAL-ED, country: PERU
* agecat: 24 months, studyid: MAL-ED, country: NEPAL
* agecat: 24 months, studyid: MAL-ED, country: BRAZIL
* agecat: 24 months, studyid: MAL-ED, country: TANZANIA
* agecat: 24 months, studyid: MAL-ED, country: SOUTH AFRICA
* agecat: 24 months, studyid: PROVIDE, country: BANGLADESH
* agecat: 24 months, studyid: TanzaniaChild2, country: TANZANIA





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


