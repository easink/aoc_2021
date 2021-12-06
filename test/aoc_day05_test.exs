defmodule AoCDay05Test do
  use ExUnit.Case, async: true

  @test_input """
  0,9 -> 5,9
  8,0 -> 0,8
  9,4 -> 3,4
  2,2 -> 2,1
  7,0 -> 7,4
  6,4 -> 2,0
  0,9 -> 2,9
  3,4 -> 1,4
  0,0 -> 8,8
  5,5 -> 8,2
  """

  @input """
  822,976 -> 822,117
  387,419 -> 387,468
  659,275 -> 318,616
  535,940 -> 684,940
  294,427 -> 294,88
  568,922 -> 425,779
  99,265 -> 97,267
  534,387 -> 402,387
  958,268 -> 958,315
  234,714 -> 234,305
  507,257 -> 507,328
  455,384 -> 455,645
  483,641 -> 483,138
  410,249 -> 825,249
  609,836 -> 528,836
  77,913 -> 77,780
  478,93 -> 478,123
  391,695 -> 715,695
  972,586 -> 649,586
  936,955 -> 39,58
  168,791 -> 944,15
  934,222 -> 811,222
  372,683 -> 372,93
  911,676 -> 771,816
  147,34 -> 147,97
  524,498 -> 986,960
  791,924 -> 239,372
  293,145 -> 776,628
  195,472 -> 195,31
  884,649 -> 215,649
  95,53 -> 95,966
  484,111 -> 866,493
  564,913 -> 681,913
  36,362 -> 486,362
  762,146 -> 762,323
  330,334 -> 937,334
  704,714 -> 744,714
  56,12 -> 958,914
  855,784 -> 855,629
  206,665 -> 206,681
  436,629 -> 117,948
  414,685 -> 414,54
  788,401 -> 788,842
  442,270 -> 309,270
  606,711 -> 416,521
  45,630 -> 45,543
  221,192 -> 221,537
  629,544 -> 417,544
  362,605 -> 885,605
  988,928 -> 738,678
  460,758 -> 981,237
  561,26 -> 561,409
  543,186 -> 833,186
  963,409 -> 910,462
  55,129 -> 742,816
  245,27 -> 806,27
  318,137 -> 318,592
  762,700 -> 762,483
  436,341 -> 436,654
  641,725 -> 641,227
  486,446 -> 56,16
  113,821 -> 113,196
  740,534 -> 821,534
  606,765 -> 125,284
  614,786 -> 371,786
  215,519 -> 215,814
  274,496 -> 482,496
  131,210 -> 473,552
  701,68 -> 701,395
  81,713 -> 81,104
  458,677 -> 622,677
  237,225 -> 237,810
  384,246 -> 384,644
  411,876 -> 445,910
  182,814 -> 182,184
  643,858 -> 407,858
  698,621 -> 971,348
  309,253 -> 511,51
  990,368 -> 671,368
  129,619 -> 750,619
  382,803 -> 382,635
  629,270 -> 415,484
  550,101 -> 56,595
  971,745 -> 971,589
  353,947 -> 786,514
  71,931 -> 974,28
  915,621 -> 363,69
  650,547 -> 650,596
  884,228 -> 574,228
  833,476 -> 833,824
  24,722 -> 24,885
  401,508 -> 401,553
  452,106 -> 740,106
  255,840 -> 60,840
  551,609 -> 551,767
  799,572 -> 356,129
  343,138 -> 945,740
  77,766 -> 77,72
  190,760 -> 190,341
  978,583 -> 911,583
  557,18 -> 557,640
  673,276 -> 882,276
  143,348 -> 775,980
  776,803 -> 776,812
  38,348 -> 38,463
  648,567 -> 210,567
  468,934 -> 534,868
  966,987 -> 26,47
  471,465 -> 126,465
  26,29 -> 940,943
  416,340 -> 361,285
  702,66 -> 702,673
  34,964 -> 951,47
  156,791 -> 65,791
  635,678 -> 355,678
  898,13 -> 898,909
  644,334 -> 644,155
  304,93 -> 445,93
  946,934 -> 930,918
  376,289 -> 317,348
  460,491 -> 500,491
  761,605 -> 866,710
  252,534 -> 413,534
  178,23 -> 895,740
  677,90 -> 677,592
  905,985 -> 211,291
  963,65 -> 963,214
  853,617 -> 815,617
  576,532 -> 319,275
  134,59 -> 829,754
  926,948 -> 11,33
  46,279 -> 760,279
  60,389 -> 60,340
  49,264 -> 561,776
  912,322 -> 790,322
  825,205 -> 825,433
  637,693 -> 780,693
  891,196 -> 200,196
  537,604 -> 604,604
  870,75 -> 870,342
  518,173 -> 455,110
  666,67 -> 919,67
  536,128 -> 137,527
  698,41 -> 44,41
  936,982 -> 106,152
  780,488 -> 780,918
  968,313 -> 56,313
  759,36 -> 140,36
  111,605 -> 111,430
  609,165 -> 54,720
  388,452 -> 745,809
  986,12 -> 11,987
  193,614 -> 335,756
  113,239 -> 38,164
  715,145 -> 305,555
  632,13 -> 508,137
  698,673 -> 698,101
  954,225 -> 720,225
  626,688 -> 626,476
  636,697 -> 91,152
  228,210 -> 621,210
  83,325 -> 989,325
  644,358 -> 644,648
  481,183 -> 481,901
  803,160 -> 250,713
  648,96 -> 913,96
  921,17 -> 26,912
  844,256 -> 844,485
  190,138 -> 578,526
  383,527 -> 357,501
  529,212 -> 757,440
  646,399 -> 944,399
  961,681 -> 961,178
  40,236 -> 484,680
  432,465 -> 832,465
  988,989 -> 10,11
  850,800 -> 850,292
  25,97 -> 372,97
  383,248 -> 383,125
  577,488 -> 852,763
  607,322 -> 432,147
  611,637 -> 614,637
  853,677 -> 755,677
  953,225 -> 953,333
  984,978 -> 45,39
  95,981 -> 314,981
  550,400 -> 327,177
  929,893 -> 99,63
  958,293 -> 152,293
  68,656 -> 563,161
  45,506 -> 45,925
  271,566 -> 289,566
  460,440 -> 920,900
  392,788 -> 392,263
  946,335 -> 946,171
  833,405 -> 876,448
  268,188 -> 268,678
  881,40 -> 30,40
  317,84 -> 277,84
  415,917 -> 415,358
  28,654 -> 28,646
  346,461 -> 346,724
  935,954 -> 935,362
  121,840 -> 121,38
  29,55 -> 344,370
  774,649 -> 621,649
  31,985 -> 396,620
  85,579 -> 85,131
  181,886 -> 978,89
  284,969 -> 284,95
  669,943 -> 54,328
  72,509 -> 72,857
  460,557 -> 986,31
  555,460 -> 555,928
  921,961 -> 666,706
  11,13 -> 951,953
  173,948 -> 173,982
  680,422 -> 503,245
  443,232 -> 443,630
  829,487 -> 773,487
  176,631 -> 631,176
  860,866 -> 559,866
  317,537 -> 624,537
  937,199 -> 753,199
  484,545 -> 293,736
  84,616 -> 489,211
  340,166 -> 340,876
  47,210 -> 47,961
  852,404 -> 852,804
  831,565 -> 454,188
  236,621 -> 556,941
  734,640 -> 734,728
  756,357 -> 756,433
  102,220 -> 157,220
  153,800 -> 104,849
  710,585 -> 710,666
  724,298 -> 724,698
  762,257 -> 123,896
  402,642 -> 402,964
  549,108 -> 945,108
  301,966 -> 851,966
  399,903 -> 101,605
  194,857 -> 605,857
  291,373 -> 85,373
  601,597 -> 844,597
  362,335 -> 362,107
  769,66 -> 107,66
  49,373 -> 49,143
  96,800 -> 894,800
  468,116 -> 557,116
  549,206 -> 956,206
  918,972 -> 35,89
  688,632 -> 106,632
  267,338 -> 414,485
  258,392 -> 258,107
  604,964 -> 139,499
  975,191 -> 977,191
  861,960 -> 93,192
  979,570 -> 439,570
  961,21 -> 63,919
  312,419 -> 881,419
  507,779 -> 507,79
  775,447 -> 645,447
  34,928 -> 626,928
  786,515 -> 786,34
  81,269 -> 734,922
  938,264 -> 266,264
  799,271 -> 799,713
  765,860 -> 765,43
  967,869 -> 135,37
  920,757 -> 602,439
  419,814 -> 655,814
  22,40 -> 472,490
  136,672 -> 770,672
  667,860 -> 288,481
  311,305 -> 311,674
  163,569 -> 163,120
  801,885 -> 139,223
  551,214 -> 551,207
  594,979 -> 942,631
  347,286 -> 448,185
  161,134 -> 855,828
  861,864 -> 20,23
  309,388 -> 309,676
  582,383 -> 86,879
  930,58 -> 206,782
  538,925 -> 242,925
  379,890 -> 704,565
  338,350 -> 338,419
  916,870 -> 916,283
  101,928 -> 402,627
  899,696 -> 899,179
  96,62 -> 658,624
  950,46 -> 11,985
  914,510 -> 910,510
  98,116 -> 556,116
  165,151 -> 913,899
  822,76 -> 41,76
  878,97 -> 75,900
  476,623 -> 873,623
  257,494 -> 746,983
  638,23 -> 638,778
  969,212 -> 259,212
  186,146 -> 923,883
  799,822 -> 736,822
  628,876 -> 532,780
  388,604 -> 388,617
  591,949 -> 868,949
  92,372 -> 107,357
  274,691 -> 254,671
  169,917 -> 169,317
  792,27 -> 710,27
  215,645 -> 713,147
  886,498 -> 689,498
  955,129 -> 214,870
  561,380 -> 375,380
  391,849 -> 391,75
  181,677 -> 759,677
  347,394 -> 347,969
  52,383 -> 875,383
  498,827 -> 729,596
  125,832 -> 125,18
  799,711 -> 105,711
  952,884 -> 129,61
  123,269 -> 123,906
  792,934 -> 12,154
  955,253 -> 753,253
  676,957 -> 676,264
  437,35 -> 40,35
  661,166 -> 509,14
  72,978 -> 270,978
  554,472 -> 554,627
  914,291 -> 464,741
  450,841 -> 827,841
  846,694 -> 846,281
  391,97 -> 890,596
  859,512 -> 685,338
  349,564 -> 349,187
  473,442 -> 896,19
  383,949 -> 383,276
  568,596 -> 875,596
  298,43 -> 298,504
  482,632 -> 12,632
  44,441 -> 44,978
  210,502 -> 210,712
  191,391 -> 191,196
  27,683 -> 27,840
  47,13 -> 960,926
  81,779 -> 81,952
  914,96 -> 145,96
  444,175 -> 151,175
  293,934 -> 293,488
  106,867 -> 221,982
  669,576 -> 858,576
  713,142 -> 84,771
  60,923 -> 299,923
  376,307 -> 281,307
  904,53 -> 41,916
  763,495 -> 588,495
  62,899 -> 843,899
  63,939 -> 592,410
  294,588 -> 294,437
  920,101 -> 879,142
  688,527 -> 688,357
  679,854 -> 950,854
  636,765 -> 329,765
  939,87 -> 62,87
  952,560 -> 952,193
  466,761 -> 32,327
  189,245 -> 876,932
  42,675 -> 42,311
  787,257 -> 62,982
  934,983 -> 64,113
  548,522 -> 626,522
  942,322 -> 942,276
  267,298 -> 267,385
  632,241 -> 632,117
  192,644 -> 192,507
  627,33 -> 627,175
  350,650 -> 350,157
  807,239 -> 113,933
  294,713 -> 87,713
  81,530 -> 453,530
  539,61 -> 240,61
  893,76 -> 893,776
  39,49 -> 978,988
  733,17 -> 606,144
  19,408 -> 493,408
  364,639 -> 43,639
  873,946 -> 69,142
  825,875 -> 233,875
  708,408 -> 197,919
  990,202 -> 990,32
  370,393 -> 664,393
  764,472 -> 284,472
  308,685 -> 308,541
  917,68 -> 45,940
  397,794 -> 524,667
  525,674 -> 313,462
  475,981 -> 297,981
  728,152 -> 40,840
  265,257 -> 162,257
  621,847 -> 828,640
  547,927 -> 21,401
  351,676 -> 357,676
  668,640 -> 668,228
  138,736 -> 446,736
  912,687 -> 912,817
  718,278 -> 718,779
  674,786 -> 986,474
  812,273 -> 891,273
  46,341 -> 46,831
  404,464 -> 118,464
  277,926 -> 114,763
  231,786 -> 106,786
  266,721 -> 446,541
  42,80 -> 675,713
  422,116 -> 422,344
  922,543 -> 922,511
  525,150 -> 525,599
  862,288 -> 498,288
  961,432 -> 961,693
  895,876 -> 895,837
  619,361 -> 174,361
  275,673 -> 275,415
  950,179 -> 405,179
  460,460 -> 460,405
  222,872 -> 222,959
  451,403 -> 21,833
  570,367 -> 570,147
  260,792 -> 82,970
  586,159 -> 108,159
  956,25 -> 55,926
  71,645 -> 988,645
  540,438 -> 44,934
  230,160 -> 395,160
  811,106 -> 811,598
  819,741 -> 596,741
  347,731 -> 347,198
  503,580 -> 495,580
  30,706 -> 603,133
  257,498 -> 619,498
  232,784 -> 359,784
  826,708 -> 396,708
  14,977 -> 895,96
  964,192 -> 279,192
  611,282 -> 611,460
  207,903 -> 207,882
  969,10 -> 22,957
  403,599 -> 970,32
  712,671 -> 712,733
  795,422 -> 235,422
  47,965 -> 939,73
  925,839 -> 275,189
  102,593 -> 973,593
  389,768 -> 389,493
  234,365 -> 624,365
  50,901 -> 50,702
  345,573 -> 638,866
  798,280 -> 111,967
  258,556 -> 258,978
  966,57 -> 88,935
  171,279 -> 171,130
  238,727 -> 947,727
  683,777 -> 290,777
  552,308 -> 552,150
  81,91 -> 911,921
  845,698 -> 845,735
  712,241 -> 26,927
  120,813 -> 716,217
  947,10 -> 25,932
  395,381 -> 338,324
  408,989 -> 408,529
  600,574 -> 600,557
  46,567 -> 46,980
  983,14 -> 10,987
  984,568 -> 642,568
  543,250 -> 543,80
  765,534 -> 108,534
  89,213 -> 120,213
  893,813 -> 271,191
  133,178 -> 133,654
  468,689 -> 468,677
  970,203 -> 970,952
  892,322 -> 892,417
  593,735 -> 152,294
  839,75 -> 839,964
  746,413 -> 89,413
  535,595 -> 535,633
  771,646 -> 614,489
  572,852 -> 572,718
  125,35 -> 838,748
  122,812 -> 179,812
  467,243 -> 188,243
  713,850 -> 51,188
  633,279 -> 932,578
  428,230 -> 216,18
  94,921 -> 973,42
  513,609 -> 513,507
  826,358 -> 330,854
  """

  test "part1" do
    assert AoC.Day05.part1(@test_input) == 5
    assert AoC.Day05.part1(@input) == 5294
  end

  test "part2" do
    assert AoC.Day05.part2(@test_input) == 12
    assert AoC.Day05.part2(@input) == 21698
  end
end
