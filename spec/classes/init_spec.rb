require 'spec_helper'

describe 'nacs_management', :type => 'class' do
  it { should contain_class('nacs_management') }
  
  context 'operatingsystem => Darwin' do
    let(:facts) { { :operatingsystem => 'Darwin'} }
  end

  context 'operatingsystem => windows' do
  	let(:facts) { { :operatingsystem => 'windows'} }
  end

  context 'operatingsystem => Ubuntu' do
  	let(:facts) { { :operatingsystem => 'Ubuntu'} }
  end
 #let(:facts) { {:operatingsystem => 'Darwin' } }

#  describe 'with operatingsystem equals windows' do
#	let(:facts) { {:operatingsystem => 'windows'} }
#	it { should contain_class('nacs_management') }

#	it do should contain_file('C:/NACSManage').with(
#      'ensure' => 'directory',
#      'owner'  => 'Administrator',
#      'group'  => 'Administrators',
#      'mode'   => '0755',
#	)
#	end
#  end
end
