package SWTextRS_secret;

sub GetTextRS {
   my ($sow)=@_;
   require "$sow->{'cfg'}->{'DIR_RS'}/trs_all.pl";
   my $textrs = &SWTextRS_all::GetTextRS($sow);

   my @announce_first = (
      '�����ꂽ��ԁB<br>�����߂�ꂽ�v���C���[�����B<br>�g�����v��͂����d�|�����O��Ȃ��B<br>�^����ꂽ�Q�[���̏������N���A���Ȃ���΁A���̎d�|���͔�������Ƃ����B�v���C���[�����͓˔@�˂�����ꂽ�����ɔ��M���^�Ȃ�����A�݂��ɏ�����������ׂ��W���n�߂��B',
      '<b>�Q�[���̊J�n��������ꂽ�B</b><br>���̂悤�ȃQ�[���������Ȃ킯���Ȃ��B���������𓭂����Ȃ�����A�v���C���[�����͎���ɗ^����ꂽ�����������m�F�����B�S�̕Ћ�����N��������s���ɓ˂���������A�����c�邽�߂ɍs�����J�n�����̂��B',
      '�ڂ̑O�ɓ]����A���Đl�Ԃ��������m�B<br>�Q�[���͌����������B�v���C���[�͔ۉ��Ȃ����̏󋵂��󂯓����B����͎d�|���̉��������͂��ꂼ��قȂ�A�N���ǂ̎d�|���������Ă���̂��킩��Ȃ��Ƃ����Q�[���B<br><br><sup>�����̏����͉B���Ȃ���΁B</sup><sub>�������P�ƍs���͕s���B</sub><sup>�ق��̃v���C���[�Ƌ�������ׂ����B</sup><sub>�����ď����𖾂������B</sub><br><sup>�c�c����A�܂āB</sup><sub>�����͉R�����Ă���񂶂�Ȃ����H</sub><br>�u�Ȃ�΁A�E�����O�ɂ������\�v<br><br>�^�S�ËS�A�����Ď��ւ̋��|���A�������v���C���[�����̓����Ɨ�����I��ł����B',
   );

  # ���s���b�Z�[�W
  my @announce_winner = (
    '�S�Ă̐l�����������������A�����Ɏc��͈̂�̉��H',
    '�S�Ă̐l�T��ގ������c�c�B�l�T�ɋ�������X�͋������̂��I�����A�܋��̎R�������͂��߂悤�B',
    '���l�B�͎���̉߂��ɋC�t�����B<br>�l�T�B�͍Ō�̏P�����ς܂��A�܋��̎R�������͂��߂�B',

    '���l�B�͋C�t���Ă��܂����B�����^�������K�v�Ȃ�ĂȂ����ƂɁB<br>�l���T���֌W�Ȃ��A���̂悤�Ȑ������n�܂�c',
    '�S�Ă̐l�T��ގ������c�c�B<br>�����A�d���Ƃ����^�̏����҂ɁA�Ō�܂ŋC�t�����Ƃ̂Ȃ������҂ɂ́A�܋��͂Ȃ������c�c',
    '���̎��A�l�T�͏������m�M���A�����ď��߂ĉ߂��ɋC�Â����B<br>�������A�V�G����d���𓢂��R�炵���l�T�ɂ́A�ő��Ȃ����ׂ��Ȃ������c�c',

    '���l�B�́A�����Đl�T�B������̉߂��ɋC�t�����B<br>�ǓƂȈ�C�T�͍Ō�̏P�����ς܂��A�܋�����ɗ��������Ă������B',
    '���l���A�l�T���A�d���ł������A���l�����̑O�ł͖��͂ł����B<br>�K���Ō�Ɉ��͏��̂ł��B',
    '�^���͂������Ƃ肾����I�񂾁B���ׂĂ����߂����Ƃ���̂����A���E�́A�i���ɋ���ɐ����r��镗��́A����ɒ���ł����c�c�B',

    '�S�Ă̐l�����������������A�����Ɏc��͈̂�̉��H',
  );


   # �A�N�V����
   my @actions = (
    '�ɑ��Â���ł����B',
    '�ɋ������B',
    '�ɋ������B',
    '�ɏƂꂽ�B',
    '���������B',
    '�ɍ��f�����B',
    '�Ɋ��ӂ����B',
    '�ɔ��΂񂾁B',
    '�ɔ��肵���B',
    '�Ɏ��U�����B',
    '�Ɏ���X�����B',
    '�ɂ����V�������B',
    '�ɂނ��イ�����B',
    '�ɕʂ���������B',
    '�ɂЂǂ����낽�����B',
    '�ɂ�������ׁ[�������B',
    '�ɃN���N�V������炵���B',
    '�ɋނ�Řd�G�������o�����B',
    '�Ƃɂ��Ɣ��΂݂������B',
    '�ւ̑O����P�񂵂��B',
    '���瓦���o�����I�������A��荞�܂�Ă��܂����I',
    '�������ƌ��߂��B',
    '��M���̖ڂŌ����B',
    '�����b�����Ɍ����B',
    '��s�M�̖ڂŌ����B',
    '���w�������B',
    '���������B',
    '���x�������B',
    '���Ԃ߂��B',
    '���Ԃ߂�U��������B',
    '�������Y���ɂ����B',
    '����̔ޕ��ɂԂ���΂����B',
    '��������߂��B',
    '�����ꎞ�Ԗ₢�߂��B',
    '�̓��𕏂ł��B',
    '�Ƀ^���C�𗎂Ƃ����B',
    '���n���Z���ŉ������B',
    '�̃`���R���[�g���ؗp�����B',
   );

   $textrs->{'CAPTION'}       = '�A�d�ɏW���Ӓ�';
   $textrs->{'HELP'}          = '���ׂĂ̖�E�A���b�A�������y���ނ��Ƃ��ł��܂��B���Ќ����l�������ɂ��A�|�M�����Q���҂����̉^���𖡂킢�܂��傤�B';

   $textrs->{'ANNOUNCE_FIRST'}   = \@announce_first;
   $textrs->{'ANNOUNCE_WINNER'}  = \@announce_winner;

   $textrs->{'ACTIONS'}        = \@actions;
   delete $textrs->{'ACTIONS_CLEARANCE_UP'};
   delete $textrs->{'ACTIONS_CLEARANCE_DOWN'};
   delete $textrs->{'ACTIONS_CLEARANCE_NG'};
   delete $textrs->{'ACTIONS_ZAP'};
   delete $textrs->{'ACTIONS_ZAPCOUNT'};

   return $textrs;
}

1;