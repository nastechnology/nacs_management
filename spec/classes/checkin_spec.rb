require 'spec_helper'

describe 'nacs_management::checkin'  do
    describe 'operatingsystem is Darwin' do 
	let(:facts) { {:operatingsystem => 'Darwin'} }
	#let(:node) { 'nas-tc' }

	it { should contain_class('nacs_management::checkin') }    	
	
	it do
	    should contain_file('/opt/NACSManage/checkin.sh').with(
      	    'ensure' => 'file',
      	    'owner'  => 'technology',
      	    'group'  => 'staff',
      	    'mode'   => '0755',
    	)
	end

    end

    describe 'operating system is windows' do
	let(:facts) { {:operatingsystem => 'windows', :fqdn => 'nas-tc.nas.local'} }

	it do 
	    should contain_file('C:/NACSManage/checkin.bat').with(
	    'ensure' => 'file',
	    'owner'  => 'Administrator',
	    'group'  => 'Administrators',
	    'mode'   => '0755',
	)
	end
    end
end
