require 'spec_helper'

describe 'nacs_management::tmutil', :type => :define do
  let(:title) { '1010346' }
  #let(:userbackup) { "1010346B" }
  let(:facts){ {:dropbox => 'installed', :googledrive => 'installed'} }
  
  it 'enable tmutil' do 
  	should contain_exec('EnableTmutil').only_with_command("/usr/bin/tmutil enable")
  end

  it 'should setdestination to xserve.nacswildcats.org/TimeMachines' do 
  	should contain_exec('Set1010346BDestination').only_with(
  	    'command' => "/usr/bin/tmutil setdestination afp://1010346B:backup@xserve.nacswildcats.org/TimeMachines",
  	    'require' => "Exec[EnableTmutil]",
  	)
  end

  it 'should addexclusion for remove user desktop' do
  	should contain_exec('Remove1010346BDesktop').only_with(
  		'command' => "/usr/bin/tmutil addexclusion /Users/1010346/Desktop",
  		'require' => "Exec[Set1010346BDestination]",
  	)
  end

  it 'should addexclusion for dropbox if fact is set' do
    should contain_exec('Remove1010346BDropbox').only_with(
    	'command' => "/usr/bin/tmutil addexclusion /Users/1010346/Dropbox",
    )
  end

  it 'should addexclusion for googledrive if fact is set' do
  	should contain_exec('Remove1010346BGoogleDrive').only_with(
  		'command' => "/usr/bin/tmutil addexclusion /Users/1010346/Google\\ Drive"
  	)
  end
end