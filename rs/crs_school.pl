package SWResource_school;

#----------------------------------------
# キャラセット
#----------------------------------------

sub GetRSChr {
  my $sow = $_[0];

  my $maker = $sow->{'cfg'}->{'CID_MAKER'};
  my $admin = $sow->{'cfg'}->{'CID_ADMIN'};


  # 表\示順
  my @all = ('c49', 'c38', 'c77', 'c35', 'c53', 'c74', 'c50', 'c36', 'c26', 'c09', 'c55', 'c29', 'c12', 'c34', 'c44', 'c11', 'c10', 'c70', 'c56', 'c07', 'c41', 'c58', 'c17', 'c39', 'c40', 'c65', 'c59', 'c57', 'c04', 'c46', 'c14', 'c42', 'c37', 'c75', 'c32', 'c33', 'c02', 'c66', 'c24', 'c79', 'c61', 'c23', 'c28', 'c68', 'c30', 'c21', 'c52', 'c51', 'c01', 'c69', 'c63', 'c05', 'c22', 'c62', 'c13', 'c18', 'c27', 'c08', 'c19', 'c71', 'c03', 'c43', 'c15', 'c54', 'c25', 'c20', 'c72', 'c105', 'c73', 'c47', 'c80', 'c96', 'c104', 'c106', 'c95', 'c108', 'c97', 'c98', 'c100', 'c101', 'c90', 'c88', 'c16', 'c89', 'c84', 'c85', 'c91', 'c92', 'c93', 'c82', 'c78', 'c102', 'c94', 'c64', 'c109', 'c81', 'c67', 'c107', 'c76', 'c60', 'c87', 'c45', 'c48', 'c86', 'c103', 'c83', 'c31', 'c99');
  my @giji = ('c49', 'c38', 'c77', 'c35', 'c53', 'c74', 'c50', 'c36', 'c26', 'c09', 'c55', 'c29', 'c12', 'c34', 'c44', 'c11', 'c10', 'c70', 'c56', 'c07', 'c41', 'c58', 'c17', 'c39', 'c40', 'c65', 'c59', 'c57', 'c04', 'c46', 'c14', 'c42', 'c37', 'c75', 'c32', 'c33', 'c02', 'c66', 'c24', 'c79', 'c61', 'c23', 'c28', 'c68', 'c30', 'c21', 'c52', 'c51', 'c01', 'c69', 'c63', 'c05', 'c22', 'c62', 'c13', 'c18', 'c27', 'c08', 'c19', 'c71', 'c03', 'c43', 'c15', 'c54', 'c25', 'c20', 'c72', 'c105', 'c73', 'c47', 'c80', 'c96', 'c104', 'c106', 'c95', 'c108', 'c97', 'c98', 'c100', 'c101', 'c90', 'c88', 'c16', 'c89', 'c84', 'c85', 'c91', 'c92', 'c93', 'c82', 'c78', 'c102', 'c94', 'c64', 'c109', 'c81', 'c67', 'c107', 'c76', 'c60', 'c87', 'c45', 'c48', 'c86', 'c103', 'c83', 'c31', 'c99');
  my @guild = ('c49', 'c35', 'c50', 'c36', 'c26', 'c29', 'c56', 'c07', 'c39', 'c66', 'c21', 'c69', 'c63', 'c08', 'c54', 'c72', 'c106', 'c95', 'c100', 'c81', 'c67', 'c31');
  my @young = ('c49', 'c38', 'c77', 'c74', 'c50', 'c36', 'c26', 'c29', 'c44', 'c70', 'c41', 'c59', 'c57', 'c46', 'c42', 'c37', 'c79', 'c28', 'c30', 'c21', 'c52', 'c51', 'c01', 'c63', 'c05', 'c27', 'c08', 'c19', 'c71', 'c54', 'c25', 'c20', 'c72', 'c105', 'c73', 'c47', 'c80', 'c104', 'c95', 'c108', 'c97', 'c100', 'c101', 'c90', 'c16', 'c89', 'c92', 'c93', 'c109', 'c81', 'c67', 'c87', 'c45', 'c103', 'c83', 'c31', 'c99');
  my @market = ('c38', 'c74', 'c56', 'c17', 'c37', 'c75', 'c68', 'c30', 'c01', 'c69', 'c19', 'c73', 'c88', 'c16', 'c78', 'c102', 'c94', 'c83');
  my @servant = ('c77', 'c36', 'c12', 'c34', 'c70', 'c39', 'c40', 'c04', 'c42', 'c66', 'c101', 'c88', 'c85', 'c91', 'c92', 'c93', 'c82');
  my @road = ('c77', 'c12', 'c34', 'c30', 'c01', 'c71', 'c15', 'c80', 'c95', 'c85', 'c83');
  my @farm = ('c77', 'c53', 'c66', 'c61', 'c21', 'c22', 'c27', 'c71', 'c43', 'c108', 'c90', 'c81');
  my @middle = ('c35', 'c09', 'c55', 'c12', 'c56', 'c58', 'c17', 'c39', 'c65', 'c57', 'c04', 'c46', 'c75', 'c02', 'c66', 'c23', 'c68', 'c21', 'c69', 'c22', 'c62', 'c03', 'c43', 'c15', 'c96', 'c106', 'c108', 'c97', 'c98', 'c88', 'c84', 'c91', 'c78', 'c94', 'c64', 'c107', 'c48', 'c86', 'c99');
  my @government = ('c53', 'c50', 'c02', 'c24', 'c79', 'c15', 'c96', 'c97', 'c90');
  my @elegant = ('c53', 'c55', 'c11', 'c68', 'c25', 'c20', 'c94', 'c107', 'c60', 'c87', 'c48');
  my @elder = ('c53', 'c07', 'c58', 'c40', 'c24', 'c61', 'c68', 'c13', 'c18', 'c102', 'c107', 'c48');
  my @immoral = ('c09', 'c44', 'c41', 'c65', 'c68', 'c62', 'c19', 'c73', 'c98', 'c94', 'c64', 'c45', 'c86');
  my @river = ('c09', 'c41', 'c61', 'c30', 'c62', 'c47', 'c106', 'c97', 'c98', 'c90', 'c91', 'c92', 'c93');
  my @apartment = ('c55', 'c11', 'c10', 'c70', 'c46', 'c32', 'c33', 'c24', 'c79', 'c28', 'c105', 'c80', 'c101', 'c16', 'c89', 'c84', 'c109', 'c76', 'c86', 'c103', 'c31', 'c99');
  my @kid = ('c34', 'c11', 'c10', 'c14', 'c32', 'c33', 'c85', 'c82', 'c76', 'c60');
  my @ecclesia = ('c58', 'c59', 'c57', 'c14', 'c23', 'c52', 'c51', 'c105', 'c47', 'c96');
  my @medical = ('c46', 'c52', 'c51', 'c05', 'c13', 'c18', 'c03', 'c54', 'c104', 'c16', 'c81', 'c87', 'c83');
  my %chrorder = (
    'all' => \@all,
    'giji' => \@giji,
    'guild' => \@guild,
    'young' => \@young,
    'market' => \@market,
    'servant' => \@servant,
    'road' => \@road,
    'farm' => \@farm,
    'middle' => \@middle,
    'government' => \@government,
    'elegant' => \@elegant,
    'elder' => \@elder,
    'immoral' => \@immoral,
    'river' => \@river,
    'apartment' => \@apartment,
    'kid' => \@kid,
    'ecclesia' => \@ecclesia,
    'medical' => \@medical,
  );

  my @tag_order = ('giji', 'kid', 'young', 'middle', 'elder', 'river', 'road', 'immoral', 'guild', 'elegant', 'ecclesia', 'medical', 'market', 'apartment', 'servant', 'farm', 'government');
  my @order = ('c49', 'c38', 'c77', 'c35', 'c53', 'c74', 'c50', 'c36', 'c26', 'c09', 'c55', 'c29', 'c12', 'c34', 'c44', 'c11', 'c10', 'c70', 'c56', 'c07', 'c41', 'c58', 'c17', 'c39', 'c40', 'c65', 'c59', 'c57', 'c04', 'c46', 'c14', 'c42', 'c37', 'c75', 'c32', 'c33', 'c02', 'c66', 'c24', 'c79', 'c61', 'c23', 'c28', 'c68', 'c30', 'c21', 'c52', 'c51', 'c01', 'c69', 'c63', 'c05', 'c22', 'c62', 'c13', 'c18', 'c27', 'c08', 'c19', 'c71', 'c03', 'c43', 'c15', 'c54', 'c25', 'c20', 'c72', 'c105', 'c73', 'c47', 'c80', 'c96', 'c104', 'c106', 'c95', 'c108', 'c97', 'c98', 'c100', 'c101', 'c90', 'c88', 'c16', 'c89', 'c84', 'c85', 'c91', 'c92', 'c93', 'c82', 'c78', 'c102', 'c94', 'c64', 'c109', 'c81', 'c67', 'c107', 'c76', 'c60', 'c87', 'c45', 'c48', 'c86', 'c103', 'c83', 'c31', 'c99');


  # キャラの肩書き
  my %chrjob = (
    'c01' => '華道部',
    'c02' => '校長',
    'c03' => '化学教師',
    'c04' => 'ＳＯＳ団',
    'c05' => '留年生',
    'c07' => '歴史教師',
    'c08' => '図書委員',
    'c09' => '動く銅像',
    'c10' => 'ミーハー',
    'c100' => 'サッカー部',
    'c101' => '園芸部',
    'c102' => '前校長',
    'c103' => 'オカルト同好会',
    'c104' => '剣道部',
    'c105' => '弓道部',
    'c106' => '水泳部顧問',
    'c107' => '前理事長',
    'c108' => '無線部',
    'c109' => '占い研究会',
    'c11' => '優等生',
    'c12' => '用務員',
    'c13' => '生物教師',
    'c14' => 'コーラス部',
    'c15' => '地理教師',
    'c16' => '食堂のおねいさん',
    'c17' => '演劇部顧問',
    'c18' => '数学教師',
    'c19' => 'チアリーダー',
    'c20' => '理事長の孫',
    'c21' => '球部顧問',
    'c22' => '農業科',
    'c23' => '現国教師',
    'c24' => '理事長',
    'c25' => '校長の孫',
    'c26' => '吹奏楽部',
    'c27' => '手芸部',
    'c28' => '文芸部',
    'c29' => '新聞部',
    'c30' => '飼育委員',
    'c31' => '漫画研究部',
    'c32' => '演劇部',
    'c33' => '演劇部',
    'c34' => '球児',
    'c35' => '体育教師',
    'c36' => '美術部',
    'c37' => '音楽教師',
    'c38' => '軽音楽部',
    'c39' => '家政科教師',
    'c40' => '教頭先生',
    'c41' => '登山部',
    'c42' => '生徒会執行部',
    'c43' => '番長',
    'c44' => '問題児',
    'c45' => 'スケバン',
    'c46' => '保険医',
    'c47' => '転校生',
    'c48' => '美術教師',
    'c49' => '技術教師',
    'c50' => '風紀委員',
    'c51' => '幽霊部員',
    'c52' => '映画研究会',
    'c53' => '寮管理人',
    'c54' => '野球部',
    'c55' => '肖像画',
    'c56' => '世界史教師',
    'c57' => '修士',
    'c58' => '名誉教授',
    'c59' => '修士',
    'c60' => 'ラクロス部',
    'c61' => '魚拓部',
    'c62' => '守衛',
    'c63' => 'マネージャー',
    'c64' => '格闘技同好会',
    'c65' => '教育実習',
    'c66' => '茶道部顧問',
    'c67' => '購買部',
    'c68' => '後援者',
    'c69' => '陶芸部',
    'c70' => '先輩',
    'c71' => '帰宅部',
    'c72' => 'ヴィジュアル系バンド部',
    'c73' => 'チアガール',
    'c74' => '社交ダンス部',
    'c75' => '演奏講師',
    'c76' => '委員長',
    'c77' => 'いきもの係',
    'c78' => '演劇部',
    'c79' => '水泳部',
    'c80' => '陸上部',
    'c81' => '科学部',
    'c82' => 'ガリ勉',
    'c83' => '放送部',
    'c84' => '講師',
    'c85' => 'おてんば',
    'c86' => '柔道部',
    'c87' => '天文部',
    'c88' => '栄養士',
    'c89' => '新任教師',
    'c90' => 'ラグビー部',
    'c91' => '緑のおばさん',
    'c92' => 'テニス部',
    'c93' => '書道部',
    'c94' => 'PTA会長',
    'c95' => '人体模型',
    'c96' => '助教授',
    'c97' => '駐在さん',
    'c98' => '教授',
    'c99' => '不登校児',
    $maker => '校内放送',
    $admin => '校内放送',
  );

  # キャラの名前
  my %chrname = (
    'c01' => 'メアリー',
    'c02' => 'アルフレッド',
    'c03' => 'スティーブン',
    'c04' => 'ノーリーン',
    'c05' => 'キャサリン',
    'c07' => 'ティモシー',
    'c08' => 'ベネット',
    'c09' => 'ヒロシ',
    'c10' => 'ゾーイ',
    'c100' => 'グレッグ',
    'c101' => 'クラリッサ',
    'c102' => 'ウォーレン',
    'c103' => 'ナンシー',
    'c104' => 'ヒュー',
    'c105' => 'シメオン',
    'c106' => 'ワンダ',
    'c107' => 'イヴォン',
    'c108' => 'ブローリン',
    'c109' => 'ラディスラヴァ',
    'c11' => 'カルヴィン',
    'c12' => 'バーナバス',
    'c13' => 'ロミオ',
    'c14' => 'レティーシャ',
    'c15' => 'ウェーズリー',
    'c16' => 'マリアンヌ',
    'c17' => 'ユリシーズ',
    'c18' => 'エマ',
    'c19' => 'タバサ',
    'c20' => 'グロリア',
    'c21' => 'ニール',
    'c22' => 'ワット',
    'c23' => 'チャールズ',
    'c24' => 'ナタリア',
    'c25' => 'ルーカス',
    'c26' => 'モニカ',
    'c27' => 'リンダ',
    'c28' => 'ケイト',
    'c29' => 'イアン',
    'c30' => 'フィリップ',
    'c31' => 'ネル',
    'c32' => 'オスカー',
    'c33' => 'ホリー',
    'c34' => 'トニー',
    'c35' => 'ダン',
    'c36' => 'ミッシェル',
    'c37' => 'セシル',
    'c38' => 'コリーン',
    'c39' => 'シビル',
    'c40' => 'ハワード',
    'c41' => 'ヤニク',
    'c42' => 'ラルフ',
    'c43' => 'ガストン',
    'c44' => 'ドナルド',
    'c45' => 'プリシラ',
    'c46' => 'ゲイル',
    'c47' => 'ペラジー',
    'c48' => 'ビアンカ',
    'c49' => 'ボリス',
    'c50' => 'ディーン',
    'c51' => 'ヨーランダ',
    'c52' => 'ギリアン',
    'c53' => 'ゼルダ',
    'c54' => 'ザック',
    'c55' => 'パピヨン',
    'c56' => 'ゴドウィン',
    'c57' => 'ツェツィーリヤ',
    'c58' => 'ブルーノ',
    'c59' => 'ムパムピス',
    'c60' => 'ポーチュラカ',
    'c61' => 'ヌマタロウ',
    'c62' => 'ヴェラ',
    'c63' => 'ピッパ',
    'c64' => 'ヘクター',
    'c65' => 'ズリエル',
    'c66' => 'クリストファー',
    'c67' => 'ソ\フィア',
    'c68' => 'ヨアヒム',
    'c69' => 'ギネス',
    'c70' => 'パティ',
    'c71' => 'ノックス',
    'c72' => 'ヴェスパタイン',
    'c73' => 'ローズマリー',
    'c74' => 'フランシスカ',
    'c75' => 'ビリー',
    'c76' => 'ジョージ',
    'c77' => 'キャロライナ',
    'c78' => 'ネイサン',
    'c79' => 'マーゴ',
    'c80' => 'テッド',
    'c81' => 'サイラス',
    'c82' => 'ロビン',
    'c83' => 'アイリス',
    'c84' => 'ブレンダ',
    'c85' => 'ハナ',
    'c86' => 'ホレーショー',
    'c87' => 'エリアス',
    'c88' => 'ピエール',
    'c89' => 'カトリーナ',
    'c90' => 'ケヴィン',
    'c91' => 'ドロシー',
    'c92' => 'セレスト',
    'c93' => 'ベッキー',
    'c94' => 'ダーラ',
    'c95' => 'モリス',
    'c96' => 'レオナルド',
    'c97' => 'ジェフ',
    'c98' => 'オズワルド',
    'c99' => 'サイモン',
    $maker    => '（村建て人）',
    $admin    => '（管理人）',
  );

  # ダミーキャラの発言
  my @npcsay =(
    "嗚呼、聞こえる。やつの足音が聞こえる……。",
    "逃げろ。逃げろ！おまえらだけでも逃げろ。",
  );

  my @expression = (
  );

  my %charset = (
    CAPTION        => '私立七転学園',
    NPCID          => 'c99',
    TAG_ORDER      => \@tag_order,
    CHRORDER       => \%chrorder,
    CHRNAME        => \%chrname,
    CHRJOB         => \%chrjob,
    ORDER          => \@order,
    NPCSAY         => \@npcsay,
    IMGFACEW       => 90,
    IMGFACEH       => 130,
    IMGBODYW       => 90,
    IMGBODYH       => 130,
    DIR            => "$sow->{'cfg'}->{'DIR_IMG'}/portrate",
    EXT            => '.jpg',
    BODY           => '',
    FACE           => '',
    GRAVE          => '',
    EXPRESSION     => \@expression,
    LAYOUT_NAME    => 'right',
  );

  return \%charset;
}

1;
