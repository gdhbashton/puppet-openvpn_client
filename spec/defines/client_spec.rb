require 'spec_helper'

describe 'openvpn_client::client', :type => :define do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:title) { 'test_client' }
        let(:facts) do
          facts
        end

        context "openvpn_client class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_openvpn_client__client('test_client') }

          it { is_expected.to contain_file('/etc/openvpn/test_client.conf') \
            .that_notifies('Service[openvpn]') }
        end
      end
    end
  end
end
