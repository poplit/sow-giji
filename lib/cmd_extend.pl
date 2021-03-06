package SWCmdExtend;

#----------------------------------------
# 延長処理（暫定）
#----------------------------------------
sub CmdExtend {
	my $sow = $_[0];
	my $query = $sow->{'query'};
	my $cfg   = $sow->{'cfg'};

	# データ処理
	my $vil = &SetDataCmdExtend($sow);

	# HTTP/HTML出力
	if ($sow->{'outmode'} eq 'mb') {
		# 村ログ表示
		require "$sow->{'cfg'}->{'DIR_LIB'}/cmd_vlog.pl";
		&SWCmdVLog::OutHTMLCmdVLog($sow, $vil);
	} else {
		my $reqvals = &SWBase::GetRequestValues($sow);
		my $link = &SWBase::GetLinkValues($sow, $reqvals);
		$link = "$cfg->{'URL_SW'}/$cfg->{'FILE_SOW'}?$link#newsay";

		$sow->{'http'}->{'location'} = "$link";
		$sow->{'http'}->outheader(); # HTTPヘッダの出力
		$sow->{'http'}->outfooter();
	}
}

#----------------------------------------
# データ処理
#----------------------------------------
sub SetDataCmdExtend {
	my $sow = $_[0];
	my $query  = $sow->{'query'};
	my $debug = $sow->{'debug'};
	my $errfrom = "[uid=$sow->{'uid'}, cmd=$query->{'cmd'}]";

	# 村データの読み込み
	require "$sow->{'cfg'}->{'DIR_LIB'}/file_vil.pl";
	my $vil = SWFileVil->new($sow, $query->{'vid'});
	$vil->readvil();

	# リソースの読み込み
	&SWBase::LoadVilRS($sow, $vil);

	$sow->{'debug'}->raise($sow->{'APLOG_NOTICE'}, "管理人か、村立て人でなくてはいけません。", "no permition.$errfrom") if (($sow->{'uid'} ne $vil->{'makeruid'})&&($sow->{'uid'} ne $sow->{'cfg'}->{'USERID_ADMIN'}));
	$sow->{'debug'}->raise($sow->{'APLOG_NOTICE'}, "延長回数の上限を超えています。", "no more extend.$errfrom") if (($vil->{'extend'} == 0)&&($sow->{'uid'} ne $sow->{'cfg'}->{'USERID_ADMIN'}));
	$vil->{'extend'}       = $vil->{'extend'} - 1 if ($sow->{'uid'} ne $sow->{'cfg'}->{'USERID_ADMIN'});
	$vil->{'nextupdatedt'} = $vil->{'nextupdatedt'} + 24 * 60 * 60;
	# 村データの書き込み
	$vil->writevil();

	# アナウンス
	require "$sow->{'cfg'}->{'DIR_LIB'}/log.pl";
	require "$sow->{'cfg'}->{'DIR_LIB'}/file_log.pl";
	my $logfile = SWBoa->new($sow, $vil, $vil->{'turn'}, 0);
	$logfile->writeinfo('', $sow->{'MESTYPE_INFONOM'}, '村の更新日が延長されました。');
	$logfile->close();

	$vil->closevil();

	return $vil;
}

1;