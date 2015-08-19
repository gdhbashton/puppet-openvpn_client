require 'spec_helper'

describe 'openvpn_client' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "openvpn_client class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('openvpn_client::params') }
          it { is_expected.to contain_class('openvpn_client::install') }
          it { is_expected.to contain_class('openvpn_client::service') }
          it { is_expected.to contain_class('openvpn_client') \
            .that_requires('openvpn_client::service')}

          it { is_expected.to contain_service('openvpn') }
          it { is_expected.to contain_package('openvpn') \
            .with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'openvpn_client class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('openvpn_client') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
