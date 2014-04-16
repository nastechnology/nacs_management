
require 'spec_helper'

describe 'nacs_management::scriptrunner' do

  it 'should contain scritRunnerPkg dmg' do
    should contain_package('scriptRunnerPkg-1.3.dmg')
  end

  it 'should contain directory scriptrunner' do
    should contain_file('/opt/NACSManage/scriptRunner').with({
      'ensure'  => 'directory',
      'owner'   => 'root',
      'group'   => 'wheel',
      'mode'    => '0755',
    })
  end

  it 'should contain directory scriptrunner/once' do
    should contain_file('/opt/NACSManage/scriptRunner/once').with({
      'ensure'  => 'directory',
      'owner'   => 'root',
      'group'   => 'wheel',
      'mode'    => '0755',
    })
  end

  it 'should contain directory scriptrunner/every' do
    should contain_file('/opt/NACSManage/scriptRunner/every').with({
      'ensure'  => 'directory',
      'owner'   => 'root',
      'group'   => 'wheel',
      'mode'    => '0755',
    })
  end
  
end
