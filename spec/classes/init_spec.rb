require 'spec_helper'

describe "nacs_management", :type => 'class' do
    describe 'with operatingsystem equals Darwin' do
	let(:facts) { {:operatingsystem => 'Darwin'} }
	it { should contain_class('nacs_management') }
	it do should contain_file('/opt/NACSManage').with(
	    'ensure' => 'directory',
	    'owner'  => 'technology',
	    'group'  => 'staff',
	    'mode'   => '0755',
	)
	end
    end

    describe 'with operatingsystem equals windows' do
	let(:facts) { {:operatingsystem => 'windows'} }
	it { should contain_class('nacs_management') }

	it do should contain_file('C:/NACSManage').with(
	    'ensure' => 'directory',
	    'owner'  => 'Administrator',
	    'group'  => 'Administrators',
	    'mode'   => '0755',
	)
	end
    end
end
