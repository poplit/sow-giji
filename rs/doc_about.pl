package SWDocAbout;

#----------------------------------------
# 概略
#----------------------------------------

#----------------------------------------
# コンストラクタ
#----------------------------------------
sub new {
	my ($class, $sow) = @_;
	my $self = {
		sow   => $sow,
		title => "$sow->{'cfg'}->{'NAME_SW'}とは？", # タイトル
	};

	return bless($self, $class);
}

#----------------------------------------
# 概略の表示
#----------------------------------------
sub outhtml {
	my $self = shift;
	my $sow = $self->{'sow'};
	my $cfg   = $sow->{'cfg'};
	my $net = $sow->{'html'}->{'net'}; # Null End Tag
	my $atr_id = $sow->{'html'}->{'atr_id'};

	print <<"_HTML_";
<DIV class=toppage>
<h2>$sow->{'cfg'}->{'NAME_SW'}のご紹介</h2>
<h3>そもそも「人狼ゲーム」って何？？？</h3>
<p class="paragraph">
村人と人狼との、村の存続をかけた戦いを楽しむゲームです。
</p>

<p class="paragraph">
人狼は自分の正体がばれないよう、普段は村人として振る舞います。そして一日につき一人村人を食い殺していきます。<br$net>
村人は人狼を退治するため、人狼と思われる人を一日につき一人処刑していきます。
</p>

<p class="paragraph">
首尾よく村人側が人狼たちを全員退治できれば村人側の勝ちです。<br$net>
村人側がずっと間違え続けて罪のない村人ばかりを処刑してしまい、村人の人数が人狼の人数以下にまで減ってしまったら、人狼側の勝ちになります。<br$net>
村人と人狼の中に、時には妖精と呼ばれる第三勢力が、漁夫の利を狙って紛れ込むこともあります。
</p>
<hr class="invisible_hr"$net>

<p class="paragraph">
このシステムを利用して、キャラクターで物語を紡ぐ村も存在します。<br$net>
<a href="http://utage.sytes.net/rp/sow.cgi">RP州</a>は、そのために遊びやすいことを目標にしていますので、一度ご覧下さい。
</p>

<h3>$sow->{'cfg'}->{'NAME_SW'}のスタンス</h3>
<p class="paragraph">
この国の各州では、人狼スクリプトを利用したいかなる遊び方も禁止しておりません。ただし、遊ぶうえでサーバーには負荷がかかります。各州は同一のサーバーを共用していますので、あまりにも重い利用をすると、他村も含めて不便を強いられる結果になる場合も、考えられます。<br$net>
公園で遊ぶとき程度には、他村にも気を配ってあげてください。<br$net>
「○○でなければ人狼ではない」というような言い方はしませんが、そういった言葉を選ぶことを禁じません。人の言葉に振り回されるばかりにならないよう、強い心を持ってください。
</p>

<h3>$sow->{'cfg'}->{'NAME_SW'}の運営について。</h3>
<p class="paragraph">
この国は自宅のサーバーにより稼働しています。<br$net>
通信回線の不調、自宅のルーターの不調、サーバーの不調などで、アクセス不能\になってしまうことも希にはありますが、迅速に復旧する保証はありません。（流行の「ベストエフォート」というやつです。）<br$net>
また、不慮の事故でログが失われた場合、最大で１２時間、巻き戻る可能\性があります。<br$net>
</p>

<p class="paragraph">
$cfg->{'NAME_SW'}は ninjin氏作<a href="http://homepage2.nifty.com/ninjinia/">人狼BBS</a>のクローンです。ただし人狼BBSと違い時間によって村が自動生成される事はありません。これは管理人またはプレイヤーが自分で村を作成して楽しむ「カスタム村専用人狼BBS」なのです。
</p>
<hr class="invisible_hr"$net>
</DIV>
_HTML_

}

1;
