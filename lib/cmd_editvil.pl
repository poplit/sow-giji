package SWCmdEditVil;

#----------------------------------------
# 村編集完了表示
#----------------------------------------
sub CmdEditVil {
	my $sow = $_[0];

	# 村編集処理
	my $vil = &SetDataCmdEditVil($sow);

	# HTML出力
	require "$sow->{'cfg'}->{'DIR_HTML'}/html.pl";
	require "$sow->{'cfg'}->{'DIR_HTML'}/html_makevil.pl";
	&SWHtmlMakeVil::OutHTMLMakeVil($sow, $vil);
}

#----------------------------------------
# 村編集処理
#----------------------------------------
sub SetDataCmdEditVil {
	my $sow  = $_[0];
	my $query  = $sow->{'query'};

	require "$sow->{'cfg'}->{'DIR_LIB'}/file_vindex.pl";
	require "$sow->{'cfg'}->{'DIR_LIB'}/file_vil.pl";
	require "$sow->{'cfg'}->{'DIR_LIB'}/log.pl";
	require "$sow->{'cfg'}->{'DIR_LIB'}/file_log.pl";

	# 村データの読み込み
	my $vil = SWFileVil->new($sow, $query->{'vid'});
	$vil->readvil();


	my $trsid = $sow->{'cfg'}->{'DEFAULT_TEXTRS'};
	$trsid = $query->{'trsid'} if (defined($query->{'trsid'}));

	# 村データの変更
	my $vstatus = $sow->{'VSTATUSID_PRO'};

	require "$sow->{'cfg'}->{'DIR_LIB'}/vld_makevil.pl";
	my $fullmanage    = ( $vil->{'turn'} == 0 );
	my $summarymanage = ( $vil->isepilogue() );
	if ( $fullmanage ) {
		&SWValidityMakeVil::CheckValidityMakeVil($sow);

		$vil->{'vname'}        = $query->{'vname'};
		$vil->{'vcomment'}     = $query->{'vcomment'};
		$vil->{'vcomment'}     = $sow->{'basictrs'}->{'NONE_TEXT'} if ($vil->{'vcomment'} eq '');
		$vil->{'trsid'}        = $trsid;
		$vil->{'csid'}         = $query->{'csid'};
		$vil->{'roletable'}    = $query->{'roletable'};
		$vil->{'updhour'}      = $query->{'hour'};
		$vil->{'updminite'}    = $query->{'minite'};
		$vil->{'updinterval'}  = $query->{'updinterval'};
		$vil->{'vplcnt'}       = $query->{'vplcnt'};
		$vil->{'entrylimit'}   = $query->{'entrylimit'};
		$vil->{'entrypwd'}     = $query->{'entrypwd'};
		$vil->{'rating'}       = $query->{'rating'};

		$vil->{'vplcntstart'}  = $query->{'vplcntstart'};
		$vil->{'vplcntstart'}  = 0 if (!defined($vil->{'vplcntstart'}));
		$vil->{'saycnttype'}   = $query->{'saycnttype'};
		$vil->{'nextupdatedt'} = $sow->{'dt'}->getnextupdatedt($vil, $sow->{'time'}, 1, 0);
		$vil->{'nextchargedt'} = $sow->{'dt'}->getnextupdatedt($vil, $sow->{'time'}, 1, 0);
		$vil->{'votetype'}     = $query->{'votetype'};
		$vil->{'starttype'}    = $query->{'starttype'};
		$vil->{'randomtarget'} = 0;
		$vil->{'randomtarget'} = 1 if (($sow->{'cfg'}->{'ENABLED_RANDOMTARGET'} > 0) && ($query->{'randomtarget'} ne ''));
		$vil->{'showid'}       = 0;
		$vil->{'showid'}       = 1 if ($query->{'showid'} ne '');
		$vil->{'aiming'}       = 0;
		$vil->{'aiming'}       = 1 if ($query->{'aiming'} ne '');
		$vil->{'undead'}       = 0;
		$vil->{'undead'}       = 1 if ($query->{'undead'} ne '');
		$vil->{'noselrole'}    = 0;
		$vil->{'noselrole'}    = 1 if ($query->{'noselrole'} ne '');
		$vil->{'seqevent'}     = 0;
		$vil->{'seqevent'}     = 1 if ($query->{'seqevent'} ne '');
		$vil->{'entrust'}      = 0;
		$vil->{'entrust'}      = 1 if ($query->{'entrust'} ne '');
		$vil->{'mob'}          = $query->{'mob'};
		$vil->{'game'}         = $query->{'game'};

		my $cntmob = 0;
		$cntmob = $query->{"cntmob"} if (defined($query->{"cntmob"}));
		$vil->{"cntmob"} = int($cntmob);

		my $roleid = $sow->{'ROLEID'};
		for ($i = 1; $i < @$roleid; $i++) {
			my $countrole = 0;
			$countrole = $query->{"cnt$roleid->[$i]"} if (defined($query->{"cnt$roleid->[$i]"}));
			$vil->{"cnt$roleid->[$i]"} = int($countrole);
		}

		my $giftid = $sow->{'GIFTID'};
		for ($i = 1; $i < @$giftid; $i++) {
			my $countgift = 0;
			$countgift = $query->{"cnt$giftid->[$i]"} if (defined($query->{"cnt$giftid->[$i]"}));
			$vil->{"cnt$giftid->[$i]"} = int($countgift);
		}

		$vil->{'eventcard'} = $query->{'eventcard'};
	} elsif ( $summarymanage ) {
		&SWValidityMakeVil::CheckValidityMakeVilSummary($sow);
		$vil->{'vname'}        = $query->{'vname'};
		$vil->{'rating'}       = $query->{'rating'};
	} else {
		&SWValidityMakeVil::CheckValidityMakeVil($sow);
		return ;
	}

	# 村データの書き込み
	$vil->writevil();

	# アナウンス
	my $logfile = SWBoa->new($sow, $vil, $vil->{'turn'}, 0);
	$logfile->writeinfo('', $sow->{'MESTYPE_INFONOM'}, '村の設定が変更されました。');
	$logfile->close();

	$vil->closevil();

	# 村一覧データの更新
	my $vindex = SWFileVIndex->new($sow);
	$vindex->openvindex();
	my $vindexsingle = $vindex->{'vi'}->{$vil->{'vid'}};
	$vindexsingle->{'vname'}     = $vil->{'vname'},
	$vindexsingle->{'updhour'}   = $vil->{'updhour'},
	$vindexsingle->{'updminite'} = $vil->{'updminite'},
	$vindexsingle->{'vstatus'}   = $vil->getvstatus(),
	$vindex->writevindex();
	$vindex->closevindex();

	$sow->{'debug'}->writeaplog($sow->{'APLOG_POSTED'}, "Edit Vil. [uid=$sow->{'uid'}]");

	return $vil;
}

1;
