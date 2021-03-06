package SWHtmlMakeVil;

#----------------------------------------
# 村作成完了画面のHTML出力
#----------------------------------------
sub OutHTMLMakeVil {
	my ($sow, $vil) = @_;
	my $cfg = $sow->{'cfg'};
	my $query = $sow->{'query'};

	require "$sow->{'cfg'}->{'DIR_LIB'}/file_vil.pl";
	require "$sow->{'cfg'}->{'DIR_HTML'}/html_vinfo_pc.pl";
	require "$sow->{'cfg'}->{'DIR_HTML'}/html_formpl_pc.pl";

	my $vmode = '作成';
	my $infotext = 'を作成';
	if ($sow->{'query'}->{'cmd'} eq 'editvil') {
		$vmode = '編集';
		$infotext = 'の設定を変更';
	}

	$sow->{'html'} = SWHtml->new($sow); # HTMLモードの初期化
	my $net = $sow->{'html'}->{'net'}; # Null End Tag
	$sow->{'http'}->outheader(); # HTTPヘッダの出力
	$sow->{'html'}->outheader("$vmode完了"); # HTMLヘッダの出力
	$sow->{'html'}->outcontentheader();

	&SWHtmlPC::OutHTMLLogin($sow); # ログインボタン表示
    &SWHtmlPC::OutHTMLChangeCSS($sow);

	my $reqvals = &SWBase::GetRequestValues($sow);
	$reqvals->{'vid'} = $query->{'vid'};
	my $linkvalue = &SWBase::GetLinkValues($sow, $reqvals);
	my $urlsow = "$cfg->{'BASEDIR_CGI'}/$cfg->{'FILE_SOW'}";

	&SWHtmlPC::OutHTMLGonInit($sow); # ログイン欄の出力
	$vil->gon_story();
	$vil->gon_event();
	$vil->gon_potofs();
	# 村建て人フォーム／管理人フォーム表示
	if ($sow->{'user'}->logined() > 0) {
		if ($vil->{'makeruid'} eq $sow->{'uid'}) {
			&SWHtmlPlayerFormPC::OutHTMLUpdateSessionButtonPC($sow, $vil);
		}
		if ($sow->{'uid'} eq $sow->{'cfg'}->{'USERID_ADMIN'}) {
			&SWHtmlPlayerFormPC::OutHTMLUpdateSessionButtonPC($sow, $vil);
			&SWHtmlPlayerFormPC::OutHTMLScrapVilButtonPC($sow, $vil) if ($vil->{'turn'} < $vil->{'epilogue'});
		}
	}
	print <<"_HTML_";
</script>
<h2>$vmode完了</h2>

<p class="info"><a href="$urlsow?$linkvalue">$query->{'vid'} $query->{'vname'}</a>$infotextしました。</p>

_HTML_

	# 村データの読み込み
	my $vil = SWFileVil->new($sow, $query->{'vid'});
	$vil->readvil();
	$vil->closevil();

	&SWHtmlVilInfo::OutHTMLVilInfoInner($sow,$vil);

	&SWHtmlPC::OutHTMLReturnPC($sow); # トップページへ戻る


	$sow->{'html'}->outcontentfooter();
	$sow->{'html'}->outfooter(); # HTMLフッタの出力
	$sow->{'http'}->outfooter();

	return;
}

1;
