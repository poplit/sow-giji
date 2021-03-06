package SWResource_TAG;

#----------------------------------------
# キャラクタータグ
#----------------------------------------

sub GetTag {
  # タグの名前
  my %tag_name = (
    'giji' => '人狼議事',
    'shoji' => 'てやんでえ',
    'travel' => '帰還者議事',
    'stratos' => '明後日への道標',
    'myth' => 'はおうのひろば',
    'asia' => '大陸議事',
    'marchen' => '狂騒議事',
    'kid' => '(児童)',
    'young' => '(若者)',
    'middle' => '(中年)',
    'elder' => '(老人)',
    'river' => '-運河-',
    'road' => '-往来-',
    'immoral' => '-裏道-',
    'guild' => '-商工会-',
    'elegant' => '-舞踏会-',
    'ecclesia' => '-公教会-',
    'medical' => '-施療院-',
    'market' => '-歌劇酒場-',
    'apartment' => '-自室の窓-',
    'servant' => '-使用人-',
    'farm' => '-森の農場-',
    'government' => '-統治公共-',
    'god' => '-かみさま-',
    'all' => 'すべて',
  );  

  my %tagset = (
    TAG_NAME       => \%tag_name,
  );

  return \%tagset;
}

1;
